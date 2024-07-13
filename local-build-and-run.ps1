Write-Host "1. Running GitHub Actions workflow..." -ForegroundColor Yellow
act push -v

Write-Host "2. Checking and building Docker image..." -ForegroundColor Yellow
$imageExists = docker images -q elysian
if (-not $imageExists) {
    Write-Host "Docker image does not exist. Building a new one." -ForegroundColor Yellow
    docker build --no-cache -t elysian .
} else {
    Write-Host "Using existing Docker image." -ForegroundColor Green
    docker build --no-cache -t elysian .
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "3. Docker image is ready! Preparing to run the container..." -ForegroundColor Green
    
    Write-Host "4. Checking and removing containers using port 80..." -ForegroundColor Yellow
    $containersUsingPort = docker ps -aq --filter "publish=80"
    if ($containersUsingPort) {
        docker stop $containersUsingPort
        docker rm $containersUsingPort
    }

    Write-Host "5. Stopping and removing existing elysian-container..." -ForegroundColor Yellow
    docker stop elysian-container 2>$null
    docker rm elysian-container 2>$null

    Write-Host "6. Running new Docker container..." -ForegroundColor Yellow
    docker run -d -p 80:8080 --name elysian-container elysian

    Start-Sleep -Seconds 10  # Wait 10 seconds for the container to fully start

    Write-Host "7. Application is running at http://stu14.sist.co.kr:80/hotel_prj/index.html" -ForegroundColor Green
    
    # Check container status
    $containerStatus = docker inspect -f '{{.State.Status}}' elysian-container
    if ($containerStatus -eq "running") {
        Write-Host "8. Container is running successfully." -ForegroundColor Green
    } else {
        Write-Host "9. There is an issue with the container. Status: $containerStatus" -ForegroundColor Red
    }
} else {
    Write-Host "Docker image build failed. Please check the logs." -ForegroundColor Red
}
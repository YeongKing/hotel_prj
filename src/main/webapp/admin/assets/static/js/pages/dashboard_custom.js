var roomResvWeekly = {
  series: [
  {
    name: "체크인",
    data: [28, 29, 23, 26, 22, 22, 23]
  },
  {
    name: "체크아웃",
    data: [12, 11, 14, 18, 17, 13, 13]
  }
],
  chart: {
  height: 350,
  type: 'line',
  dropShadow: {
    enabled: true,
    color: '#000',
    top: 18,
    left: 7,
    blur: 10,
    opacity: 0.2
  },
  zoom: {
    enabled: false
  },
  toolbar: {
    show: false
  }
},
colors: ['#FF7976', '#57CAEB'],
dataLabels: {
  enabled: true,
},
stroke: {
  curve: 'smooth'
},
title: {
  text: 'Weekly Reservation Status for Rooms',
  align: 'left'
},
grid: {
  borderColor: '#FFFFFF',
  row: {
    colors: ['transparent', 'transparent'], // takes an array which will be repeated on columns
    opacity: 0.5
  },
},
markers: {
  size: 1
},
xaxis: {
  categories: ['월', '화', '수', '목', '금', '토', '일'],
  title: {
    text: 'Week'
  }
},
yaxis: {
  title: {
    text: 'Total Number'
  },
  min: 0,
  max: 30
},
legend: {
  position: 'top',
  horizontalAlign: 'right',
  floating: true,
  offsetY: -25,
  offsetX: -5
}
};

var diningResvWeekly = {
  series: [
  {
    name: "예약",
    data: [28, 29, 23, 26, 22, 22, 23]
  },
  {
    name: "취소",
    data: [12, 11, 14, 18, 17, 13, 13]
  }
],
  chart: {
  height: 350,
  type: 'line',
  dropShadow: {
    enabled: true,
    color: '#000',
    top: 18,
    left: 7,
    blur: 10,
    opacity: 0.2
  },
  zoom: {
    enabled: false
  },
  toolbar: {
    show: false
  }
},
colors: ['#FF7976', '#57CAEB'],
dataLabels: {
  enabled: true,
},
stroke: {
  curve: 'smooth'
},
title: {
  text: 'Weekly Reservation Status for Dinings',
  align: 'left'
},
grid: {
  borderColor: '#FFFFFF',
  row: {
    colors: ['transparent', 'transparent'], // takes an array which will be repeated on columns
    opacity: 0.5
  },
},
markers: {
  size: 1
},
xaxis: {
  categories: ['월', '화', '수', '목', '금', '토', '일'],
  title: {
    text: 'Week'
  }
},
yaxis: {
  title: {
    text: 'Total Number'
  },
  min: 0,
  max: 30
},
legend: {
  position: 'top',
  horizontalAlign: 'right',
  floating: true,
  offsetY: -25,
  offsetX: -5
}
};


var roomResvWeeklyChart = new ApexCharts(document.querySelector("#room-resv-weekly"), roomResvWeekly)
var diningResvWeeklyChart = new ApexCharts(document.querySelector("#dining-resv-weekly"), diningResvWeekly)

roomResvWeeklyChart.render()
diningResvWeeklyChart.render()

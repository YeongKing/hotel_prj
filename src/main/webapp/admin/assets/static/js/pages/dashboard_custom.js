var checkinDateArr = [];
var checkinRatioArr = [];
var checkoutDateArr = [];
var checkoutRatioArr = [];

function loadRoomChartData() {
	$.ajax({
		url: 'dashboardRoomChartData.do',
		type: 'GET',
		dataType: 'json',
		data: '',
		error: function(xhr) {
			console.log(xhr.status);
			alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
		},
		success: function(data) {
			checkinDateArr = data.map(data => data.checkinDate);
			checkinRatioArr = data.map(data => data.checkinRatio).map(str => parseFloat(str));
			checkoutDateArr = data.map(data => data.checkoutDate);
			checkoutRatioArr = data.map(data => data.checkoutRatio).map(str => parseFloat(str));
			
			displayRoomDataArr();
		}
	}); // ajax
} // loadRoomChartData

function displayRoomDataArr() {
	var roomResvWeekly = {
	  series: [
	  {
	    name: "체크인",
	    data: checkinRatioArr
	  },
	  {
	    name: "체크아웃",
	    data: checkoutRatioArr
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
	  categories: checkinDateArr,
	  title: {
	    text: 'Week'
	  }
	},
	yaxis: {
	  title: {
	    text: 'Total Number'
	  },
	  min: 0,
	  max: 100
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
	roomResvWeeklyChart.render()
} // displayRoomDataArr

var visitDateArr = [];
var reservedRatioArr = [];
var canceledRatioArr = [];

function loadDiningChartData() {
	$.ajax({
		url: 'dashboardDiningChartData.do',
		type: 'GET',
		dataType: 'json',
		data: '',
		error: function(xhr) {
			console.log(xhr.status);
			alert("문제가 발생했습니다. 담당자에게 문의해주세요.");
		},
		success: function(data) {
			visitDateArr = data.map(data => data.visitDate);
			reservedRatioArr = data.map(data => data.reservedRatio).map(str => parseFloat(str));
			canceledRatioArr = data.map(data => data.canceledRatio).map(str => parseFloat(str));
			
			displayDiningDataArr();
		}
	}); // ajax
} // loadRoomChartData

function displayDiningDataArr() {
	var diningResvWeekly = {
	  series: [
	  {
	    name: "예약",
	    data: reservedRatioArr
	  },
	  {
	    name: "취소",
	    data: canceledRatioArr
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
	  categories: visitDateArr,
	  title: {
	    text: 'Week'
	  }
	},
	yaxis: {
	  title: {
	    text: 'Total Number'
	  },
	  min: 0,
	  max: 100
	},
	legend: {
	  position: 'top',
	  horizontalAlign: 'right',
	  floating: true,
	  offsetY: -25,
	  offsetX: -5
	}
	};

	var diningResvWeeklyChart = new ApexCharts(document.querySelector("#dining-resv-weekly"), diningResvWeekly)
	diningResvWeeklyChart.render()
} // displayDiningDataArr
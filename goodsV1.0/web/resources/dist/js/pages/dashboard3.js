$(function () {
  'use strict'

	
	function getContextPath() {

		var hostIndex = location.href.indexOf( location.host ) + location.host.length;

		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

	}

	
	function sortObject(o)
	{
	    var sorted = {},
	    key, a = [];

	    // 키이름을 추출하여 배열에 집어넣음
	    for (key in o) {
	        if (o.hasOwnProperty(key)) a.push(key);
	    }

	    // 키이름 배열을 정렬
	    a.sort();

	    // 정렬된 키이름 배열을 이용하여 object 재구성
	    for (key=0; key<a.length; key++) {
	        sorted[a[key]] = o[a[key]];
	    }
	    return sorted;
	}




	var visit_date = new Array();
	var visitor_cnt = new Array();
	
	$.ajax({
		url:getContextPath()+"/admin/ajaxGetVisitor",
		type:"get",
		dataType:"json",
		async:false,
		success:function(data){
			data = sortObject(data);
			for(var key in data){
				visit_date.push(key);
				visitor_cnt.push(Number(data[key]));
			}
		}
	});
	
	
	var sales_date = new Array();
	var sales_cnt = new Array();
	
	$.ajax({
		url:getContextPath()+"/admin/getSales",
		type:"get",
		dataType:"json",
		async:false,
		success:function(data){
			data = sortObject(data);
			for(var key in data){
				sales_date.push(key);
				sales_cnt.push(Number(data[key]));
			}
		}
	});
	
  var ticksStyle = {
    fontColor: '#495057',
    fontStyle: 'bold'
  }

  var mode      = 'index'
  var intersect = true

  var $salesChart = $('#sales-chart')
  var salesChart  = new Chart($salesChart, {
    type   : 'bar',
    data   : {
      /*labels  : ['JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],*/
      labels  : sales_date,
      datasets: [
        {
          backgroundColor: '#007bff',
          borderColor    : '#007bff',
          /*data           : [1000, 2000, 3000, 2500, 2700, 2500, 3000]*/
          data           : sales_cnt
        }/*,
        {
          backgroundColor: '#ced4da',
          borderColor    : '#ced4da',
          data           : [700, 1700, 2700, 2000, 1800, 1500, 2000]
        }*/
      ]
    },
    options: {
      maintainAspectRatio: false,
      tooltips           : {
        mode     : mode,
        intersect: intersect
      },
      hover              : {
        mode     : mode,
        intersect: intersect
      },
      legend             : {
        display: false
      },
      scales             : {
        yAxes: [{
          // display: false,
          gridLines: {
            display      : true,
            lineWidth    : '4px',
            color        : 'rgba(0, 0, 0, .2)',
            zeroLineColor: 'transparent'
          },
          ticks    : $.extend({
            beginAtZero: true,

            // Include a dollar sign in the ticks
            callback: function (value, index, values) {
              if (value >= 10000) {
                value /= 10000
                value += '만원'
              }
              return value
            }
          }, ticksStyle)
        }],
        xAxes: [{
          display  : true,
          gridLines: {
            display: false
          },
          ticks    : ticksStyle
        }]
      }
    }
  })

  var $visitorsChart = $('#visitors-chart')
  var visitorsChart  = new Chart($visitorsChart, {
    data   : {
      labels  : visit_date,
      datasets: [{
        type                : 'line',
        data                : visitor_cnt,
        backgroundColor     : 'transparent',
        borderColor         : '#007bff',
        pointBorderColor    : '#007bff',
        pointBackgroundColor: '#007bff',
        fill                : false
        // pointHoverBackgroundColor: '#007bff',
        // pointHoverBorderColor    : '#007bff'
      }]
    },
    options: {
      maintainAspectRatio: false,
      tooltips           : {
        mode     : mode,
        intersect: intersect
      },
      hover              : {
        mode     : mode,
        intersect: intersect
      },
      legend             : {
        display: false
      },
      scales             : {
        yAxes: [{
          // display: false,
          gridLines: {
            display      : true,
            lineWidth    : '4px',
            color        : 'rgba(0, 0, 0, .2)',
            zeroLineColor: 'transparent'
          },
          ticks    : $.extend({
            beginAtZero : true,
            suggestedMax: 100
          }, ticksStyle)
        }],
        xAxes: [{
          display  : true,
          gridLines: {
            display: false
          },
          ticks    : ticksStyle
        }]
      }
    }
  })
})

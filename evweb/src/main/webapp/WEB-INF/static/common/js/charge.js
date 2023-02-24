function highchartday(chargedata,date) {
Highcharts.chart('chargeday', {
    chart: {
        type: 'bar'
    },
    title: {
        text: ''
    },
   
    xAxis: {
        categories: [date[0],date[1]],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        softMax: 50,
        title: {
            text: '충전량 [kWh]',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
    },
    tooltip: {
        valueSuffix: ' kWh'
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            },
            pointPadding: 0.002
        }
    },
    legend: {
        enabled: false
    },
    credits: {
        enabled: false
    },
    series: [{
        name: '충전량',
        data: [chargedata[0],chargedata[1]],
        color : '#9BC0D9'
    }]
});
}
function highchartweek(date,chargeweekdata) {
Highcharts.chart('chargeweek', {
    chart: {
        type: 'column'
    },
    title: {
        text: ''
    },
    xAxis: {
        categories: date
    },
    tooltip: {
        valueSuffix: ' kWh'
    },
 	yAxis: {
        min: 0,
        softMax: 50,
        title: {
            text: '충전량 [kWh]',
            align: 'middle'
        },
        labels: {
            overflow: 'justify'
        }
    },
    plotOptions: {
        series: {
        	dataLabels: {
                enabled: true
            },
            pointPadding: 0.0025
        }
    },
 	legend: {
        enabled: false
    },
     credits: {
        enabled: false
    },
    series: [{
    	name: '충전량',
        data: chargeweekdata,
        color : '#3D5B81'
    }]
});
}
function highchartmonth(date,chargemonthdata) {
Highcharts.chart('chargemonth', {
    chart: {
        type: 'column'
    },
    title: {
        text: ''
    },
    xAxis: {
        categories: date
    },
    tooltip: {
        valueSuffix: ' kWh'
    },
 	yAxis: {
        min: 0,
        softMax: 50,
        title: {
            text: '충전량 [kWh]',
            align: 'middle'
        },
        labels: {
            overflow: 'justify'
        }
    },
    plotOptions: {
        series: {
        	dataLabels: {
                enabled: true
            },
            pointPadding: 0.0025
        }
    },
 	legend: {
        enabled: false
    },
     credits: {
        enabled: false
    },
    series: [{
    	name: '충전량',
        data: chargemonthdata,
        color : '#3D5B81'
    }]
});

}
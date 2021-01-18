<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<title>Insert title here</title>

<div style="width:100%;">
<canvas id="canvas" height="300"></canvas>
</div>

<script>

new Chart(document.getElementById("canvas"), {
    type: 'bar',
    data: {
        labels: ['월', '화', '수', '목', '금'],
        datasets: [{
            label: '근무 시간',
            data: [
            	10,
            	3,
            	20,
            	23,
            	10
            	],
            borderColor: "rgba(255, 201, 14, 1)",
            backgroundColor: "rgba(255, 201, 14, 0.5)",
            fill: false,
        }]
    },
    options: {
        responsive: true,
        tooltips: {
            mode: 'index',
            intersect: false,
            callbacks: {
                title: function(tooltipItems, data) {
                    return data.labels[tooltipItems[0].datasetIndex];
                }
            }
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'x축'
                },
                ticks: {
                    autoSkip: false
                }
            }],
            yAxes: [{
                display: true,
                ticks: {
                    suggestedMin: 0,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'y축'
                }
            }]
        }
    }
});

</script>
</head>
<body>



</body>
</html>
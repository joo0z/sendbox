<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart.js</title>
<head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body>
	<canvas id="myChart" style="height:500px; width:50%; margin-left: 10%; margin-top: 5%;"></canvas>

	<script>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets: [{
				label: '# 현 매출',
				data: [40000000, 50000000, 60000000, 60000000,60000000, 70000000,70000000,80000000,80000000,90000000,90000000,100000000],
				backgroundColor: [
						'rgba(0, 0, 0, 0)'
				],
				borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						min: 0,
						max: 100000000,
						fontSize : 20,
					}
				}]
			}
		}
	});
	</script>
</body>
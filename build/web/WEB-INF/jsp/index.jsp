<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <div class="panel-heading">
                <i class="fa fa-bar-chart"></i>
                Estados Proyectos
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
               <div id="graph"></div>
            </div>
            <div class="row">
               <div id="pieChart" style="display: table; margin: 0 auto;"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
// Use Morris.Bar
        Morris.Bar({
            element: 'graph',
            data: [
                {x: '2014', e: 2, f: 3, a: 2, c: 3, t: 3},
                {x: '2015', e: 4, f: 2, a: 5, c: 1, t: 6},
                {x: '2016', e: 1, f: 0, a: 2, c: 4, t: 1},
                {x: '2017', e: 8, f: 2, a: 4, c: 3, t: 0}
            ],
            xkey: 'x',
            ykeys: ['e', 'f', 'a', 'c', 't'],
            labels: ['Ejecución', 'Finalizado', 'Atrasado', 'Cancelado', 'Trasladado']
        }).on('click', function (i, row) {
            console.log(i, row);
        });
    });

    // Load google charts
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    // Draw the chart and set the chart values
    function drawChart() {
      var data = google.visualization.arrayToDataTable(${datosGrafico});

      // Optional; add a title and set the width and height of the chart
      var options = {is3D: true, 'width':900, 'height':500};

      // Display the chart inside the <div> element with id="piechart"
      var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
      chart.draw(data, options);
    }

</script>
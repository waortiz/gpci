<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <div class="panel-heading">
                <i class="fa fa-bar-chart"></i>
                Estado Proyectos
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
        Morris.Bar({
            element: 'graph',
            data: ${datosBarra},
            xkey: 'anyo',
            ykeys: ['ejecucion', 'finalizados', 'atrasados'],
            labels: ['Ejecución', 'Finalizados', 'Atrasados']
        });
    });

    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable(${datosGrafico});
      var options = {is3D: true, 'width':700, 'height':300};
      var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
      chart.draw(data, options);
    }

</script>
<%-- 
    Document   : admin_sales
    Created on : Nov 4, 2023, 3:20:20 PM
    Author     : DELL
--%>

<%@page import="MobileStore.data.Statistic"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <%
        List<Statistic> statistics = (List<Statistic>) request.getAttribute("statistics");
    %>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['table']});
        google.charts.setOnLoadCallback(drawTable);

        function drawTable() {

            // Create a DataTable
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Statistic Date');
            data.addColumn('number', 'Sales Total ($)');
            data.addColumn('number', 'Products Total');
            var statisticsData = [];
        <% for (Statistic statistic : statistics) {%>
            var statistic = {
                statisticDate: '<%= statistic.getStatisticDate()%>',
                totalSales: <%= statistic.getTotalSales()%>,
                totalProduct: <%= statistic.getTotalProduct()%>
            };

            statisticsData.push(statistic);
        <% }%>
            for (var i = 0; i < statisticsData.length; i++) {
                var statistic = statisticsData[i];
                data.addRow([statistic.statisticDate, statistic.totalSales, statistic.totalProduct]);
            }

            var table = new google.visualization.Table(document.getElementById('table_div'));

            table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
        }
    </script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            // Create a DataTable
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Statistic Date');
            data.addColumn('number', 'Products Total');
            var statisticsData = [];
        <% for (Statistic statistic : statistics) {%>
            var statistic = {
                statisticDate: '<%= statistic.getStatisticDate()%>',
                totalProduct: <%= statistic.getTotalProduct()%>
            };

            statisticsData.push(statistic);
        <% }%>
            for (var i = 0; i < statisticsData.length; i++) {
                var statistic = statisticsData[i];
                data.addRow([statistic.statisticDate, statistic.totalProduct]);
            }

            var options = {
                title: 'PRODUCTS STATISTICS',
                pieHole: 0.4
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['bar']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Create a DataTable
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Statistic Date');
            data.addColumn('number', 'Sales Total ($)');
            var statisticsData = [];
        <% for (Statistic statistic : statistics) {%>
            var statistic = {
                statisticDate: '<%= statistic.getStatisticDate()%>',
                totalSales: <%= statistic.getTotalSales()%>
            };

            statisticsData.push(statistic);
        <% }%>
            for (var i = 0; i < statisticsData.length; i++) {
                var statistic = statisticsData[i];
                data.addRow([statistic.statisticDate, statistic.totalSales]);
            }

            var options = {
                title: 'SALES STATISTICS',
                curveType: 'function',
                legend: {position: 'bottom'}
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
    </script>
    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText"><i class="fa-solid fa-magnifying-glass-chart"></i> STATISTICS <i class="fa-solid fa-chart-line"></i></h1>
        </div>
        <div class="app-content-actions">
            <div class="filter-button-wrapper">
                <button class="action-button filter jsFilter"><span>Filter</span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-filter"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg></button>
                <form  action="Statistics" method="post" class="filter-menu" style="right: -150px;">
                    <label>Start Date</label>
                    <input value="${date_start}" type="date" name="start_date" style="width: 200px;"/>
                    <label>End Date</label>
                    <input value="${date_end}" type="date" name="end_date" style="width: 200px;"/>
                    <div class="filter-menu-buttons">
                        <a href="Statistics?AdminStatistics=DateNow" class="filter-button reset" style="text-decoration: none;">
                            Today
                        </a>
                        <button class="filter-button apply">
                            Apply
                        </button>
                        <input type="hidden" name="AdminStatistics" value="load_statistics"/>
                    </div>
                </form>
            </div>
        </div>
        <div class="products-row">
            <div class="product-cell" id="donutchart" style="height: 500px; width: 49%; display: inline-block;"></div>
            <div class="product-cell" id="curve_chart" style="height: 500px; width: 50%; display: inline-block;"></div>
        </div>
        <div class="products-row" id="table_div" style="height: 200px; width: 99%;"></div>
    </div>
</html>

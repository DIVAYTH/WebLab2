<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Table</title>
</head>
<body>
<table class="result" cellspacing="0">
    <tr class="resultHeader">
        <th>Y</th>
        <th>X</th>
        <th>R</th>
        <th>RESULT</th>
        <th>TIME</th>
        <th>BENCHMARK</th>
    </tr>
    <tr class="resultFromServlet">
        <th><%= ((String[]) request.getAttribute("table"))[0] %></th>
        <th><%= ((String[]) request.getAttribute("table"))[1] %></th>
        <th><%= ((String[]) request.getAttribute("table"))[2] %></th>
        <th><%= ((String[]) request.getAttribute("table"))[3] %></th>
        <th><%= ((String[]) request.getAttribute("table"))[4] %></th>
        <th><%= ((String[]) request.getAttribute("table"))[5] %> микрсек</th>
    </tr>
</table>
<a class="backForm" href="control">Перейти на форму</a>
</body>
</html>
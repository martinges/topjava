<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ru">
<head>
    <title>Meals</title>
    <style>
        table {
            width: 100%; /* Ширина таблицы */
            border: 1px double black; /* Рамка вокруг таблицы */
            border-collapse: collapse; /* Отображать только одинарные линии */
        }

        th {
            text-align: center; /* Выравнивание по левому краю */
            background: #fff; /* Цвет фона ячеек */
            padding: 1px; /* Поля вокруг содержимого ячеек */
            border: 1px solid black; /* Граница вокруг ячеек */
        }

        td {
            padding: 1px; /* Поля вокруг содержимого ячеек */
            border: 1px solid black; /* Граница вокруг ячеек */
        }
    </style>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table>
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="mealTo" items="${listMealsTo}">
        <c:if test="${(mealTo.isExcess() == 'true')}">
            <tr style="color: #ff0000">
        </c:if>
        <c:if test="${(mealTo.isExcess() != 'true')}">
            <tr style="color: #00ff00">
        </c:if>
        <td><fmt:parseDate value="${mealTo.getDateTime()}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                           type="both"/>
            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }"/></td>
        <td><c:out value="${mealTo.getDescription()}"/></td>
        <td><c:out value="${mealTo.getCalories()}"/></td>
        <td>Update</td>
        <td>Delete</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

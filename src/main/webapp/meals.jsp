<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table style="border: 1px solid black">
    <th>Date</th>
    <th>Description</th>
    <th>Calories</th>
    <th></th>
    <th></th>

    <c:forEach var="meal" items="${mealTo}">
        <c:if test="${meal.isExcess() == 'true'}" >
            <tr style="color:#FF0000">
        </c:if>
        <c:if test="${meal.isExcess() == 'false'}" >
            <tr style="color:#00ff00">
        </c:if>
        <td><fmt:parseDate value="${meal.getDateTime()}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedDateTime}" /></td>

        <td><c:out value="${meal.getDescription()}" /></td>

        <td><c:out value="${meal.getCalories()}" /></td>
    </tr>
    </c:forEach>

</table>
</body>
</html>

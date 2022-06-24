<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <p>Hello, ${username}</p>
        
        <form action="" method="post">
            <a href="ShoppingList?action=logout">Logout</a>
        </form>
        
        <h2>List</h2>
        
        <!-- Action submitted when adding items to session shopping list -->
        <form action="" method="post">
            <label>Add item: </label>
            <input type="hidden" name="action" value="add">
            <input type="text" name="item" value="">
            <input type="submit" value="Add">
        </form>
        
        <c:if test="${addError != null}">
            <p><i>${addError}</i></p>
        </c:if>
        
        <c:if test="${items != null && items.size() > 0}">
            <!-- Action submitted when deleting items from session shopping list, only if list items present -->
            <form action="" method="post">
                
            <c:forEach var="item" items="${items}">
                <input type="radio" name="shoppingItems" value="${item}">
                <label> ${item}</label>
                <br>
            </c:forEach>
                
                <input type="hidden" name="action" value="delete">
                <input type="submit" value="Delete">
            </form>
        </c:if>
            
        <c:if test="${deleteError != null}">
            <p><i>${deleteError}</i></p>
        </c:if>
    </body>
</html>
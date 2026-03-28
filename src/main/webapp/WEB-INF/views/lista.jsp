<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css" />
</head>
<body>
<div class="container">
    <h1>CRUD de Productos (MVC)</h1>
    <a class="btn" href="${pageContext.request.contextPath}/productos?accion=nuevo">Nuevo producto</a>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productos}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.nombre}</td>
                <td>${p.categoria}</td>
                <td>${p.precio}</td>
                <td>${p.stock}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/productos?accion=editar&id=${p.id}">Editar</a>
                    |
                    <a href="${pageContext.request.contextPath}/productos?accion=eliminar&id=${p.id}" onclick="return confirm('¿Eliminar?');">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

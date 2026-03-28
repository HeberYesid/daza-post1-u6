<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Formulario Producto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css" />
</head>
<body>
<div class="container">
    <h1>${producto.id == 0 ? 'Nuevo Producto' : 'Editar Producto'}</h1>

    <form action="${pageContext.request.contextPath}/productos" method="post">
        <input type="hidden" name="id" value="${producto.id}" />

        <label>Nombre</label>
        <input type="text" name="nombre" value="${producto.nombre}" required />

        <label>Categoría</label>
        <input type="text" name="categoria" value="${producto.categoria}" required />

        <label>Precio</label>
        <input type="number" step="0.01" min="0" name="precio" value="${producto.precio}" required />

        <label>Stock</label>
        <input type="number" min="0" name="stock" value="${producto.stock}" required />

        <button type="submit">Guardar</button>
        <a class="btn-sec" href="${pageContext.request.contextPath}/productos">Cancelar</a>
    </form>
</div>
</body>
</html>

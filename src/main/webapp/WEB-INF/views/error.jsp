<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css" />
</head>
<body>
<div class="container">
    <h1>Se produjo un error</h1>
    <p>${mensaje}</p>
    <a class="btn-sec" href="${pageContext.request.contextPath}/productos">Volver</a>
</div>
</body>
</html>

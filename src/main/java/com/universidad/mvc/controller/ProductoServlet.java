package com.universidad.mvc.controller;

import com.universidad.mvc.model.Producto;
import com.universidad.mvc.service.ProductoService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {

    private final ProductoService service = new ProductoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("nuevo".equals(accion)) {
            request.setAttribute("producto", new Producto());
            reenviar(request, response, "/WEB-INF/views/formulario.jsp");
            return;
        }

        if ("editar".equals(accion)) {
            int id = parseInt(request.getParameter("id"));
            Producto producto = service.buscarPorId(id).orElse(new Producto());
            request.setAttribute("producto", producto);
            reenviar(request, response, "/WEB-INF/views/formulario.jsp");
            return;
        }

        if ("eliminar".equals(accion)) {
            int id = parseInt(request.getParameter("id"));
            service.eliminar(id);
            response.sendRedirect(request.getContextPath() + "/productos");
            return;
        }

        request.setAttribute("productos", service.listar());
        reenviar(request, response, "/WEB-INF/views/lista.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            Producto producto = new Producto();
            producto.setId(parseInt(request.getParameter("id")));
            producto.setNombre(request.getParameter("nombre"));
            producto.setCategoria(request.getParameter("categoria"));
            producto.setPrecio(parseDouble(request.getParameter("precio")));
            producto.setStock(parseInt(request.getParameter("stock")));

            service.guardar(producto);
            response.sendRedirect(request.getContextPath() + "/productos");
        } catch (IllegalArgumentException ex) {
            request.setAttribute("mensaje", ex.getMessage());
            reenviar(request, response, "/WEB-INF/views/error.jsp");
        }
    }

    private void reenviar(HttpServletRequest request, HttpServletResponse response, String vista) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    private int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private double parseDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}

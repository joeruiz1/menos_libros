/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Servicios.Inventario;
import Servicios.Servicios;
import dato.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Index;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LabingXEON
 */
public class index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            RequestDispatcher rq = request.getRequestDispatcher("index.jsp");

            ArrayList<dato.Libro> libros = null;
            Servicios servicios = new Servicios();
            Inventario bd = servicios.leer();
            if (bd != null) {
                libros = bd.getLibros();
                request.setAttribute("libros", libros);
            } else {
                request.setAttribute("libros", null);
            }
            rq.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Index.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String libro = request.getParameter("libro");
        String can = request.getParameter("cantidad");

        int cantidad = Integer.parseInt(can);

        if (name.trim().length() > 0) {

            ArrayList<dato.Libro> libros = null;
            Servicios servicios = new Servicios();
            Inventario bd = null;
            try {
                bd = servicios.leer();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (bd != null) {
                libros = bd.getLibros();
                Libro li = new Libro();

                for (int i = 0; i < libros.size(); i++) {
                    
                    if (libros.get(i).getNombre().equalsIgnoreCase(libro)) {
                        li=libros.get(i);
                        break;
                    }

                }

                //Abrir conexion
                //Cargar lo que hay actualmente en el archivo
                dato.Factura fac = new dato.Factura(name, li, cantidad);
                boolean resultado = false;
                try {
                    resultado = servicios.escribirfactura(fac);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
                }
                //Enviar datos a otro pagina
                RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
                if (resultado == true) {
                    request.setAttribute("resultado", true);
                } else {
                    request.setAttribute("resultado", false);
                }
                rq.forward(request, response);

            }

          
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

<%-- 
    Document   : index
    Created on : 4/09/2017, 10:28:11 AM
    Author     : Labing I5
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

    <head>
        <title>simplestyle_7</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <link rel="stylesheet" type="text/css" href="formato.css" />
    </head>

    <body>
        <div id="main">
            <div id="header">
                <div id="logo">
                    <h1>Sistema Pr&eacute;stamos Laboratorio</h1>
                    <div class="slogan">Pr&eacute;stamos al Instante!</div>
                </div>
                <div id="menubar">
                    <ul id="menu">


                        <li><a href="index">Crear</a></li>
                        <li><a href="estadoCuenta.jsp">Cuentas</a></li>
                        <li><a href="listar">Leer</a></li>
                        <li><a href="borrar.jsp">Borrar</a></li>
                        <li class="current"><a href="Facturas">Facturas</a></li>
                        <li><a href="inventario.jsp">Registar Libro</a></li>
                   
                    </ul>
                </div>
            </div>
            <div id="site_content">
                <div id="sidebar_container">
                    <!-- Inicio presentacion Noticias-->
                    <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
                    <div class="sidebar">
                        <!-- insert your sidebar items here -->
                        <h3>&Uacute;ltimas Noticias</h3>
                        <h4>No hay osciloscopios disponibles</h4>
                        <h5>31 Agosto 2018</h5>
                        <p>Los osciloscopios estan siendo usados en clase de Potencia<br /><a href="#">Read more</a></p>
                    </div>
                    <!-- Final presentacion Noticias-->



                </div>
                <div id="content">
                    <!-- insert the page content here -->
                    <h1>Registro de Facturas</h1>
                    <table>
                        <tr>
                            <td>Cantidad</td>
                            <td>Libro</td>
                            <td>Editorial</td>
                            <td>precio</td>
                            <td>Autor</td>
                            <td>Cliente</td>


                        </tr>
                        <%
                            if (request.getAttribute("facturas") != null) {
                                ArrayList<dato.Factura> facturas = (ArrayList<dato.Factura>) request.getAttribute("facturas");

                                if (facturas != null) {
                                    for (int i = 0; i < facturas.size(); i++) {
                                        dato.Libro ac = new dato.Libro();
                                        ac = facturas.get(i).getLi();

                        %>

                        <tr>  
                            <td><%= facturas.get(i).getCantidad()%></td>
                            <td><%=facturas.get(i).getLi().getNombre()%></td>
                            <td><%=ac.getAutor()%></td>
                            <td><%=ac.getEditorial()%></td>
                            <td><%=ac.getPrecio()%></td>
                            <td><%=facturas.get(i).getNombreCliente()%></td>



                        </tr>

                        <%

                                    }
                                }
                            }
                        %>

                    </table>


                </div>
            </div>
            <div id="footer">
                <p>Copyright &copy; simplestyle_7 | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">design from HTML5webtemplates.co.uk</a></p>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 12/09/2017, 03:53:56 PM
    Author     : Juan Manuel
--%><%@page import="java.util.ArrayList"%>


%@page import="java.util.ArrayList"%>
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
    </head>

    <body>
        <div id="main">
            <div id="header">
                <div id="logo">
                    <h1>Artes Graficas Ruiz</h1>
                    <div class="slogan">Compra y Venta De libros!</div>
                </div>
                <div id="menubar">
                    <ul id="menu">
                        <!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->
                        <li class="current"><a href="index">Crear</a></li>
                        <li><a href="Actualizar.jsp">Actualizar</a></li>
                        <li><a href="Listar">Leer</a></li>
                        <li><a href="borrar.jsp">Borrar</a></li>
                        <li><a href="Facturas">Facturas</a></li>
                        <li><a href="inventario.jsp">Registrar libro</a></li>
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
                    </div>
                    <!-- Final presentacion Noticias-->



                </div>
                <div id="content">
                    <!-- insert the page content here -->
                    <h1>Registro de Prestamos</h1>
                    
                    <%
                        if (request.getAttribute("resultado") != null) {
                            Boolean resultado = (Boolean) request.getAttribute("resultado");
                            if (resultado.booleanValue() == true) {
                    %>
                    <h2> La Compra Se Realizo Correctamente</h2>
                    <%
                    } else {
                    %>     
                    <h2> La compra no se Realizo</h2>
                    <%
                            }
                        }
                    %>
                    <p>Ingrese la informacion solicitada</p>

                    <form action="index" method="POST">
                        <div class="form_settings">
                            <p><span>Nombre Cliente</span>
                                <input class="contact" type="text" name="name" value="" /></p>
                            <p><span>Libro</span>
                                <select class="contact" name="libro" >
                                    <%
                                        //Si la variable que me deben enviar existe  
                                        if (request.getAttribute("libros") != null) {
                                            //Capturando informacion variable que me estan enviado.    
                                            ArrayList<dato.Libro> libros = (ArrayList<dato.Libro>) request.getAttribute("libros");
                                            //Existan activos
                                            if (libros != null) {
                                                for (dato.Libro li : libros) {
                                    %>
                                    <option value="<%=li.getNombre()%>"><%=li.getNombre()%>

                                    </option>
                                    <%
                                                }
                                            } else {

                                            }
                                        }

                                    %>

                                </select>
                            </p>
                            <p><span>Cantidad</span>
                                <input class="contact" type="text" name="cantidad" value="" />
                            </p>
                            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="submit" /></p>
                        </div>
                    </form>

                </div>
            </div>
            <div id="footer">
                <p>Copyright &copy; simplestyle_7 | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">design from HTML5webtemplates.co.uk</a></p>
            </div>
        </div>
    </body>
</html>

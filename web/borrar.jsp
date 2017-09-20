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
                    <div class="slogan">Compra y Venta De Libros Nuevos Y Usados! </div>
                </div>
                <div id="menubar">
                    <ul id="menu">
                        <!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->
                        <li ><a href="index">Crear</a></li>                        
                        <li><a href="estadoCuenta.jsp">Cuentas</a></li>
                        <li><a href="Listar">Leer</a></li>
                        <li class="current"><a href="borrar.jsp">Borrar</a></li>
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
                    </div>
                    <!-- Final presentacion Noticias-->



                </div>
                <div id="content">
                    <!-- insert the page content here -->
                    <h1>Borrar Libros </h1>

                    <%
                        if (request.getAttribute("resultado") != null) {
                            Boolean resultado = (Boolean) request.getAttribute("resultado");
                            if (resultado.booleanValue() == true) {
                    %>
                    <h2> El Libro fue borrado satisfactoriamente</h2>
                    
                    <%
                    } else {
                    %>     
                    <h2> El Libro no fue borrado por que no fue encontrado </h2>
                    <%
                            }
                        }
                    %>




                    <p>Ingrese la informacion solicitada</p>

                    <form action="ControlBorrar" method="post">
                        <div class="form_settings">
                               <p><span>Nombre del libro</span>
                                <input class="contact" type="text" name="nombre" value="" /></p>
                            <p><span>Autor</span>
                                <input class="contact" type="text" name="autor" value="" /></p>
                            <p><span>Editorial</span>
                                <input class="contact" type="text" name="editoral" value="" /></p>
                            <p><span>Precio</span>
                                <input class="contact" type="text" name="precio" value="" /></p>
                            <p><span>Id</span>
                                <input class="contact" type="text" name="id" value="" /></p>
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

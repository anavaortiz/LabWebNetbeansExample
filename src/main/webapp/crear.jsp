<%-- 
    Document   : crear.jsp
    Created on : Mar 16, 2021, 9:14:16 PM
    Author     : manny
--%>

<%@page import="Connectors.Connectors"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" 
              crossorigin="anonymous">
        <title>Registro clientes</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="mb-3">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre"
                                   name="nombre" placeholder="Nombre"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="appat">Apellido paterno</label>
                            <input type="text" class="form-control" id="appat"
                                   name="appat" placeholder="Apellido Paterno"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="apmat">Apellido materno</label>
                            <input type="text" class="form-control" id="apmat"
                                   name="apmat" placeholder="Apellido Materno"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="telefono">Teléfono</label>
                            <input type="text" class="form-control" 
                                   id="telefono" name="telefono" 
                                   placeholder="Teléfono"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" id="email"
                                   name="email" placeholder="Email"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" 
                                   id="direccion"
                                   name="direccion" placeholder="Dirección"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="ciudad">Ciudad</label>
                            <input type="text" class="form-control" id="ciudad"
                                   name="ciudad" placeholder="Ciudad"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="pais">País</label>
                            <input type="text" class="form-control" id="pais"
                                   name="pais" placeholder="País"
                                   required="">
                        </div>

                        <!-- botón cancelar -->
                        <a href="index.jsp" class="btn btn-danger">
                            Cancelar
                            <i class="fa fa-ban" aria-hidden="true"></i>
                        </a>

                        <button type="submit" name="enviar"
                                class="btn btn-primary">Guardar
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre");
                String strApPat = request.getParameter("appat");
                String strApMat = request.getParameter("apmat");
                String strTelefono = request.getParameter("telefono");
                String strEmail = request.getParameter("email");
                String strDireccion = request.getParameter("direccion");
                String strCiudad = request.getParameter("ciudad");
                String strPais = request.getParameter("pais");

                //Connection conn = null;
                Connectors con = new Connectors();
                Connection conn = con.conn();
                Statement st = null;

                try {

                    
                    //Class.forName("com.mysql.cj.jdbc.Driver");

                    //String strConnection = "jdbc:mysql://localhost/Tienda?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=false&useSSL=false";

                    //conn = DriverManager.getConnection(strConnection);
                    st = conn.createStatement();

                    String strQuery = "INSERT INTO "
                            + "Clientes (Nombre, ApellidoPaterno,"
                            + "ApellidoMaterno, Telefono, Email, Direccion,"
                            + "Ciudad, Pais) VALUES ('" + strNombre + "', '"
                            + strApPat + "', '" + strApMat + "', '"
                            + strTelefono + "', '" + strEmail + "', '"
                            + strDireccion + "', '" + strCiudad + "', '"
                            + strPais + "') ;";

                    /*
                    String strQuery = "INSERT INTO "
                            + "Clientes VALUES ('" + strNombre + "', '"
                            + strApPat + "', '" + strApMat + "', '" 
                            + strTelefono + "', '" + strEmail + "', '" 
                            + strDireccion + "', '" + strCiudad + "', '"
                            + strPais + "') ;";
                     */
                    //System.out.print(strQuery);

                    st.executeUpdate(strQuery);
                    
                    strNombre="";
                    strApPat="";
                    strApMat="";
                    strTelefono="";
                    strEmail="";
                    strDireccion="";
                    strCiudad="";
                    strPais="";
                    
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                    //conn.close(); // ... no se si va aquí el cerrar la conexión ...

                } catch (Exception e) {
                    out.print(e);
                } finally {
                    //st.close();
                    conn.close();
                }
            }
        %>

    </body>
</html>

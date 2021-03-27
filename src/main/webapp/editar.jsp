

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
        <title>Edición de datos de cliente</title>
    </head>
    <body>
        <%
            // ... los parámetros deben de ser iguales a los de index.jsp ...
            String strIdCliente = request.getParameter("id");
            String strNombre = request.getParameter("nombre");
            String strApPat = request.getParameter("appat");
            String strApMat = request.getParameter("apmat");
            String strTelefono = request.getParameter("telefono");
            String strEmail = request.getParameter("email");
            String strDireccion = request.getParameter("direccion");
            String strCiudad = request.getParameter("ciudad");
            String strPais = request.getParameter("pais");

        %>

        <div class = "container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="mb-3">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre"
                                   value="<%= strNombre%>" 
                                   name = "nombre" placeholder="Nombre"
                                   required="">
                        </div>

                        <div class="mb-3">
                            <label for="appat">Apellido Paterno
                            </label>
                            <input type="text" class="form-control" 
                                   id="apellidopaterno"
                                   value="<%= strApPat%>" 
                                   name = "appat" 
                                   placeholder="Apellido Paterno"
                                   required="">
                        </div>

                        <div class="mb-3">
                            <label for="apmat">Apellido Materno
                            </label>
                            <input type="text" class="form-control" 
                                   id="apellidomaterno"
                                   value="<%= strApMat%>" 
                                   name = "apmat" 
                                   placeholder="Apellido Materno"
                                   required="">
                        </div>

                        <div class="mb-3">
                            <label for="telefono">Teléfono</label>
                            <input type="text" class="form-control" 
                                   id="telefono"
                                   value="<%= strTelefono%>" 
                                   name = "telefono" placeholder="Teléfono"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="Email">Email</label>
                            <input type="text" class="form-control" id="email"
                                   value="<%= strEmail%>" 
                                   name = "email" placeholder="email"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="direccion">Direccion</label>
                            <input type="text" class="form-control" id="direccion"
                                   value="<%= strDireccion%>" 
                                   name = "direccion" placeholder="Dirección"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="ciudad">Ciudad</label>
                            <input type="text" class="form-control" id="ciudad"
                                   value="<%= strCiudad%>" 
                                   name = "ciudad" placeholder="Ciudad"
                                   required="">
                        </div>
                        <div class="mb-3">
                            <label for="pais">Pais</label>
                            <input type="text" class="form-control" id="pais"
                                   value="<%= strPais%>" 
                                   name = "pais" placeholder="Pais"
                                   required="">
                        </div>

                        <a href="index.jsp" class="btn btn-danger">
                            Cancelar
                            <i class="fa fa-ban" aria-hidden="true"></i>
                        </a>
                        <button type="submit" name="enviar" 
                                class="btn btn-primary">Guardar
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                        </button>
                        <input type="hidden" name="id" value="<%=strIdCliente%>" >
                    </form>
                </div>
            </div>
        </div>
        <%
            //Connection conn = null;
            Connectors con = new Connectors();
            Connection conn = con.conn();
            Statement st = null;
            if (request.getParameter("enviar") != null) {
                try {

                    //String strConnection = "jdbc:mysql://localhost/Tienda?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=true&useSSL=false";
                    //conn = DriverManager.getConnection(strConnection);
                    
                    st = conn.createStatement();

                    String strQuery = "UPDATE Clientes "
                            + "SET Nombre = '" + strNombre + "', "
                            + "ApellidoPaterno = '" + strApPat + "', "
                            + "ApellidoMaterno = '" + strApMat + "', "
                            + "Telefono = '" + strTelefono + "', "
                            + "Email = '" + strEmail + "', "
                            + "Direccion = '" + strDireccion + "', "
                            + "Ciudad = '" + strCiudad + "', "
                            + "Pais = '" + strPais + "' "
                            + "WHERE IDCliente = '" + strIdCliente + "';";

                    //System.out.print(strQuery);
                    st.executeUpdate(strQuery);

                    out.print("Se ha modificado correctamente el registro");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } catch (Exception e) {
                    out.print("Error " + e);
                } finally {
                    st.close();
                    conn.close();
                    
                }
            }
        %>
    </body>
</html>

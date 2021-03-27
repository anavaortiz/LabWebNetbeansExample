<%-- 
    Document   : datosusuario
    Created on : Mar 21, 2021, 7:32:46 PM
    Author     : manny
--%>

<%@page import="Connectors.Connectors"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.*"%>
<%@page import="Utils.Encriptar" %>
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
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession Session = request.getSession();
            // ... Valida la sesión ...
            if (Session.getAttribute("logueado") == null || Session.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

            //Connection conn = null;
            Connectors con = new Connectors();
            Connection conn = con.conn();
            Statement st = null;
            Encriptar enc = new Encriptar();
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" 
                                   name="Usuario" placeholder="Usuario">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="text" class="form-control" 
                                   name="Password1" placeholder="Password">
                        </div>

                        <div class="form-group">
                            <label>Repita password</label>
                            <input type="text" class="form-control" 
                                   name="Password2" 
                                   placeholder="Repita su password">
                        </div>
                        <button type="submit" name="guardar"
                                class="btn btn-primary"> Guardar</button>

                        <a href="index.jsp" class="btn btn-danger">
                            Cancelar
                            <i class="fa fa-ban" aria-hidden="true"></i>
                        </a>

                    </form>
                </div>
            </div>
        </div>
    </body>

    <%
        if (request.getParameter("guardar") != null) {

            String strUsuario = request.getParameter("Usuario");
            String strPassword1 = request.getParameter("Password1");
            String strPassword2 = request.getParameter("Password2");
            //String strConnection = "jdbc:mysql://localhost/Tienda?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=true&useSSL=false";

            /* ... se modifica al encriptar ...
            String strSQL = "UPDATE Usuarios "
                            + "SET Usuario = '" + strUsuario + "', "
                            + "Password = '" + strPassword1 + "' "
                            + "WHERE IDUsuario = '"
                            + Session.getAttribute("id") + "'; " ;
            
             */
            String strSQL = "UPDATE Usuarios "
                    + "SET Usuario = '" + strUsuario + "', "
                    + "Password = '" + enc.getMD5(strPassword1) + "' "
                    + "WHERE IDUsuario = '"
                    + Session.getAttribute("id") + "'; ";

            if (strPassword1.equals(strPassword2)) {
                try {
                    //Class.forName("com.mysql.cj.jdbc.Driver");
                    //conn = DriverManager.getConnection(strConnection);
                    st = conn.createStatement();
                    st.executeUpdate(strSQL);
                    Session.setAttribute("Usuario", strUsuario);

                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                } finally {
                    st.close();
                    conn.close();

                }
            } else {
                out.print("Passwords no coinciden");
            }
        }
    %>
</html>

<%!
    /*
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);

            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    */
%>

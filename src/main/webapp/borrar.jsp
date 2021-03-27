
<%@page import="Connectors.Connectors"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elimina registro cliente</title>
    </head>
    <body>
        <%
            //Connection conn = null;
            Connectors con = new Connectors();
            Connection conn = con.conn();
            Statement st = null;
            ResultSet rs = null;

            try {
                //Class.forName("com.mysql.jdbc.Driver");
                //String strConnection = "jdbc:mysql://localhost/Tienda?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=true&useSSL=true";
                //conn = DriverManager.getConnection(strConnection);
                st = conn.createStatement();
                String strQuery = "DELETE FROM Clientes "
                        + "WHERE IDCliente = '"
                        + request.getParameter("id") + "' ;";
                st.executeUpdate(strQuery);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {

            } finally {
                conn.close();
                rs.close();

            }

        %>
    </body>
</html>

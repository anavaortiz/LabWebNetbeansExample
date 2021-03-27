/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Connectors.Connectors;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author manny
 */
@WebServlet(name = "Clientes", urlPatterns = {"/Clientes"})
public class Clientes extends HttpServlet {

    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connectors con = new Connectors();
            Connection conn = con.conn();
            try {

                //Class.forName("com.mysql.jdbc.Driver");
                //conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=true&useSSL=false");
                //String strConnection = "jdbc:mysql://localhost/Tienda?user=profesor&password=Pepino76$&allowPublicKeyRetrieval=true&useSSL=false";
                //conn = DriverManager.getConnection(strConnection);
                st = conn.createStatement();
                String strQuery = "SELECT * FROM `Clientes`";
                String strWhere = " WHERE 1=1";
                String strNombre = request.getParameter("Nombre");

                if (strNombre != null) {
                    //strWhere=strWhere +" and Nombre ='" + strNombre + "' ";
                    strNombre = this.mysql_real_scape_string(strNombre);
                    strWhere = strWhere + " and Nombre = ? "; // consulta preparada
                }
                strQuery = strQuery + strWhere;

                //rs = st.executeQuery(strQuery);
                PreparedStatement Preparar = conn.prepareStatement(strQuery);
                if (strNombre != null) {
                    Preparar.setString(1, strNombre);
                }

                rs = Preparar.executeQuery();

                while (rs.next()) {

                    out.print("<tr>"
                            + "<th scope=\"row\">" + rs.getString(1) + " </th>"
                            + "<td>" + rs.getString(2) + " </td>"
                            + "<td>" + rs.getString(3) + " </td>"
                            + "<td>" + rs.getString(4) + " </td>"
                            + "<td>" + rs.getString(5) + " </td>"
                            + "<td>" + rs.getString(6) + " </td>"
                            + "<td>" + rs.getString(7) + " </td>"
                            + "<td>" + rs.getString(8) + " </td>"
                            + "<td>" + rs.getString(9) + " </td>"
                            + "<td>"
                            + " <!-- Edita el nombre, dirección\n"
                            + "                                        y teléfono de un emppleado\n"
                            + "                                    -->"
                            + "<a href=\"editar.jsp?id=" + rs.getString(1) + " \n"
                            + "          &nombre=" + rs.getString(2) + " \n"
                            + "          &appat=" + rs.getString(3) + " \n"
                            + "          &apmat=" + rs.getString(4) + " \n"
                            + "          &telefono=" + rs.getString(5) + " \n"
                            + "          &email=" + rs.getString(6) + " \n"
                            + "          &direccion=" + rs.getString(7) + " \n"
                            + "          &ciudad=" + rs.getString(8) + " \n"
                            + "          &pais=" + rs.getString(9)
                            + "\" >"
                            + "<i class=\"fa fa-pencil\" \n"
                            + "                                           aria-hidden=\"true\"></i></a>"
                            + "<a href=\"borrar.jsp?id=" + rs.getString(1) + " \n"
                            + "          class=\"ml-3\" >\n"
                            + "          <i class=\"fa fa-trash\" \n"
                            + "          aria-hidden=\"true\"></i></a> "
                            + "</td>"
                            + "</tr>");
                    strNombre = "";
                    
                }
            } catch (Exception e) {
                out.print("Error MySQL " + e);
            } finally {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }

    // ... Sanitiza las consultas ...
    public String mysql_real_scape_string(String texto) {
        texto = texto.replaceAll("\\\\", "\\\\`");
        texto = texto.replaceAll("\\n", "\\\\n'");
        texto = texto.replaceAll("\\r", "\\\\r'");
        texto = texto.replaceAll("\\t", "\\\\t'");
        texto = texto.replaceAll("'", "\\\\'");
        return texto;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
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

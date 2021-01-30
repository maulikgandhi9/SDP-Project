/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.bookDAO;
import dao.equipmentDAO;
import entities.Book;
import entities.Equipment;
import helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;

/**
 *
 * @author maulik
 */
public class deletePost extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app?zeroDateTimeBehavior=convertToNull", "root", "");

            String category = (String) request.getParameter("category");
//            out.println(category);
            if (category.equals("book")) {
//                String query = "delete from app.book where b_id=?";
                Book b = new Book();
                b.setB_id(Integer.parseInt(request.getParameter("b_id")));
                b.setB_desc(request.getParameter("b_desc"));
                b.setB_image(request.getParameter("b_image"));
                b.setB_name(request.getParameter("b_name"));
                b.setD_email(request.getParameter("d_email"));
//                PreparedStatement pst = con.prepareStatement(query);
//                pst.setInt(1, Integer.parseInt(request.getParameter("b_id")));
                try {
//                    pst.executeUpdate();
//                    out.println(request.getParameter("b_id"));
                      bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                      bd.deleteBook(b);
                    out.println("<html><head> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n"
                            + "</head><body>");
                    out.println("<h1 align=\"center\">Your book has been deleted</h1>");
                    out.println("</body></html>");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (category.equals("equipment")) {
//                String query = "delete from app.equipment where e_id=?";
                Equipment e = new Equipment();

                e.setE_id(Integer.parseInt(request.getParameter("e_id")));
                e.setD_email(request.getParameter("d_email"));
                e.setE_desc(request.getParameter("e_desc"));
                e.setE_image(request.getParameter("e_image"));
                e.setE_name(request.getParameter("e_name"));
//                PreparedStatement pst = con.prepareStatement(query);
//                pst.setInt(1, Integer.parseInt(request.getParameter("e_id")));
//                pst.executeUpdate();

                equipmentDAO ed = new equipmentDAO(FactoryProvider.getFactory());
                ed.deleteEquipment(e);
                out.println("<html><head> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n"
                        + "</head><body>");
                out.println("<h1 align=\"center\">Your equipment has been deleted</h1>");
                out.println("</body></html>");
            }

        }
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
            Logger.getLogger(deletePost.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(deletePost.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(deletePost.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(deletePost.class.getName()).log(Level.SEVERE, null, ex);
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

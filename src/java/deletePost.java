/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.bookDAO;
import dao.equipmentDAO;
import dao.smDAO;
import dao.videoDAO;
import entities.Book;
import entities.Equipment;
import entities.Video;
import entities.studyMaterial;
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
                Book b = new Book();
                b.setB_id(Integer.parseInt(request.getParameter("b_id")));
                b.setB_desc(request.getParameter("b_desc"));
                b.setB_image(request.getParameter("b_image"));
                b.setB_name(request.getParameter("b_name"));
                b.setD_email(request.getParameter("d_email"));
                String query = String.format("delete from app.request where res_name='%s' and d_email='%s' and req_status='%s'", b.getB_name(), b.getD_email(), "pending");
                PreparedStatement pst = con.prepareStatement(query);
//                pst.setInt(1, Integer.parseInt(request.getParameter("b_id")));
                try {
                    pst.executeUpdate();
                    bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                    bd.deleteBook(b);

                    out.println(".");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("swal({"
                            + "title: 'Success!',"
                            + "text: 'Book deleted Successfully',"
                            + "icon: 'success',})"
                            + ".then(function(){"
                            + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                    out.println("</script>");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (category.equals("equipment")) {

                Equipment e = new Equipment();

                e.setE_id(Integer.parseInt(request.getParameter("e_id")));
                e.setD_email(request.getParameter("d_email"));
                e.setE_desc(request.getParameter("e_desc"));
                e.setE_image(request.getParameter("e_image"));
                e.setE_name(request.getParameter("e_name"));
                String query = String.format("delete from app.request where res_name='%s' and d_email='%s' and req_status='%s'", e.getE_name(), e.getD_email(), "pending");

                PreparedStatement pst = con.prepareStatement(query);
//                pst.setInt(1, Integer.parseInt(request.getParameter("e_id")));
//                pst.executeUpdate();
                equipmentDAO ed = new equipmentDAO(FactoryProvider.getFactory());
                ed.deleteEquipment(e);
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Equipment deleted Successfully',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                out.println("</script>");
            } else if (category.equals("video")) {

                Video v = new Video();

                v.setV_id(Integer.parseInt(request.getParameter("v_id")));
                v.setD_email(request.getParameter("d_email"));
                v.setV_thumbnail(request.getParameter("v_image"));
                v.setV_path(request.getParameter("v_path"));
                v.setV_name(request.getParameter("v_name"));
                String query = String.format("delete from app.video where v_name='%s' and d_email='%s' and v_path='%s' and v_thumbnail='%s'", v.getV_name(), v.getD_email(), v.getV_path(), v.getV_thumbnail());

                PreparedStatement pst = con.prepareStatement(query);
//                pst.setInt(1, Integer.parseInt(request.getParameter("e_id")));
//                pst.executeUpdate();
                videoDAO vd = new videoDAO(FactoryProvider.getFactory());
                vd.deleteVideo(v);
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Video deleted Successfully',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                out.println("</script>");
            } else if (category.equals("sm")) {
                studyMaterial s = new studyMaterial();

                s.setS_id(Integer.parseInt(request.getParameter("s_id")));
                s.setD_email(request.getParameter("d_email"));
                s.setS_path(request.getParameter("s_path"));
                s.setS_name(request.getParameter("s_name"));
                String query = String.format("delete from app.studyMaterial where s_name='%s' and d_email='%s' and s_path='%s'", s.getS_name(), s.getD_email(), s.getS_path());

                PreparedStatement pst = con.prepareStatement(query);

                
//                    pst.executeUpdate();
                

                smDAO sd = new smDAO(FactoryProvider.getFactory());
                sd.deleteSm(s);
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Video deleted Successfully',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                out.println("</script>");
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

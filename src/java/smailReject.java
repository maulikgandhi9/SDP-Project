/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.requestDAO;
import entities.Book;
import entities.Request;
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

/**
 *
 * @author maulik
 */
public class smailReject extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String fname = (String) session.getAttribute("fname");
            String lname = (String) session.getAttribute("lname");
            String d_email = (String) request.getParameter("d_email");
            String requester_email = (String) request.getParameter("r_email");
            String u_dept = (String) session.getAttribute("dept");

            Request req = new Request();
            req.setReq_id(Integer.parseInt(request.getParameter("req_id")));
            req.setRes_name(request.getParameter("res_name"));
            req.setD_email(d_email);
            req.setR_email(requester_email);

            sendMailReject sm = new sendMailReject();
            User user = new User(fname, lname, requester_email, d_email, u_dept);
//            out.println(req.getRes_name() + " " + req.getReq_id() + "<br>");
//            out.println(requester_email + "<br>");
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app?zeroDateTimeBehavior=convertToNull", "root", "");

            try {

                boolean test = sm.sendEmail(user, req);
                req.setReq_status("Rejected");
                requestDAO rd = new requestDAO(FactoryProvider.getFactory());
                rd.saveRequest(req);
//                String query = String.format("update app.request set req_status='%s' where req_id='%d'", "Rejected",req.getReq_id());
//                PreparedStatement pst = con.prepareStatement(query);
//                pst.executeUpdate();

                if (test) {
//                    out.println(req.getReq_id()+" "+req.getReq_status());
//                    out.println("You have rejected the request for "+req.getRes_name());
//                      if (u_dept.equalsIgnoreCase("it")) {
                    out.println(".");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("swal({"
                            + "title: 'Done!',"
                            + "text: 'You have Rejected the request for this resource',"
                            + "icon: 'warning',})"
                            + ".then(function(){"
                            + "window.location.href='myrequest.jsp'});");
                    out.println("</script>");
//                        }
//                        else if(u_dept.equalsIgnoreCase("ce")){
//                            out.println("swal({"
//                                    + "title: 'Done!',"
//                                    + "text: 'You have Rejected the request for this resource',"
//                                    + "icon: 'warning',})"
//                                    + ".then(function(){"
//                                    + "window.location.href='ceBooks.jsp'});");
//                            out.println("</script>");
//                        }
//                        else if(u_dept.equalsIgnoreCase("ec")){
//                            out.println("swal({"
//                                    + "title: 'Done!',"
//                                    + "text: 'You have Rejected the request for this resource',"
//                                    + "icon: 'warning',})"
//                                    + ".then(function(){"
//                                    + "window.location.href='ecBooks.jsp'});");
//                            out.println("</script>");
//                        }else if(u_dept.equalsIgnoreCase("ch")){
//                            out.println("swal({"
//                                    + "title: 'Done!',"
//                                    + "text: 'You have Rejected the request for this resource',"
//                                    + "icon: 'warning',})"
//                                    + ".then(function(){"
//                                    + "window.location.href='chBooks.jsp'});");
//                            out.println("</script>");
//                        }else if(u_dept.equalsIgnoreCase("cl")){
//                            out.println("swal({"
//                                    + "title: 'Done!',"
//                                    + "text: 'You have Rejected the request for this resource',"
//                                    + "icon: 'warning',})"
//                                    + ".then(function(){"
//                                    + "window.location.href='clBooks.jsp'});");
//                            out.println("</script>");
//                        }else if(u_dept.equalsIgnoreCase("mh")){
//                            out.println("swal({"
//                                    + "title: 'Done!',"
//                                    + "text: 'You have Rejected the request for this resource',"
//                                    + "icon: 'warning',})"
//                                    + ".then(function(){"
//                                    + "window.location.href='mhBooks.jsp'});");
//                            out.println("</script>");
//                        }
                }

            } catch (Exception e) {
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
        } catch (SQLException ex) {
            Logger.getLogger(smailReject.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(smailReject.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(smailReject.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(smailReject.class.getName()).log(Level.SEVERE, null, ex);
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

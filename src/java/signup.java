/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maulik
 */
public class signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    static Statement stmt = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("uemail");
            String password = request.getParameter("upwd");
            String dept = request.getParameter("branch");

            HttpSession session = request.getSession();

            session.setAttribute("email", email);
            session.setAttribute("fname", fname);
            session.setAttribute("lname", lname);
            session.setAttribute("password", password);
            session.setAttribute("dept", dept);

            String query2 = "select * from app.user1 where email=?";

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement pst2 = con.prepareStatement(query2);

            pst2.setString(1, email);
            ResultSet rs = pst2.executeQuery();
            if (rs.next() == false) {

                sendMail sm = new sendMail();
                String code = sm.getRandom();
                User user = new User(email, code);
                out.println(user.code+" "+user.email);
                boolean test = sm.sendEmail(user);
//
                if (test) {
////                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", user.getCode());
                    
                    out.println(session.getAttribute("authcode"));
                    RequestDispatcher rd = request.getRequestDispatcher("initialVerify.jsp");
                   rd.forward(request,response);
//                    response.sendRedirect("initialVerify.jsp");
                }

//                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('email-id already registered');");
                out.println("location='index.html';");
                out.println("</script>");
//                    response.sendRedirect(request.getContextPath() + "/index.html");

            }

//            pst1.close();
            con.commit();

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
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
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

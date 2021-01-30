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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maulik
 */
public class smailAccept extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String fname = (String) session.getAttribute("fname");
            String lname = (String) session.getAttribute("lname");
            String d_email = (String) request.getParameter("d_email");
            String requester_email = (String) request.getParameter("r_email");
            String category = (String) request.getParameter("category");
            
            Request req = new Request();
            req.setReq_id(Integer.parseInt(request.getParameter("req_id")));
            req.setRes_name(request.getParameter("res_name"));
            req.setD_email(d_email);
            req.setR_email(requester_email);
            req.setCategory(category);
            req.setR_email(requester_email);
            
            sendMailAccept sm = new sendMailAccept();
            User user = new User(fname, lname, requester_email, d_email);
            out.println(req.getRes_name()+" "+req.getReq_id()+"<br>");
            out.println(requester_email);
            try {
                boolean test = sm.sendEmail(user, req);
                req.setReq_status("Accepted");
                requestDAO rdao = new requestDAO(FactoryProvider.getFactory());
                rdao.saveRequest(req);
                
                
                if (test) {
                    
                    out.println("You have accepted the request for "+req.getRes_name());
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
        processRequest(request, response);
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
        processRequest(request, response);
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

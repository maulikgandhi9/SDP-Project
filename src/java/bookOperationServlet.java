/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.bookDAO;
import entities.Book;
import helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author maulik
 */
@MultipartConfig
public class bookOperationServlet extends HttpServlet {

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
            String op=request.getParameter("operation");
            
            if(op.trim().equals("addbook")){
                String b_name = (String)request.getParameter("b_name");
                String b_desc = (String)request.getParameter("b_desc");
                Part part = request.getPart("bPic");
                String email = (String)session.getAttribute("email");
                
                Book b = new Book();
                b.setB_name(b_name);
                b.setB_desc(b_desc);
                b.setD_email(email);
                b.setB_image(part.getSubmittedFileName());
                
                bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                bd.saveBook(b);
                String path = request.getRealPath("/")+ part.getSubmittedFileName();
                
                try{
                    
                
                FileOutputStream fos= new FileOutputStream(path);
                InputStream is = part.getInputStream();
                
                //reading data from part
                byte data[] = new byte[is.available()];
                is.read(data);
                
                //writing the data
                
                fos.write(data);
                fos.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
//                out.println(path);
                out.println("Book Uploaded successfully!");
                out.println("<html><head> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n"
                    + "</head><body>");
            out.println("<h1 align=\"center\">Book Uploaded successfully!</h1>");
//            out.println("<div style=\"width:150px; margin:0 auto;\"><button type=\"button\" onclick=\"window.location.href='index.html';\" class=\"btn btn-primary\">Click here to login</button></div>");
//                      out.println("<style>");
//                      out.println("");
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

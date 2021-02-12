/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.bookDAO;
import dao.equipmentDAO;
import dao.videoDAO;
import entities.Book;
import entities.Equipment;
import entities.Video;
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
            String op = request.getParameter("operation");

            if (op.trim().equals("addbook")) {
                String b_name = (String) request.getParameter("b_name");
                String b_desc = (String) request.getParameter("b_desc");
                Part part = request.getPart("bPic");
                String email = (String) session.getAttribute("email");

                Book b = new Book();
                b.setB_name(b_name);
                b.setB_desc(b_desc);
                b.setD_email(email);
                b.setB_image(part.getSubmittedFileName());

                bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                bd.saveBook(b);
                String path = request.getRealPath("/") + part.getSubmittedFileName();

                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    //reading data from part
                    byte data[] = new byte[is.available()];
                    is.read(data);

                    //writing the data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Book uploaded Successfully',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                out.println("</script>");

            } else if (op.trim().equals("addequipment")) {
                String e_name = (String) request.getParameter("e_name");
                String e_desc = (String) request.getParameter("e_desc");
                Part part = request.getPart("ePic");
                String email = (String) session.getAttribute("email");

                Equipment equ = new Equipment();
                equ.setE_name(e_name);
                equ.setE_desc(e_desc);
                equ.setD_email(email);
                equ.setE_image(part.getSubmittedFileName());

                equipmentDAO ed = new equipmentDAO(FactoryProvider.getFactory());
                ed.saveEquipment(equ);
                String path = request.getRealPath("/") + part.getSubmittedFileName();

                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    //reading data from part
                    byte data[] = new byte[is.available()];
                    is.read(data);

                    //writing the data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Equipment uploaded Successfully',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='myupload.jsp'});");
//                out.println("location='bookLanding.jsp';");
                out.println("</script>");
            } else if (op.trim().equals("addvideo")) {
                String v_name = (String) request.getParameter("v_name");
//                String e_desc = (String) request.getParameter("e_desc");
                Part part = request.getPart("vPic");
                Part part2 = request.getPart("vPath");
                String email = (String) session.getAttribute("email");

                Video v = new Video();
                v.setV_name(v_name);
//                equ.setE_desc(e_desc);
                v.setD_email(email);
                v.setV_thumbnail(part.getSubmittedFileName());
                v.setV_path(part2.getSubmittedFileName());

                videoDAO vd = new videoDAO(FactoryProvider.getFactory());
                vd.saveVideo(v);
                String path = request.getRealPath("/") + part.getSubmittedFileName();
                String path2 = request.getRealPath("/") + part2.getSubmittedFileName();

                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    //reading data from part
                    byte data[] = new byte[is.available()];
                    is.read(data);

                    //writing the data
                    fos.write(data);
                    fos.close();

                    FileOutputStream fos2 = new FileOutputStream(path2);
                    InputStream is2 = part2.getInputStream();
                    byte data2[] = new byte[is2.available()];
                    is2.read(data2);
                    fos2.write(data2);
                    fos2.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                out.println("swal({"
                        + "title: 'Success!',"
                        + "text: 'Video uploaded Successfully',"
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.downvoteDAO;
import dao.upvoteDAO;
import entities.Downvote;
import entities.Upvote;
import helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
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
public class upvoteServlet extends HttpServlet {

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

            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String cat = request.getParameter("category");
            String u_dept = (String) session.getAttribute("dept");
            upvoteDAO ddao = new upvoteDAO(FactoryProvider.getFactory());

            if (cat.equalsIgnoreCase("book")) {
//                Book b = new Book();
                String b_name = request.getParameter("b_name");
                int b_id = Integer.parseInt(request.getParameter("b_id"));
                String d_email = request.getParameter("d_email");
                String pr = request.getParameter("problem");
                String ac = request.getParameter("ac");
                String up_email = (String) session.getAttribute("email");
//                b.setB_desc(u_dept);
                int uv = Integer.parseInt(request.getParameter("upvotes")) + 1;
//                out.println(b_name + " " + d_email + " " + dv);

                String query = String.format("update app.book set upvotes=%d where b_id=%s", uv, b_id);
                List<Upvote> list = ddao.getUpvotes();

                boolean flag = false;

                for (Upvote i : list) {
                    if (i.getUp_email().equals(up_email) && i.getRes_name().equals(b_name)) {
                        flag = true;
                        break;
                    }
                }

                try {
                    if (!flag) {
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.executeUpdate();
                        Upvote uvote = new Upvote();
                        uvote.setRes_name(b_name);
                        uvote.setCategory(cat);
                        uvote.setD_email(d_email);
                        uvote.setAc(ac);
                        uvote.setUp_email(up_email);
//                    downvoteDAO ddao = new downvoteDAO(FactoryProvider.getFactory());
                        ddao.saveUpvote(uvote);
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='itBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ce")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='ceBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ec")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='ecBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ch")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='chBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("cl")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='clBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("mh")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='mhBooks.jsp'});");
                            out.println("</script>");
                        }
                    } else {

                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='itBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ce")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ceBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ec")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ecBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ch")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='chBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("cl")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='clBooks.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("mh")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='mhBooks.jsp'});");
                            out.println("</script>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (cat.equalsIgnoreCase("equipment")) {
                String e_name = request.getParameter("e_name");

                int e_id = Integer.parseInt(request.getParameter("e_id"));

                String d_email = request.getParameter("d_email");

                String ac = request.getParameter("ac");

                String up_email = (String) session.getAttribute("email");
                int uv = Integer.parseInt(request.getParameter("upvotes")) + 1;

                String query = String.format("update app.equipment set upvotes=%d where e_id=%s", uv, e_id);
//                out.println(query + "<br>");
//                out.println(uv);
//                downvoteDAO ddao = new downvoteDAO(FactoryProvider.getFactory());
                List<Upvote> list = ddao.getUpvotes();
                boolean flag = false;

                for (Upvote i : list) {
                    if (i.getUp_email().equals(up_email) && i.getRes_name().equals(e_name)) {
                        flag = true;
                        break;
                    }
                }

                try {
                    if (!flag) {
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.executeUpdate();
                        Upvote uvote = new Upvote();
                        uvote.setRes_name(e_name);
                        uvote.setCategory(cat);
                        uvote.setD_email(d_email);
                        uvote.setAc(ac);
                        uvote.setUp_email(up_email);
//                        out.println(c_email);
//                    downvoteDAO ddao = new downvoteDAO(FactoryProvider.getFactory());
                        ddao.saveUpvote(uvote);
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully upvoted this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='equipmentLanding.jsp'});");
                        out.println("</script>");

                    } else {

                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "title: 'Oops!',"
                                + "text: 'You have already upvoted this resource',"
                                + "icon: 'warning',})"
                                + ".then(function(){"
                                + "window.location.href='equipmentLanding.jsp'});");
                        out.println("</script>");

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (cat.equalsIgnoreCase("video")) {
                String v_name = request.getParameter("v_name");
                int v_id = Integer.parseInt(request.getParameter("v_id"));
                String d_email = request.getParameter("d_email");
                String ac = request.getParameter("ac");
                String up_email = (String) session.getAttribute("email");
                int uv = Integer.parseInt(request.getParameter("upvotes")) + 1;

                String query = String.format("update app.video set upvotes=%d where v_id=%s", uv, v_id);

                List<Upvote> list = ddao.getUpvotes();
                boolean flag = false;

                for (Upvote i : list) {
                    if (i.getUp_email().equals(up_email) && i.getRes_name().equals(v_name)) {
                        flag = true;
                        break;
                    }
                }
                try {
                    if (!flag) {
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.executeUpdate();
                        Upvote uvote = new Upvote();
                        uvote.setRes_name(v_name);
                        uvote.setCategory(cat);
                        uvote.setD_email(d_email);
                        uvote.setAc(ac);
                        uvote.setUp_email(up_email);
//                        out.println(c_email);
//                    downvoteDAO ddao = new downvoteDAO(FactoryProvider.getFactory());
                        ddao.saveUpvote(uvote);
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully upvoted this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='videoLanding.jsp'});");
                        out.println("</script>");

                    } else {

                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "title: 'Oops!',"
                                + "text: 'You have already upvoted this resource',"
                                + "icon: 'warning',})"
                                + ".then(function(){"
                                + "window.location.href='videoLanding.jsp'});");
                        out.println("</script>");

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (cat.equalsIgnoreCase("sm")) {
                String s_name = request.getParameter("s_name");

                int s_id = Integer.parseInt(request.getParameter("s_id"));

                String d_email = request.getParameter("d_email");

                String ac = request.getParameter("ac");
                String up_email = (String) session.getAttribute("email");

                int uv = Integer.parseInt(request.getParameter("upvotes")) + 1;

                String query = String.format("update app.studyMaterial set upvotes=%d where s_id=%s", uv, s_id);

                List<Upvote> list = ddao.getUpvotes();
                boolean flag = false;

                for (Upvote i : list) {
                    if (i.getUp_email().equals(up_email) && i.getRes_name().equals(s_name)) {
                        flag = true;
                        break;
                    }
                }
                try {
                    if (!flag) {
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.executeUpdate();
                        Upvote uvote = new Upvote();
                        uvote.setRes_name(s_name);
                        uvote.setCategory(cat);
                        uvote.setD_email(d_email);
                        uvote.setAc(ac);
                        uvote.setUp_email(up_email);
//                        out.println(c_email);
//                    downvoteDAO ddao = new downvoteDAO(FactoryProvider.getFactory());
                        ddao.saveUpvote(uvote);
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='itSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ce")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='ceSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ec")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='ecSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ch")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='chSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("cl")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='clSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("mh")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully upvoted this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='mhSM.jsp'});");
                            out.println("</script>");
                        }

                    } else {

                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='itSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ce")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ceSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ec")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ecSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("ch")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='chSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("cl")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='clSM.jsp'});");
                            out.println("</script>");
                        } else if (u_dept.equalsIgnoreCase("mh")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already upvoted this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='mhSM.jsp'});");
                            out.println("</script>");

                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

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
            Logger.getLogger(upvoteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(upvoteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(upvoteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(upvoteServlet.class.getName()).log(Level.SEVERE, null, ex);
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

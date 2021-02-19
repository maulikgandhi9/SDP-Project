
import dao.requestDAO;
import entities.Book;
import entities.Request;
import helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class smailRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app?zeroDateTimeBehavior=convertToNull", "root", "");
            HttpSession session = request.getSession();
            String fname = (String) session.getAttribute("fname");
            String lname = (String) session.getAttribute("lname");
            String u_dept = (String) session.getAttribute("dept");
            String d_email = (String) request.getParameter("d_email");
            String requester_email = (String) session.getAttribute("email");
//            String dept = (String)session.getAttribute("dept");
            Book b = new Book();
            b.setB_name((String) request.getParameter("b_name"));
            sendMailRequest sm = new sendMailRequest();

            User user = new User(fname, lname, requester_email, d_email, u_dept);
            out.println(".");
            
            requestDAO rdao = new requestDAO(FactoryProvider.getFactory());
            List<Request> req_list = rdao.getRequests();
            boolean flag = false;

            for (Request req : req_list) {
                if (req.getR_email().equals(requester_email) && req.getRes_name().equals(b.getB_name()) && req.getReq_status().equalsIgnoreCase("pending")) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
//                out.println("swal('Oops!','You have already requested for this resource','warning');");
                if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='itBooks.jsp'});");
                            out.println("</script>");
                        }
                        else if(u_dept.equalsIgnoreCase("ce")){
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ceBooks.jsp'});");
                            out.println("</script>");
                        }
                        else if(u_dept.equalsIgnoreCase("ec")){
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='ecBooks.jsp'});");
                            out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("ch")){
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='chBooks.jsp'});");
                            out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("cl")){
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='clBooks.jsp'});");
                            out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("mh")){
                            out.println("swal({"
                                    + "title: 'Oops!',"
                                    + "text: 'You have already requested for this resource',"
                                    + "icon: 'warning',})"
                                    + ".then(function(){"
                                    + "window.location.href='mhBooks.jsp'});");
                            out.println("</script>");
                        }
            } else {
                try {
                    boolean test = sm.sendEmail(user, b);
//                    boolean e = sm.sendEmail(user, b);
//                                               out.println("hello" + test);

                    if (test) {
//                    HttpSession session = request.getSession();
//                    session.setAttribute("authcode", user);
//                    response.sendRedirect("forgotVerify.jsp");
//                    out.println(e);
                        Request r = new Request();

                        r.setRes_name(request.getParameter("b_name"));
                        r.setD_email(d_email);
                        r.setR_email(requester_email);
                        r.setReq_status("pending");
                        r.setCategory(request.getParameter("category"));

                        requestDAO reqdao = new requestDAO(FactoryProvider.getFactory());

//                        
                        reqdao.saveRequest(r);
//                        out.println("Your request has been sent");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        if (u_dept.equalsIgnoreCase("it")) {
                            out.println("swal({"
                                    + "title: 'Success!',"
                                    + "text: 'You have successfully requested for this resource',"
                                    + "icon: 'success',})"
                                    + ".then(function(){"
                                    + "window.location.href='itBooks.jsp'});");
                            out.println("</script>");
                        }
                        else if(u_dept.equalsIgnoreCase("ce")){
                            out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully requested for this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='ceBooks.jsp'});");
                        out.println("</script>");
                        }
                        else if(u_dept.equalsIgnoreCase("ec")){
                            out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully requested for this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='ecBooks.jsp'});");
                        out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("ch")){
                            out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully requested for this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='chBooks.jsp'});");
                        out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("cl")){
                            out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully requested for this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='clBooks.jsp'});");
                        out.println("</script>");
                        }else if(u_dept.equalsIgnoreCase("mh")){
                            out.println("swal({"
                                + "title: 'Success!',"
                                + "text: 'You have successfully requested for this resource',"
                                + "icon: 'success',})"
                                + ".then(function(){"
                                + "window.location.href='mhBooks.jsp'});");
                        out.println("</script>");
                        }

                    }
                } catch (Exception e) {
                    out.println(e);
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
            Logger.getLogger(smail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(smail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(smail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(smail.class.getName()).log(Level.SEVERE, null, ex);
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

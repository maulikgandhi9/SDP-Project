
import entities.Book;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.net.*;
import javax.mail.internet.*;

public class sendMailRequest {

    public boolean sendEmail(User user, Book b) {
        boolean test = false;
        String toEmail;
        toEmail = user.getD_email();
//        toEmail = "18ituos036@ddu.ac.in";


        String fromEmail = "maulikgandhi9@gmail.com";
        String password = "maulik@2001";

        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }

            });

            MimeMessage mess = new MimeMessage(session);

            mess.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setSubject("Request for acquiring book/equipment");
            mess.setText("Please contact on below e-mail to donate your book/equipment \n" +"Name of book/equipment: "+b.getB_name()+  "\nName of requester :" + user.getFname() + " " + user.getLname() + "\nEmail-id: " + user.getEmail());
//            mess.setText("hello");

            Transport.send(mess);
            test = true;
//                return null;

        } catch (Exception e) {
//            return e;
        }

        return test;
    }

}


import entities.Book;
import entities.Request;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.net.*;
import javax.mail.internet.*;

public class sendMailReject {

    public boolean sendEmail(User user, Request req) {
        boolean test = false;
        String toEmail;
        toEmail = user.getEmail();
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
            mess.setSubject("Request Rejected!");
            mess.setText("Your request for " + req.getRes_name() + " has been rejected \n"+ "This might br due to unavibility of the requested resource");
//            mess.setText("hello");

            Transport.send(mess);
            test = true;
//                return null;

        } catch (Exception e) {
//            return e;
        }

        return test;
//        return null;
    }

}

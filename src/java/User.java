


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author maulik
 */
public class User {
    
    public String fname;
    public String lname;
    public String email;
    public String code;
    public String d_email;
    public String u_dept;

    public User(String email, String code) {
        this.email = email;
        this.code = code;
    }

    public User(String fname, String lname,String email,String d_email, String u_dept) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.d_email=d_email;
        this.u_dept=u_dept;
    }
    

    public User() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }

    public String getU_dept() {
        return u_dept;
    }

    public void setU_dept(String u_dept) {
        this.u_dept = u_dept;
    }

    
}

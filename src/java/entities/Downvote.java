/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author maulik
 */
@Entity
public class Downvote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "downvote_id")
    private int downvote_id;

    @Column(name = "res_name")
    private String res_name;

    @Column(name = "d_email")
    private String d_email;

    @Column(name = "category")
    private String category;

    @Column(name = "primary_reason")
    private String pr;

    @Column(name = "additional_comments")
    private String ac;

    @Column(name = "complainee_email")
    private String c_email;

    public Downvote() {
    }

    public int getDownvote_id() {
        return downvote_id;
    }

    public void setDownvote_id(int downvote_id) {
        this.downvote_id = downvote_id;
    }

    public String getRes_name() {
        return res_name;
    }

    public void setRes_name(String res_name) {
        this.res_name = res_name;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPr() {
        return pr;
    }

    public void setPr(String pr) {
        this.pr = pr;
    }

    public String getAc() {
        return ac;
    }

    public void setAc(String ac) {
        this.ac = ac;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

}

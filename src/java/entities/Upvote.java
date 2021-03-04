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

public class Upvote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "upvote_id")
    private int upvote_id;

    @Column(name = "res_name")
    private String res_name;

    @Column(name = "d_email")
    private String d_email;

    @Column(name = "category")
    private String category;

    @Column(name = "additional_comments")
    private String ac;
    
    @Column(name = "upvoter_email")
    private String up_email;

    public Upvote() {
    }

    public int getUpvote_id() {
        return upvote_id;
    }

    public void setUpvote_id(int upvote_id) {
        this.upvote_id = upvote_id;
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

    public String getUp_email() {
        return up_email;
    }

    public void setUp_email(String up_email) {
        this.up_email = up_email;
    }

    public String getAc() {
        return ac;
    }

    public void setAc(String ac) {
        this.ac = ac;
    }
    
    
}

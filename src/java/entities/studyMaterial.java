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

public class studyMaterial {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="s_id")
    private int s_id;
    
    @Column(name="s_name")
    private String s_name;
    
    
    @Column(name="d_email")
    private String d_email;

    @Column(name="s_dept")
    private String s_dept;
    
    @Column(name="s_path")
    private String s_path;
    
    @Column(name="downvotes",columnDefinition = "int default 0")
    private int downvotes;
    
    @Column(name="upvotes",columnDefinition = "int default 0")
    private int upvotes;

    public studyMaterial(String s_name, String d_email, String s_dept) {
        this.s_name = s_name;
        this.d_email = d_email;
        this.s_dept = s_dept;
    }

    public studyMaterial(String s_name, String d_email, String s_dept, String s_path) {
        this.s_name = s_name;
        this.d_email = d_email;
        this.s_dept = s_dept;
        this.s_path = s_path;
    }

    public studyMaterial() {
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }

    public String getS_dept() {
        return s_dept;
    }

    public void setS_dept(String s_dept) {
        this.s_dept = s_dept;
    }

    public int getDownvotes() {
        return downvotes;
    }

    public void setDownvotes(int downvotes) {
        this.downvotes = downvotes;
    }

    public int getUpvotes() {
        return upvotes;
    }

    public void setUpvotes(int upvotes) {
        this.upvotes = upvotes;
    }

    public String getS_path() {
        return s_path;
    }

    public void setS_path(String s_path) {
        this.s_path = s_path;
    }
    
    
}

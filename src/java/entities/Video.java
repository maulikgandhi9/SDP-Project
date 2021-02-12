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

public class Video {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="v_id")
    private int v_id;
    
    @Column(name="v_name")
    private String v_name;
    
    @Column(name="v_thumbnail")
    private String v_thumbnail;
    
    @Column(name="v_path")
    private String v_path;
    
    @Column(name="d_email")
    private String d_email;

    public Video() {
    }
    public Video(String v_name,String v_thumbnail, String v_path,String d_email) {
        this.v_name = v_name;
        this.v_thumbnail = v_thumbnail;
        this.v_path = v_path;
        this.d_email = d_email;
    }
    
    public int getV_id() {
        return v_id;
    }

    public void setV_id(int v_id) {
        this.v_id = v_id;
    }

    public String getV_name() {
        return v_name;
    }

    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    public String getV_thumbnail() {
        return v_thumbnail;
    }

    public void setV_thumbnail(String v_thumbnail) {
        this.v_thumbnail = v_thumbnail;
    }

    public String getV_path() {
        return v_path;
    }

    public void setV_path(String v_path) {
        this.v_path = v_path;
    }

    public String getD_email() {
        return d_email;
    }

    public void setD_email(String d_email) {
        this.d_email = d_email;
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

/**
 *
 * @author maulik
 */
public class Helper {
    public static String get20Words(String desc){
        String[] str=desc.split(" ");
        
        if(str.length>20){
            String fin="";
            for(int i=0;i<20;i++){
                fin+=str[i]+" ";
            }
            return fin+"...";
        }
        else{
            return desc;
        }
    }
}

package helloPackage.obj;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.util.Date;

/**
 * Created by AjaxSurangama on 2/11/2017.
 */
@Entity
public class MyName {
    //have to be capitalized L-ong, not long
    @Id public Long id;
    @Index public Date date;
    private String name;
    public MyName(){
        this.date = new Date();
    }
    public MyName(String s){
        this();
        if(s == null){
            this.name = "You didn't put your name";
        }else {
            this.name = s;
        }
    }
    public String getName(){
        return name;
    }
}

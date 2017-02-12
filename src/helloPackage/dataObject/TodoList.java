package helloPackage.dataObject;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import java.util.Date;

/**
 * Created by Yifang on 2/11/2017.
 */
@Entity
public class TodoList {
    //have to be capitalized L-ong, not long, its value will be auto-generated
    //Primary Key
    @Id public Long id;
    // four attributes
    @Index private Date date; // creation date
    @Index private String list_name;
    @Index private String owner_name;
    @Index private String isPrivate;


    public TodoList(){
        this.date = new Date();
        this.list_name = "default";
        this.owner_name = "Anonymous";
        this.isPrivate = "false";
    }
    public TodoList(String list_name, String owner_name, String isPrivate){
        this();
        if(list_name != null ){
            this.list_name = list_name;
        }
        if(owner_name != null ){
            this.owner_name = owner_name;
        }
        if(isPrivate !=null){
            this.isPrivate = isPrivate;
        }
    }

    //setters and getters
    public String getOwnerName(){
        return owner_name;
    }
    public String getListName(){ return list_name;}
    public Date getCreationDate(){return date;}
    public void setOwnerName(){
        this.owner_name=owner_name;
    }
    public void setListName(){ this.list_name=list_name;}
    public void setCreationDate(Date date){this.date = date;}

    public String getIsPrivate() {
        return isPrivate;
    }

    public void setIsPrivate(String isPrivate) {
        this.isPrivate = isPrivate;
    }
}

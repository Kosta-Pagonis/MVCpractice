package helloPackage;

import com.googlecode.objectify.ObjectifyService;
import helloPackage.obj.MyName;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Yifang on 2/11/2017.
 */
public class namePostingServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String s = req.getParameter("myname");
        MyName myName = new MyName(s);
        //have to register the class before saving it.
        ObjectifyService.register(MyName.class);
        ObjectifyService.ofy().save().entity(myName).now();
        resp.sendRedirect("hello?myname="+myName);
    }
}

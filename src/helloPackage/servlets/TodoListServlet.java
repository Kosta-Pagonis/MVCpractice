package helloPackage.servlets;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;
import helloPackage.dataObject.TodoItem;
import helloPackage.dataObject.TodoList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Yifang on 2/11/2017.
 */
public class TodoListServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //check: creating or editing
        String s = req.getParameter("operation");
        //register before save
        ObjectifyService.register(TodoList.class);
        ObjectifyService.register(TodoItem.class);

        if(s.equalsIgnoreCase("creation")){
            String todoListName = req.getParameter("toDoName");
            String todoListOwner = req.getParameter("toDoOwner");
            String isPrivate = req.getParameter("isPrivate");
            String categories[] = req.getParameterValues("a_category");
            String descriptions[] = req.getParameterValues("a_description");
            String startDates[] = req.getParameterValues("a_startDate");
            String endDates[] = req.getParameterValues("a_endDate");
            String completeds[] = req.getParameterValues("a_completed");

            //save the new list
            TodoList a_list = new TodoList(todoListName,todoListOwner,isPrivate);
            ObjectifyService.ofy().save().entity(a_list).now();
            //save each item if there are some items
            if(completeds != null){
                for(int i = 0; i<categories.length; i++){
                    TodoItem an_item = new TodoItem(categories[i],
                            descriptions[i],startDates[i],
                            endDates[i],completeds[i],a_list);
                    ObjectifyService.ofy().save().entity(an_item).now();
                }
            }
            Long listid = ObjectifyService.ofy().load().entity(a_list).now().id;
            resp.sendRedirect("todolist?operation=edition&saved=true&listid="+listid);

        }else if(s.equalsIgnoreCase("edition")){
            String listId= req.getParameter("listid");


        }else {
            resp.sendError(404,"Invalid Page");
        }

        /**
        TodoList a_list = new TodoList(s,s);
        ObjectifyService.register(TodoList.class);
        ObjectifyService.ofy().save().entity(a_list).now();
        resp.sendRedirect("hello?myname="+a_list);
         **/
    }
}

package helloPackage.servlets;

import com.googlecode.objectify.ObjectifyService;
import helloPackage.dataObject.TodoItem;
import helloPackage.dataObject.TodoList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
            String orderCounts[] = req.getParameterValues("a_orderCount");

            //save the new list
            TodoList a_list = new TodoList(todoListName,todoListOwner,isPrivate);
            ObjectifyService.ofy().save().entity(a_list).now();
            //save each item if there are some items
            if(completeds != null){
                for(int i = 0; i<categories.length; i++){
                    TodoItem an_item = new TodoItem(categories[i],
                            descriptions[i],startDates[i],
                            endDates[i],completeds[i],orderCounts[i],a_list);
                    ObjectifyService.ofy().save().entity(an_item).now();
                }
            }
            Long listid = ObjectifyService.ofy().load().entity(a_list).now().id;
            resp.sendRedirect("todolist?operation=edition&saved=true&listid="+listid);

        }else if(s.equalsIgnoreCase("edition")){
            //delete first and then re-create (for simplicity....)
            String listid= req.getParameter("listid");
            TodoList todoList = ObjectifyService.ofy().load().type(TodoList.class).id(Long.parseLong(listid)).now();
            todoList.getIsPrivate();
            List<TodoItem> todoItems = ObjectifyService.ofy().load().type(TodoItem.class).ancestor(todoList).list();
            ObjectifyService.ofy().delete().entities(todoItems).now();
            ObjectifyService.ofy().delete().entity(todoList).now();

            //re-creation
            String todoListName = req.getParameter("toDoName");
            String todoListOwner = req.getParameter("toDoOwner");
            String isPrivate = req.getParameter("isPrivate");
            String categories[] = req.getParameterValues("a_category");
            String descriptions[] = req.getParameterValues("a_description");
            String startDates[] = req.getParameterValues("a_startDate");
            String endDates[] = req.getParameterValues("a_endDate");
            String completeds[] = req.getParameterValues("a_completed");
            String orderCounts[] = req.getParameterValues("a_orderCount");
            //save the new list
            TodoList a_list = new TodoList(todoListName,todoListOwner,isPrivate);
            ObjectifyService.ofy().save().entity(a_list).now();
            //save each item if there are some items
            if(completeds != null){
                for(int i = 0; i<categories.length; i++){
                    TodoItem an_item = new TodoItem(categories[i],
                            descriptions[i],startDates[i],
                            endDates[i],completeds[i],orderCounts[i],a_list);
                    ObjectifyService.ofy().save().entity(an_item).now();
                }
            }
            Long newlistid = ObjectifyService.ofy().load().entity(a_list).now().id;
            resp.sendRedirect("todolist?operation=edition&saved=true&listid="+newlistid);

        }else if(s.equalsIgnoreCase("deletion")){
            //deletion
            String listid= req.getParameter("listid");
            TodoList todoList = ObjectifyService.ofy().load().type(TodoList.class).id(Long.parseLong(listid)).now();
            todoList.getIsPrivate();
            List<TodoItem> todoItems = ObjectifyService.ofy().load().type(TodoItem.class).ancestor(todoList).list();
            ObjectifyService.ofy().delete().entities(todoItems).now();
            ObjectifyService.ofy().delete().entity(todoList).now();
            //go back to the previous page
            String prevPage = req.getParameter("prevpage");
            resp.sendRedirect(prevPage);

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

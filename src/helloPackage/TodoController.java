package helloPackage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * Contains constants to be used in Java backend
 * Created by Yifang on 2/12/2017.
 */
@Controller
@RequestMapping("/todolist")
public class TodoController{

    @RequestMapping(method = RequestMethod.GET)
    public String todoList(ModelMap model) {
        return "todolist";//Name of the jsp
    }
}
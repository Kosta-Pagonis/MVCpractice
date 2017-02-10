package helloPackage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/todolist")
public class TodoController{

    @RequestMapping(method = RequestMethod.GET)
    public String todoList(ModelMap model) {
        return "todolist";//Name of the jsp
    }
}
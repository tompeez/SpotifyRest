package de.hahn.blog.sprotyrest.view;

import groovy.json.internal.Exceptions;

import java.util.List;

import java.util.Map;

import javax.faces.event.ActionEvent;

import javax.ws.rs.GET;

import oracle.adf.model.BindingContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class SpotifyTestBean {
    public SpotifyTestBean() {
    }

    public void onSearch(ActionEvent actionEvent) {
        // GET A METHOD FROM PAGEDEF AND EXECUTE IT
        // get the binding container
        BindingContainer bindings = BindingContext.getCurrent().getCurrentBindingsEntry();
        // get an Action or MethodAction
        OperationBinding method = bindings.getOperationBinding("search");
        if (method == null)
        {
        // handle method not found error...
        }
        // if there are parameters to set...
        Map paramsMap = method.getParamsMap();
        paramsMap.put("q","sorry")  ;
        // execute the method
        method.execute();
        List<Exception> errors = (List<Exception>)method.getErrors();
        if (!errors.isEmpty())
        {
          // handle errors here errors is a list of exceptions!
            errors.get(0).printStackTrace();
        }

        // no error resume normal work
    }
}

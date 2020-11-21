package br.com.pyim.mgpyim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.Client;
import br.com.pyim.mgpyim.entities.Service;
import br.com.pyim.mgpyim.repositories.ClientRepository;
import br.com.pyim.mgpyim.repositories.ServiceRepository;

@Controller
@RequestMapping(value = "/service")
public class ServiceController {
    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private ClientRepository clientRepository;

    @InitBinder("service")
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        dateFormatter.setLenient(false);
        binder.registerCustomEditor(Date.class, "initialDateTime", new CustomDateEditor(dateFormatter, true));
    }

    @RequestMapping(value = "/create")
    public ModelAndView serviceCreate(@RequestParam(value = "userId") Long userId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service\\service-create");
        try {
            Optional<Client> obj = clientRepository.findById(userId);
            Client entity = obj.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
            Service service = new Service();
            service.setClient(entity);
            mav.addObject("command", service);
            mav.addObject("clientId", entity.getId());
            mav.addObject("status", HttpStatus.OK);

        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Client");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        }
        return mav;
    }

    @RequestMapping(value = "/create/result", method = RequestMethod.POST)
    public ModelAndView serviceCreateResult(@ModelAttribute Service service, ModelMap model) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service\\service-create");
        try {
            service = serviceRepository.save(service);
            mav.addObject("service", service);
            mav.addObject("nameResource", "Service");
            mav.addObject("linkResource", "/client/"+service.getClient().getId());
            mav.addObject("returnName", "client");
            mav.addObject("status", HttpStatus.ACCEPTED);
        } catch (Exception e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Create");
            mav.addObject("returnName", "create service");
            mav.addObject("linkResource", "/service/create?userId="+service.getClient().getId());
        }
        return mav;
    }

}

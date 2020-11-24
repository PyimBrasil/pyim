package br.com.pyim.mgpyim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.ServiceProvider;
import br.com.pyim.mgpyim.entities.enums.ServiceStatus;
import br.com.pyim.mgpyim.repositories.ServiceProviderRepository;
import br.com.pyim.mgpyim.repositories.ServiceRepository;

@Controller
@RequestMapping(value = "/serviceProvider")
public class ServiceProviderController {
    @Autowired
    private ServiceProviderRepository serviceProviderRepository;

    @Autowired
    private ServiceRepository serviceRepository;

    @InitBinder("serviceProvider")
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        dateFormatter.setLenient(false);
        binder.registerCustomEditor(Date.class, "birthdate", new CustomDateEditor(dateFormatter, true, 10));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView serviceProviderHome(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("serviceProvider\\serviceProvider");
        try {
            Optional<ServiceProvider> obj = serviceProviderRepository.findById(id);
            ServiceProvider entity = obj.orElseThrow(() -> new ResourceNotFoundException("Service Provider not found"));
            mav.addObject("serviceProvider", entity);
            mav.addObject("availableServices", serviceRepository.findAllByServiceStatus(ServiceStatus.PENDING).size());
            mav.addObject("listServicesSize", entity.getRequestServices().size());
            mav.addObject("listServices", entity.getRequestServices());
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "ServiceProvider");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        }
        return mav;
    }

    @RequestMapping(value = "/{id}/availableServices", method = RequestMethod.GET)
    public ModelAndView serviceProviderAvailableServices(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("serviceProvider\\serviceProvider-availableServices");
        try {
            Optional<ServiceProvider> obj = serviceProviderRepository.findById(id);
            ServiceProvider entity = obj.orElseThrow(() -> new ResourceNotFoundException("Service Provider not found"));
            mav.addObject("serviceProvider", entity);
            mav.addObject("availableServices", serviceRepository.findAllByServiceStatus(ServiceStatus.PENDING));
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "ServiceProvider");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        }
        return mav;
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView serviceProviderEdit(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("serviceProvider\\serviceProvider-update");
        try {
            Optional<ServiceProvider> obj = serviceProviderRepository.findById(id);
            ServiceProvider entity = obj.orElseThrow(() -> new ResourceNotFoundException("Service Provider not found"));
            mav.addObject("command", entity);
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service Provider");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        }
        return mav;
    }

    @RequestMapping(value = "/edit/{id}/result", method = RequestMethod.POST)
    public ModelAndView serviceProviderEditResult(@ModelAttribute ServiceProvider serviceProvider) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("serviceProvider\\serviceProvider-update");
        try {
            serviceProvider = serviceProviderRepository.save(serviceProvider);
            mav.addObject("command", serviceProvider);
            mav.addObject("nameResource", "ServiceProvider");
            mav.addObject("linkResource", "/serviceProvider/" + serviceProvider.getId());
            mav.addObject("returnName", "serviceProvider");
            mav.addObject("status", HttpStatus.ACCEPTED);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Edit");
            mav.addObject("returnName", "edit serviceProvider");
            mav.addObject("linkResource", "/serviceProvider/edit/" + serviceProvider.getId());
        }
        return mav;
    }
    @RequestMapping("/{serviceProviderId}/service/{serviceId}/details")
	public RedirectView redirectServiceDetail(RedirectAttributes attributes, @PathVariable Long serviceProviderId,
			@PathVariable Long serviceId) {
		attributes.addAttribute("serviceId", serviceId);
		attributes.addAttribute("serviceProviderId", serviceProviderId);
		return new RedirectView("/service/details");
	}
}

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

import br.com.pyim.mgpyim.controller.exceptions.project.BusinessRuleException;
import br.com.pyim.mgpyim.controller.exceptions.project.DataBaseException;
import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.Client;
import br.com.pyim.mgpyim.entities.Service;
import br.com.pyim.mgpyim.entities.ServiceProvider;
import br.com.pyim.mgpyim.entities.enums.ServiceStatus;
import br.com.pyim.mgpyim.repositories.ClientRepository;
import br.com.pyim.mgpyim.repositories.ServiceProviderRepository;
import br.com.pyim.mgpyim.repositories.ServiceRepository;

@Controller
@RequestMapping(value = "/service")
public class ServiceController {
    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private ServiceProviderRepository serviceProviderRepository;

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
            mav.addObject("linkResource", "/client/" + service.getClient().getId());
            mav.addObject("returnName", "client");
            mav.addObject("status", HttpStatus.ACCEPTED);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Create");
            mav.addObject("returnName", "create service");
            mav.addObject("linkResource", "/service/create?userId=" + service.getClient().getId());
        }
        return mav;
    }

    @RequestMapping(value = "/details")
    public ModelAndView serviceDetails(@RequestParam(value = "userId", required = false) Long userId,
            @RequestParam(value = "serviceId") Long serviceId,
            @RequestParam(value = "serviceProviderId", required = false) Long serviceProviderId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service\\service-details");
        try {
            Optional<Service> obj = serviceRepository.findById(serviceId);
            Service service = obj.orElseThrow(() -> new ResourceNotFoundException("Service not found"));
            ///////////////////
            if (userId != null) {
                Optional<Client> obj2 = clientRepository.findById(userId);
                Client client = obj2.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
                mav.addObject("clientId", client.getId());
                if (service.getServiceStatus() == ServiceStatus.ALLOCATED
                        || service.getServiceStatus() == ServiceStatus.PENDING) {
                    System.out.println("AQUi");
                    mav.addObject("makeCancel", true);
                    mav.addObject("linkToCancel",
                            "/service/serviceCancel?serviceId=" + serviceId + "&userId=" + userId);
                }
            }
            if (serviceProviderId != null) {
                Optional<ServiceProvider> obj3 = serviceProviderRepository.findById(serviceProviderId);
                ServiceProvider serviceProvider = obj3
                        .orElseThrow(() -> new ResourceNotFoundException("Service provider not found"));
                mav.addObject("serviceProviderId", serviceProvider.getId());
                if (service.getServiceStatus() == ServiceStatus.PENDING) {
                    mav.addObject("makeContract", true);
                }
                if (service.getServiceStatus() == ServiceStatus.ALLOCATED) {
                    mav.addObject("cancelContractPermission", true);
                    mav.addObject("linkToCancel", "/service/serviceProviderCancel?serviceId=" + serviceId
                            + "&serviceProviderId=" + serviceProviderId);
                }
            }
            mav.addObject("service", service);
            mav.addObject("status", HttpStatus.OK);

        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Client, Service provider or Service");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        }
        return mav;
    }

    @RequestMapping(value = "/makeContract")
    public ModelAndView serviceMakeContract(@RequestParam(value = "serviceId") Long serviceId,
            @RequestParam(value = "serviceProviderId", required = false) Long serviceProviderId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/service/details?serviceProviderId=" + serviceProviderId + "&serviceId=" + serviceId);
        try {
            Optional<Service> obj = serviceRepository.findById(serviceId);
            Service service = obj.orElseThrow(() -> new ResourceNotFoundException("Service not found"));
            if (serviceProviderId != null && service.getServiceProvider() == null) {
                Optional<ServiceProvider> obj3 = serviceProviderRepository.findById(serviceProviderId);
                ServiceProvider serviceProvider = obj3
                        .orElseThrow(() -> new ResourceNotFoundException("Service provider not found"));
                service.setServiceProvider(serviceProvider);
                service.setServiceStatus(ServiceStatus.ALLOCATED);
                service = serviceRepository.save(service);
                serviceProvider.getRequestServices().add(service);
                serviceProvider = serviceProviderRepository.save(serviceProvider);
            } else if (service.getServiceProvider() == null) {
                throw new DataBaseException("There is already a service provider in this service");
            }
            mav.addObject("service", service);
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service provider or Service");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        } catch (DataBaseException e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "service");
            mav.addObject("linkResource",
                    "/service/details?serviceId=" + serviceId + "&serviceProviderId=" + serviceProviderId);
        }
        return mav;
    }

    @RequestMapping(value = "/serviceProviderCancel")
    public ModelAndView serviceServiceProviderCancel(@RequestParam(value = "serviceId") Long serviceId,
            @RequestParam(value = "serviceProviderId", required = false) Long serviceProviderId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/service/details?serviceProviderId=" + serviceProviderId + "&serviceId=" + serviceId);
        try {
            Optional<Service> obj = serviceRepository.findById(serviceId);
            Service service = obj.orElseThrow(() -> new ResourceNotFoundException("Service not found"));
            if (serviceProviderId != null && service.getServiceProvider() != null) {
                Optional<ServiceProvider> obj3 = serviceProviderRepository.findById(serviceProviderId);
                ServiceProvider serviceProvider = obj3
                        .orElseThrow(() -> new ResourceNotFoundException("Service provider not found"));
                service.setServiceProvider(null);
                service.setServiceStatus(ServiceStatus.PENDING);
                service = serviceRepository.save(service);
                serviceProvider.getRequestServices().remove(service);
                serviceProvider = serviceProviderRepository.save(serviceProvider);
            } else if (service.getServiceProvider() == null) {
                throw new DataBaseException("Not there is a service provider in this service");
            }
            mav.addObject("service", service);
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service provider or Service");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        } catch (DataBaseException e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "service");
            mav.addObject("linkResource",
                    "/service/details?serviceId=" + serviceId + "&serviceProviderId=" + serviceProviderId);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "service");
            mav.addObject("linkResource",
                    "/service/details?serviceId=" + serviceId + "&serviceProviderId=" + serviceProviderId);
        }
        return mav;
    }

    ///////////////////////////////////
    @RequestMapping(value = "/serviceCancel")
    public ModelAndView serviceCancel(@RequestParam(value = "serviceId") Long serviceId,
            @RequestParam(value = "userId", required = false) Long userId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/service/details?userId=" + userId + "&serviceId=" + serviceId);
        try {
            Optional<Service> obj = serviceRepository.findById(serviceId);
            Service service = obj.orElseThrow(() -> new ResourceNotFoundException("Service not found"));
            if (userId != null && service.getServiceStatus() == ServiceStatus.ALLOCATED
                    || service.getServiceStatus() == ServiceStatus.PENDING) {
                Optional<Client> obj2 = clientRepository.findById(userId);
                Client serviceProvider = obj2.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
                service.setServiceStatus(ServiceStatus.CANCELED);
                service = serviceRepository.save(service);
            } else if (service.getServiceProvider() == null) {
                throw new DataBaseException("Not there is a service provider in this service");
            }
            mav.addObject("service", service);
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service provider or Service");
            mav.addObject("returnName", "Home");
            mav.addObject("linkResource", "/");
        } catch (DataBaseException e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "service");
            mav.addObject("linkResource",
                    "/service/details?serviceId=" + serviceId + "&userId=" + userId);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "service");
            mav.addObject("linkResource",
                    "/service/details?serviceId=" + serviceId + "&userId=" + userId);
        }
        return mav;
    }

    @RequestMapping(value = "/delete")
    public ModelAndView serviceDelete(@RequestParam(value = "userId") Long userId,
            @RequestParam(value = "serviceId") Long serviceId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service\\service-delete");
        try {
            Optional<Client> obj = clientRepository.findById(userId);
            Optional<Service> obj2 = serviceRepository.findById(serviceId);
            Service service = obj2.orElseThrow(() -> new ResourceNotFoundException("Service not found"));
            Client client = obj.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
            mav.addObject("service", service);
            mav.addObject("nameResource", "Service");
            mav.addObject("linkResource", "/service/delete/result?userId=" + userId + "&serviceId=" + serviceId);
            mav.addObject("linkReturn", "/client/" + client.getId());
            mav.addObject("returnName", "Delete");
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "Service");
            mav.addObject("linkResource", "/client/" + userId);
        }
        return mav;
    }

    @RequestMapping(value = "/delete/result")
    public ModelAndView serviceDeleteResult(@RequestParam(value = "userId") Long userId,
            @RequestParam(value = "serviceId") Long serviceId) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service\\service-delete");
        try {
            Service service = serviceRepository.getOne(serviceId);
            if (service.getServiceStatus() == ServiceStatus.PENDING && service.getServiceProvider() == null) {
                serviceRepository.deleteById(serviceId);
                mav.addObject("resource", "Delete");
                mav.addObject("nameResource", "Service");
                mav.addObject("returnName", "service");
                mav.addObject("linkResource", "/client/" + userId);
                mav.addObject("status", HttpStatus.NO_CONTENT);
            } else {
                throw new BusinessRuleException("Not allowed");
            }
        } catch (BusinessRuleException e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "delete service");
            mav.addObject("linkResource", "/client/" + userId);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Service");
            mav.addObject("returnName", "delete service");
            mav.addObject("linkResource", "/client/" + userId);
        }
        return mav;
    }
}

package br.com.pyim.mgpyim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.Client;
import br.com.pyim.mgpyim.repositories.ClientRepository;

@Controller
@RequestMapping(value = "/client")
public class ClientController {
	@Autowired
	private ClientRepository clientRepository;

	@InitBinder("client")
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, "birthdate", new CustomDateEditor(dateFormatter, true, 10));
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView clientHome(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client\\client");
		try {
			Optional<Client> obj = clientRepository.findById(id);
			Client entity = obj.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
			mav.addObject("client", entity);
			mav.addObject("listServices", entity.getService());
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

	@RequestMapping(value = "/edit/{id}")
	public ModelAndView clientEdit(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client\\client-update");
		try {
			Optional<Client> obj = clientRepository.findById(id);
			Client entity = obj.orElseThrow(() -> new ResourceNotFoundException("Client not found"));
			mav.addObject("command", entity);
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

	@RequestMapping(value = "/edit/{id}/result", method = RequestMethod.POST)
	public ModelAndView clientEditResult(@ModelAttribute Client client) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client\\client-update");
		try {
			client = clientRepository.save(client);
			mav.addObject("command", client);
			mav.addObject("nameResource", "Client");
			mav.addObject("linkResource", "/client/" + client.getId());
			mav.addObject("returnName", "client");
			mav.addObject("status", HttpStatus.ACCEPTED);
		} catch (Exception e) {
			mav.setViewName("errors\\badRequest");
			mav.addObject("error", e.getMessage());
			mav.addObject("nameResource", "Edit");
			mav.addObject("returnName", "edit client");
			mav.addObject("linkResource", "/client/edit/" + client.getId());
		}
		return mav;
	}

	@GetMapping("/{userId}/service/create")
	public RedirectView redirectServiceCreate(RedirectAttributes attributes, @PathVariable Long userId) {
		attributes.addAttribute("userId", userId);
		return new RedirectView("/service/create");
	}
	@GetMapping("/{userId}/service/{serviceId}/details")
	public RedirectView redirectServiceDetail(RedirectAttributes attributes, @PathVariable Long userId,
			@PathVariable Long serviceId) {
		attributes.addAttribute("userId", userId);
		attributes.addAttribute("serviceId", serviceId);
		return new RedirectView("/service/details");
	}
}

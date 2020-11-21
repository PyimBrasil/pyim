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
			mav.addObject("status", HttpStatus.NOT_FOUND);
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}

	@RequestMapping(value = "/edit/{id}")
	public ModelAndView clientEdit(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client\\client-update");
		try {
			Optional<Client> obj = clientRepository.findById(id);
			Client entity = obj.orElseThrow(() -> new ResourceNotFoundException("User not found"));
			mav.addObject("command", entity);
			mav.addObject("status", HttpStatus.OK);
		} catch (ResourceNotFoundException e) {
			mav.addObject("status", HttpStatus.NOT_FOUND);

			mav.addObject("error", e.getMessage());
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
			mav.addObject("status", HttpStatus.ACCEPTED);
		} catch (Exception e) {
			mav.addObject("client.id", client.getId());
			mav.addObject("status", HttpStatus.BAD_REQUEST);
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}

	@GetMapping("/{id}/service/create")
	public RedirectView redirectServiceCreate(RedirectAttributes attributes, @PathVariable Long id) {
		attributes.addAttribute("userId", id);
		return new RedirectView("/service/create");
	}
}

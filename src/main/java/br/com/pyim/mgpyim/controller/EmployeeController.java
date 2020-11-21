package br.com.pyim.mgpyim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.pyim.mgpyim.controller.exceptions.project.DataBaseException;
import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.Employee;
import br.com.pyim.mgpyim.repositories.EmployeeRepository;
import br.com.pyim.mgpyim.repositories.RoleRepository;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private RoleRepository roleRepository;

	@InitBinder("employee")
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, "birthdate", new CustomDateEditor(dateFormatter, true, 10));
		binder.registerCustomEditor(Date.class, "admissionDate", new CustomDateEditor(dateFormatter, true, 10));
		binder.registerCustomEditor(Date.class, "resignationDate", new CustomDateEditor(dateFormatter, true, 10));
	}

	@GetMapping
	public String employeeHome(Model model) {
		List<Employee> employeeAll = employeeRepository.findAll();
		model.addAttribute("name", "Employee ");
		model.addAttribute("listAllEmployee", employeeAll);
		return "employee\\employee";
	}

	@RequestMapping(value = "/create")
	public ModelAndView employeeCreate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-create");
		mav.addObject("command", new Employee());
		mav.addObject("roles", roleRepository.findAll());
		mav.addObject("name", "Employee ");
		return mav;
	}

	@RequestMapping(value = "/create/result", method = RequestMethod.POST)
	public ModelAndView employeeCreateResult(@ModelAttribute Employee employee, ModelMap model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-create-result");
		try {
			employee = employeeRepository.save(employee);
			mav.addObject("employee", employee);
			mav.addObject("status", HttpStatus.ACCEPTED);
		} catch (Exception e) {
			mav.addObject("status", HttpStatus.BAD_REQUEST);
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}

	@GetMapping(value = "/delete/{id}")
	public ModelAndView employeeDelete(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-delete");
		try {
			Optional<Employee> obj = employeeRepository.findById(id);
			Employee entity = obj.orElseThrow(() -> new ResourceNotFoundException("Employee not found"));
			mav.addObject("employee", entity);
			mav.addObject("status", HttpStatus.OK);
		} catch (ResourceNotFoundException e) {
			mav.setViewName("errors\\notFoundResource");
			mav.addObject("error", e.getMessage());
			mav.addObject("nameResource", "Employee");
			mav.addObject("returnName", "Employee");
			mav.addObject("linkResource", "/employee");
		}
		return mav;
	}

	@GetMapping(value = "/delete/{id}/result")
	public ModelAndView employeeDeleteResult(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-delete");
		try {
			employeeRepository.deleteById(id);
			mav.addObject("status", HttpStatus.NO_CONTENT);
		} catch (DataBaseException e) {
			mav.addObject("status", HttpStatus.BAD_REQUEST);
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}

	@RequestMapping(value = "/edit/{id}")
	public ModelAndView employeeEdit(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-update");
		try {
			Optional<Employee> obj = employeeRepository.findById(id);
			Employee entity = obj.orElseThrow(() -> new ResourceNotFoundException("Employee not found"));
			mav.addObject("command", entity);
			mav.addObject("status", HttpStatus.OK);
			mav.addObject("roles", roleRepository.findAll());
		} catch (ResourceNotFoundException e) {
			mav.setViewName("errors\\notFoundResource");
			mav.addObject("error", e.getMessage());
			mav.addObject("nameResource", "Employee");
			mav.addObject("returnName", "Employee");
			mav.addObject("linkResource", "/employee");
		}
		return mav;
	}

	@RequestMapping(value = "/edit/{id}/result", method = RequestMethod.POST)
	public ModelAndView employeeEditResult(@ModelAttribute Employee employee) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee\\employee-update");
		try {
			employee = employeeRepository.save(employee);
			mav.addObject("employee", employee);
			mav.addObject("status", HttpStatus.ACCEPTED);
		} catch (Exception e) {
			// validação
			mav.addObject("status", HttpStatus.BAD_REQUEST);
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}
}

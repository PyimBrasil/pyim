package br.com.pyim.mgpyim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pyim.mgpyim.entities.Employee;
import br.com.pyim.mgpyim.repositories.EmployeeRepository;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping
    public String employeeHome(Model model) {
        List<Employee> employeeAll = employeeRepository.findAll();
        model.addAttribute("name", "Employee");
        model.addAttribute("listAllEmployee", employeeAll);
        return "employee\\employee";
    }
}

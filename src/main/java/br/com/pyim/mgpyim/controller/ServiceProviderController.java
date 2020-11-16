package br.com.pyim.mgpyim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pyim.mgpyim.repositories.ServiceProviderRepository;

@Controller
@RequestMapping(value = "/serviceProvider")
public class ServiceProviderController {
    @Autowired
    private ServiceProviderRepository serviceProviderRepository;

    @GetMapping
    public String client(Model model) {
        model.addAttribute("message", "serviceProvider");
        return "serviceProvider";
    }
}

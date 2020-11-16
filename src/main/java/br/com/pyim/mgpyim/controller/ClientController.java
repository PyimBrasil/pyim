package br.com.pyim.mgpyim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pyim.mgpyim.repositories.ClientRepository;

@Controller
@RequestMapping(value = "/client")
public class ClientController {
    @Autowired
    private ClientRepository clientRepository;

    @GetMapping
    public String client(Model model) {
        model.addAttribute("message", "client");
        return "client";
    }
}

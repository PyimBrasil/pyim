package br.com.pyim.mgpyim.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.pyim.mgpyim.controller.exceptions.project.ResourceNotFoundException;
import br.com.pyim.mgpyim.entities.Role;
import br.com.pyim.mgpyim.repositories.RoleRepository;

@Controller
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping
    public ModelAndView roleHome() {
        ModelAndView mav = new ModelAndView();
        List<Role> roleAll = roleRepository.findAll();
        mav.setViewName("role\\role");
        mav.addObject("listAllRole", roleAll);
        return mav;
    }

    @RequestMapping(value = "/create")
    public ModelAndView roleCreate() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-create");
        mav.addObject("command", new Role());
        return mav;
    }

    @RequestMapping(value = "/create/result", method = RequestMethod.POST)
    public ModelAndView roleCreateResult(@ModelAttribute Role role) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-create");
        try {
            role = roleRepository.save(role);
            mav.addObject("role", role);
            mav.addObject("nameResource", "Role");
            mav.addObject("linkResource", "/role");
            mav.addObject("returnName", "role");
            mav.addObject("status", HttpStatus.ACCEPTED);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "create role");
        }
        return mav;
    }

    @GetMapping(value = "/delete/{id}")
    public ModelAndView roleDelete(@PathVariable int id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-delete");
        try {
            Optional<Role> obj = roleRepository.findById(id);
            Role entity = obj.orElseThrow(() -> new ResourceNotFoundException("Role not found"));
            mav.addObject("role", entity);
            mav.addObject("nameResource", "Role");
            mav.addObject("linkResource", "/role/delete/" + id + "/result");
            mav.addObject("linkReturn", "/role");
            mav.addObject("returnName", "Delete");
            mav.addObject("status", HttpStatus.OK);

        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "Role");
            mav.addObject("linkResource", "/role");
        }
        return mav;
    }

    @GetMapping(value = "/delete/{id}/result")
    public ModelAndView roleDeleteResult(@PathVariable int id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-delete");
        try {
            roleRepository.deleteById(id);
            mav.addObject("resource", "Delete");
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "role");
            mav.addObject("linkResource", "/role");
            mav.addObject("status", HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "delete role");
            mav.addObject("linkResource", "/role/delete/" + id);
        }
        return mav;
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView roleEdit(@PathVariable int id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-update");
        try {
            Optional<Role> obj = roleRepository.findById(id);
            Role entity = obj.orElseThrow(() -> new ResourceNotFoundException("Role not found"));
            mav.addObject("command", entity);
            mav.addObject("status", HttpStatus.OK);
        } catch (ResourceNotFoundException e) {
            mav.setViewName("errors\\notFoundResource");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "Role");
            mav.addObject("linkResource", "/role");
        }
        return mav;
    }

    @RequestMapping(value = "/edit/{id}/result", method = RequestMethod.POST)
    public ModelAndView roleEditResult(@ModelAttribute Role role) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("role\\role-update");
        try {
            role = roleRepository.save(role);
            mav.addObject("role", role);
            mav.addObject("nameResource", "Role");
            mav.addObject("linkResource", "/role");
            mav.addObject("returnName", "role");
            mav.addObject("status", HttpStatus.ACCEPTED);
        } catch (Exception e) {
            mav.setViewName("errors\\badRequest");
            mav.addObject("error", e.getMessage());
            mav.addObject("nameResource", "Role");
            mav.addObject("returnName", "edit role");
            mav.addObject("linkResource", "/role/edit/" + role.getId());
        }
        return mav;
    }
}

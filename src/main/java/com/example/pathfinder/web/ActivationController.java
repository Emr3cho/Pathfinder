package com.example.pathfinder.web;

import com.example.pathfinder.repository.ActivationRepository;
import com.example.pathfinder.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.UUID;

@Controller
public class ActivationController {

    private final ActivationRepository activationRepository;
    private final UserService userService;

    public ActivationController(ActivationRepository activationRepository, UserService userService) {
        this.activationRepository = activationRepository;
        this.userService = userService;
    }

    @GetMapping("/activation/{id}")
    public String activateProfile(@PathVariable("id") String id){
        var a = activationRepository.findById(id);
        var user = a.get().getUser();
        userService.activateProfile(user);
        return "redirect:/";
    }
}

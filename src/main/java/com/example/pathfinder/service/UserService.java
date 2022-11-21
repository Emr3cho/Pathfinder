package com.example.pathfinder.service;

import com.example.pathfinder.model.User;
import com.example.pathfinder.model.dto.UpdateUserDetailsDTO;
import com.example.pathfinder.model.dto.UserRegistrationDTO;
import com.example.pathfinder.model.enums.Level;
import com.example.pathfinder.repository.UserRepository;
import com.example.pathfinder.user.CurrentUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Optional;

@Service
public final class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void saveNewUser(UserRegistrationDTO userRegistrationDTO) {
        User user = new User();

        user.setUsername(userRegistrationDTO.getUsername());
        user.setFullName(userRegistrationDTO.getFullName());
        user.setEmail(userRegistrationDTO.getEmail());
        user.setAge(userRegistrationDTO.getAge());
        user.setPassword(passwordEncoder.encode(userRegistrationDTO.getPassword()));
        user.setLevel(Level.BEGINNER);

        userRepository.save(user);
    }

    public void updateCurrentLoggedUser(UpdateUserDetailsDTO updateUserDetailsDTO, User user) {

        user.setUsername(updateUserDetailsDTO.getUsername());
        user.setFullName(updateUserDetailsDTO.getFullName());
        user.setEmail(updateUserDetailsDTO.getEmail());
        user.setAge(updateUserDetailsDTO.getAge());

        setPrincipalWithNewUsername(updateUserDetailsDTO.getUsername());

        userRepository.save(user);
    }

    @GetMapping("/routes/{id}")

    public User getUser(String username) {
        var userFromDB = userRepository.findByUsername(username);
        return userFromDB.get();
    }

    private void setPrincipalWithNewUsername(String newUsername) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CurrentUserDetails userDetails = (CurrentUserDetails) authentication.getPrincipal();
        userDetails.setUsername(newUsername);
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId).get();
    }
}

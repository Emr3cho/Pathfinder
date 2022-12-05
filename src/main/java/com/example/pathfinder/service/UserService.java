package com.example.pathfinder.service;

import com.example.pathfinder.model.Comment;
import com.example.pathfinder.model.User;
import com.example.pathfinder.model.dto.UpdateUserDetailsDTO;
import com.example.pathfinder.model.dto.UserRegistrationDTO;
import com.example.pathfinder.model.enums.Level;
import com.example.pathfinder.repository.ActivationRepository;
import com.example.pathfinder.repository.UserRepository;
import com.example.pathfinder.user.CurrentUserDetails;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public final class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final SendEmailService sendEmailService;
    private final ActivationRepository activationRepository;

    private AuthenticationManager authenticationManager;
    private final HttpServletRequest request;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, SendEmailService sendEmailService, ActivationRepository activationRepository, HttpServletRequest request) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.sendEmailService = sendEmailService;
        this.activationRepository = activationRepository;
        this.request = request;
    }

    public void saveNewUser(UserRegistrationDTO userRegistrationDTO) {
        User user = new User();

        user.setUsername(userRegistrationDTO.getUsername());
        user.setFullName(userRegistrationDTO.getFullName());
        user.setEmail(userRegistrationDTO.getEmail());
        user.setAge(userRegistrationDTO.getAge());
        user.setPassword(passwordEncoder.encode(userRegistrationDTO.getPassword()));
        user.setLevel(Level.BEGINNER);
        user.setActive(false);

        sendEmailService.sendWelcomeEmail(user);

        userRepository.save(user);

        //sendEmailService.sendActivationEmail(user);

        //authenticateUserAndSetSession(user);
    }

    public void updateCurrentLoggedUser(UpdateUserDetailsDTO updateUserDetailsDTO, User user) {

        user.setUsername(updateUserDetailsDTO.getUsername());
        user.setFullName(updateUserDetailsDTO.getFullName());
        user.setEmail(updateUserDetailsDTO.getEmail());
        user.setAge(updateUserDetailsDTO.getAge());

        setPrincipalWithNewUsername(updateUserDetailsDTO.getUsername());

        userRepository.save(user);
    }

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

    public List<User> getAllUsers() {
        var allUsers = userRepository.findAll();
        return allUsers;
    }

    public void activateProfile(String activatorId) {
        var activationModel = activationRepository.findById(activatorId);
        var user = activationModel.get().getUser();
        user.setActive(true);

        userRepository.save(user);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CurrentUserDetails userDetails = (CurrentUserDetails) authentication.getPrincipal();
        userDetails.setActive(true);
    }

    public void activateProfileFromZero(Long id) {
        User user = userRepository.findById(id).get();
        sendEmailService.sendActivationEmail(user);
    }

    private void authenticateUserAndSetSession(User user) {
        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
        authToken.setDetails(new WebAuthenticationDetails(request));

        Authentication authentication = authenticationManager.authenticate(authToken);

        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}

package com.example.pathfinder.model.views;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UserProfileView {

    private final String fullName;
    private final String username;
    private final String email;

    private final LocalDateTime registrationDate;

    private final Integer age;
    private final String description;

    private final String level;


    public UserProfileView(String fullName, String username, String email, LocalDateTime registrationDate, Integer age, String description, String level) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.registrationDate = registrationDate;
        this.age = age;
        this.description = description;
        this.level = level;
    }

    public String getFullName() {
        return fullName;
    }

    public String getUsername() {
        return username;
    }
    public String getEmail() {
        return email;
    }

    public LocalDateTime getRegistrationDate() {
        return registrationDate;
    }
    public String getRegistrationDateFormatted() {
        return dateFormatter(this.getRegistrationDate());
    }

    public Integer getAge() {
        return age;
    }

    public String getDescription() {
        return description;
    }

    public String getLevel() {
        return level;
    }

    private String dateFormatter(LocalDateTime dateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String formatDateTime = dateTime.format(formatter);
        return formatDateTime;
    }
}

package com.example.pathfinder.model.dto;

import com.example.pathfinder.model.Category;
import com.example.pathfinder.model.Picture;
import com.example.pathfinder.model.enums.Level;

import java.util.Set;

public class AddRouteDTO {
    private String description;
    private String level;
    private String name;
    private String region;
    private String[] categories;


    public AddRouteDTO(String description, String level, String name, String region, String[] categories) {
        this.description = description;
        this.level = level;
        this.name = name;
        this.region = region;
        this.categories = categories;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String[] getCategories() {
        return categories;
    }

    public void setCategories(String[] categories) {
        this.categories = categories;
    }
}

package com.example.pathfinder.repository;

import com.example.pathfinder.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentReposity extends JpaRepository<Comment, Long> {
}

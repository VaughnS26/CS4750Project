package com.project.cs_4750.movie_rental.controller;

import com.project.cs_4750.movie_rental.model.Director;
import com.project.cs_4750.movie_rental.repository.DirectorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/directors")
public class DirectorController {

    @Autowired
    private DirectorRepository directorRepository;

    @GetMapping
    public List<Director> getAllDirectors() {
        return directorRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Director> getDirectorById(@PathVariable long id) {
        return directorRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Director createDirector(@RequestBody Director director) {
        return directorRepository.save(director);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Director> updateDirector(@PathVariable long id, @RequestBody Director directorDetails) {
        return directorRepository.findById(id)
                .map(director -> {
                    director.setName(directorDetails.getName());
                    director.setAge(directorDetails.getAge());
                    directorRepository.save(director);
                    return ResponseEntity.ok(director);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDirector(@PathVariable long id) {
        return directorRepository.findById(id)
                .map(director -> {
                    directorRepository.delete(director);
                    return ResponseEntity.noContent().<Void>build(); // Explicitly set type
                })
                .orElse(ResponseEntity.notFound().build());
    }
}

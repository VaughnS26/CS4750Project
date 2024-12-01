package com.project.cs_4750.movie_rental.controller;

import com.project.cs_4750.movie_rental.model.Actor;
import com.project.cs_4750.movie_rental.repository.ActorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/actors")
public class ActorController {

    @Autowired
    private ActorRepository actorRepository;

    @GetMapping
    public List<Actor> getAllActors() {
        return actorRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Actor> getActorById(@PathVariable long id) {
        return actorRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Actor createActor(@RequestBody Actor actor) {
        return actorRepository.save(actor);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Actor> updateActor(@PathVariable long id, @RequestBody Actor actorDetails) {
        return actorRepository.findById(id)
                .map(actor -> {
                    actor.setName(actorDetails.getName());
                    actor.setAge(actorDetails.getAge());
                    actorRepository.save(actor);
                    return ResponseEntity.ok(actor);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
public ResponseEntity<Void> deleteActor(@PathVariable long id) {
    return actorRepository.findById(id)
            .map(actor -> {
                actorRepository.delete(actor);
                return ResponseEntity.status(204).<Void>build(); 
            })
            .orElse(ResponseEntity.notFound().build());
}


}

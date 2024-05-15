package br.com.fiap.DirtyCode.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.fiap.DirtyCode.model.Formulario;
import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.FormularioRepository;

@RestController
@RequestMapping(value = "forms")
public class FormularioResource {
	
	@Autowired
	FormularioRepository repository;
	
	@PostMapping
    public ResponseEntity<String> save(@RequestBody Formulario formulario) {
		Formulario save = repository.save(formulario);
        return ResponseEntity.status(HttpStatus.CREATED)
        		.body("Formulario cadastrado com sucesso!");
    }

    @GetMapping
    public List<Formulario> findAll() {
        return repository.findAll();
    }

    @GetMapping("{id}")
    public ResponseEntity<?> findById(@PathVariable Long id) {
        Optional<Formulario> formulario = repository.findById(id);
        if (formulario.isPresent()) {
            return ResponseEntity.ok(formulario.get());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
            		.body("Usuário não encontrado.");
        }
    }

    @DeleteMapping("{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        boolean exists = repository.existsById(id);
        if (exists) {
            repository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK)
            		.body("Formulario deletado com sucesso.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
            		.body("Formulario não encontrado.");
        }
    }
    @PutMapping("{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Formulario formulario) {
        boolean exists = repository.existsById(id);
        if (exists) {
        	formulario.setIdUsuario(id);
            Formulario updateForm = repository.save(formulario);
            return ResponseEntity.ok(updateForm);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
        }
    }
}

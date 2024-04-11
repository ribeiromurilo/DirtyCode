package br.com.fiap.DirtyCode.controller;

import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.NO_CONTENT;
import static org.springframework.http.HttpStatus.NOT_FOUND;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.UsuarioRepository;

@RestController
@RequestMapping(value = "/user")
public class UsuarioResource {

	@Autowired
	UsuarioRepository repository;

	@PostMapping
	@ResponseStatus(CREATED)
	public Usuario save(@RequestBody Usuario usuario) {

		return repository.save(usuario);
	}

	@GetMapping
	public List<Usuario> findAll() {
		return repository.findAll();
	}

	@GetMapping("{id}")
	@PostMapping
	public ResponseEntity<Usuario> findById(@PathVariable Long id) {
		return repository.findById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
	}

	@DeleteMapping("{id}")
	@ResponseStatus(NO_CONTENT)
	public void destroy(@PathVariable Long id) {
		repository.deleteById(id);
	}

	@PutMapping("{id}")
	public Usuario update(@PathVariable Long id, @RequestBody Usuario usuario) {

		usuario.setId(id);
		return repository.save(usuario);
	}

}

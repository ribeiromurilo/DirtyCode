package br.com.fiap.DirtyCode.controller;
import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.NOT_FOUND;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
		return repository.findById(id)
				.map(ResponseEntity::ok)
				.orElse(ResponseEntity.notFound().build());
	}
}

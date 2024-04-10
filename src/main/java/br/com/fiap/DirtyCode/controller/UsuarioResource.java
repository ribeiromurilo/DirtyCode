package br.com.fiap.DirtyCode.controller;
import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.NOT_FOUND;

import java.util.List;

import org.apache.juli.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

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
}

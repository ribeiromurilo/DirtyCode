package br.com.fiap.DirtyCode.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.UsuarioRepository;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value = "/api/user")
public class UsuarioResource {

    @Autowired
    UsuarioRepository repository;

    @PostMapping
    public ResponseEntity<String> save(@RequestBody Usuario usuario) {
        Usuario save = repository.save(usuario);
//        log.info("Usuario cadastrado "+ usuario);
        return ResponseEntity.status(HttpStatus.CREATED).body("Usuário cadastrado com sucesso!");
    }

    @GetMapping
    public List<Usuario> findAll() {
        return repository.findAll();
    }

    @GetMapping("{id}")
    public ResponseEntity<?> findById(@PathVariable Long id) {
        Optional<Usuario> usuario = repository.findById(id);
        if (usuario.isPresent()) {
            return ResponseEntity.ok(usuario.get());
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
            return ResponseEntity.status(HttpStatus.OK).body("Usuário deletado com sucesso.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
        }
    }
    @PutMapping("{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Usuario usuario) {
        boolean exists = repository.existsById(id);
        if (exists) {
            usuario.setId(id);
            Usuario updatedUsuario = repository.save(usuario);
            return ResponseEntity.ok(updatedUsuario);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
        }
    }
    
    @PostMapping("/usuario")
    public ResponseEntity<?> findByEmail(@RequestBody Usuario user) {
        String email = user.getEmail();
        Usuario usuario = repository.findByEmail(email);
        if (usuario != null) {
            if(user.getSenha().equals(usuario.getSenha())) {
            	return ResponseEntity.ok(usuario);
            }else {
            	return ResponseEntity.status(404).body("Email ou senha incorreto!");
			}
        } else {
            return ResponseEntity.status(404).body("Usuário não encontrado");
        }
    }
    
}
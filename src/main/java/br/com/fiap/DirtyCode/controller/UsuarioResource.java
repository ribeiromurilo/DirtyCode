package br.com.fiap.DirtyCode.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    public ResponseEntity<String> save(@RequestBody Usuario usuario) {
        Usuario save = repository.save(usuario);
        return ResponseEntity.status(HttpStatus.CREATED).body("Usuário cadastrado com sucesso!");
    }

    @GetMapping
    public List<Usuario> findAll() {
        return repository.findAll();
    }

    @GetMapping("{id}")
    public ResponseEntity<Usuario> show(@PathVariable Long id){

        return repository
                .findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        repository.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).body("Usuário deletado com sucesso.");
    }

    @PutMapping("{id}")
    public Usuario update(@PathVariable Long id, @RequestBody Usuario usuario) {
        usuario.setId(id);
        return repository.save(usuario);
    }

}

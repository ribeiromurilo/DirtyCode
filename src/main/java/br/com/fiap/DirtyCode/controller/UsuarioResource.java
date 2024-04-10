package br.com.fiap.DirtyCode.controller;


import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import br.com.fiap.DirtyCode.model.entity.Usuario;
import br.com.fiap.DirtyCode.model.repository.UsuarioRepository;


@RestController
@RequestMapping(value = "/user")
public class UsuarioResource {

    @Autowired
    private UsuarioRepository userRepository;

    @PostMapping
    public ResponseEntity<String> save(@RequestBody Usuario usuario) {
        try {
            Usuario savedUser = userRepository.save(usuario);
            return ResponseEntity.ok("Usuário salvo com sucesso. ID: " + savedUser.getId());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Falha ao salvar usuário.");
        }
    }
}

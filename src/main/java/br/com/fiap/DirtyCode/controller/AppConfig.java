package br.com.fiap.DirtyCode.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import br.com.fiap.DirtyCode.model.repository.UsuarioRepository;

@Configuration
@ComponentScan("br.com.fiap.DirtyCode")
public class AppConfig {

    @Bean
    public UsuarioRepository usuarioRepository() {
        return new UsuarioRepository();
    }
}

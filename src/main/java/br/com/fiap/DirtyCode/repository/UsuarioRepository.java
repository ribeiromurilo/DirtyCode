package br.com.fiap.DirtyCode.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.fiap.DirtyCode.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long>{

}

package br.com.fiap.DirtyCode.repository;

import br.com.fiap.DirtyCode.model.Formulario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FormularioRepository extends JpaRepository<Formulario, Long> {
}

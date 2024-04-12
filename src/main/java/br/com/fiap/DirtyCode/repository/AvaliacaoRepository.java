package br.com.fiap.DirtyCode.repository;

import br.com.fiap.DirtyCode.model.Avaliacao;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AvaliacaoRepository extends JpaRepository<Avaliacao, Long> {
}

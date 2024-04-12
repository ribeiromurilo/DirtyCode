package br.com.fiap.DirtyCode.repository;

import br.com.fiap.DirtyCode.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {
}

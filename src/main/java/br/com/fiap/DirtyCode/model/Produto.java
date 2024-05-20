package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "T_PRODUTO")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Produto {

    @Id
    @Column(name = "ID_PRODUTO")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
   
    @Column(name = "NM_PRODUTO")
    private String nome;

    @Column(name = "VL_PRECO")
    private Double preco;

    @Column(name = "DS_DESCRICAO")
    private String descricao;

    
}

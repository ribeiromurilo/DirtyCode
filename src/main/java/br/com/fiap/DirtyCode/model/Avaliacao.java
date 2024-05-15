package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "T_AVALIACAO")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Avaliacao {
    @Id
    @Column(name = "ID_AVALIACAO")
    private Long id;
    @Column(name = "VL_CLASSIFICACAO")
    private Character classificacao;
    @Column(name = "DS_COMENTARIO")
    private String comentario;
    @Column(name = "DT_AVALICACAO")
    private Date dataAvaliacao;
    @Column(name = "ID_PRODUTO")
    private Long idProduto;
    @Column(name = "ID_USUARIO")
    private Long idUsuario;
}

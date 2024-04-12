package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "T_AVALIACAO")
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

    public Avaliacao() {
    }

    public Avaliacao(Long id, Character classificacao, String comentario,
                     Date dataAvaliacao, Long idProduto, Long idUsuario) {
        this.id = id;
        this.classificacao = classificacao;
        this.comentario = comentario;
        this.dataAvaliacao = dataAvaliacao;
        this.idProduto = idProduto;
        this.idUsuario = idUsuario;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Character getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(Character classificacao) {
        this.classificacao = classificacao;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Date getDataAvaliacao() {
        return dataAvaliacao;
    }

    public void setDataAvaliacao(Date dataAvaliacao) {
        this.dataAvaliacao = dataAvaliacao;
    }

    public Long getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Long idProduto) {
        this.idProduto = idProduto;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }
}

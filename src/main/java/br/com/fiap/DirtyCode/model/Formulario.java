package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "T_FORMULARIO")
public class Formulario {
    @Id
    @Column(name = "ID_USUARIO")
    private Long idUsuario;
    @Column(name = "ST_ALERGIA")
    private Character status;
    @Column(name = "DS_ALERGIA")
    private String descricao;
    @Column(name = "DS_PELE")
    private String tipoPele;

    public Formulario() {
    }

    public Formulario(Long idUsuario, Character status, String descricao, String tipoPele) {
        this.idUsuario = idUsuario;
        this.status = status;
        this.descricao = descricao;
        this.tipoPele = tipoPele;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipoPele() {
        return tipoPele;
    }

    public void setTipoPele(String tipoPele) {
        this.tipoPele = tipoPele;
    }
}

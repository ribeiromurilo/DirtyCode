package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "T_FORMULARIO")
@Data
@AllArgsConstructor
@NoArgsConstructor
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

}

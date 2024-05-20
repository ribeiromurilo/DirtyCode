package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "T_USUARIO")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_USUARIO")
    private Long id;
    @NotBlank(message = "O nome não pode estar em branco")
    @Column(name = "NM_NOME")
    private String nome;

    @Column(name = "DS_EMAIL")
    @NotBlank(message = "O email não pode estar em branco")
    @Email(message = "Digite um email válido")
    private String email;
    @Column(name = "NR_CPF")
    @Size(min = 11, max = 11, message = "O CPF deve ter 11 caracteres")
    private String cpf;
    @NotBlank(message = "A senha não pode estar em branco")
    @Column(name = "DS_SENHA")
    @Size(min = 8, message = "A senha deve ter pelo menos 8 caracteres")
    private String senha;
    @Column(name = "NR_TELEFONE")
    @Size(min = 11, max = 15, message = "O numero de telefone tem que ser entre 11 e 15")
    private String telefone;

}

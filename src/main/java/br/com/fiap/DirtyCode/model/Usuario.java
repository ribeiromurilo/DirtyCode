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


@Entity
@Table(name = "T_USUARIO")
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
    @NotBlank(message = "O CPF não pode estar em branco")
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

    public Usuario(Long id, String nome, String email, String cpf, String senha, String telefone) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.senha = senha;
        this.telefone = telefone;
    }

    public Usuario() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id2) {
        this.id = id2;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}

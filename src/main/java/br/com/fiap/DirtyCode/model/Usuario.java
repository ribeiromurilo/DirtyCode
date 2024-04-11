package br.com.fiap.DirtyCode.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "T_USUARIO")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_USUARIO")
	private Long id;
	@Column(name = "NM_NOME")
	private String nome;
	@Column(name = "DS_EMAIL")
	private String email;
	@Column(name = "NR_CPF")
	private String cpf;
	@Column(name = "DS_SENHA")
	private String senha;

	public Usuario(Long id,String nome, String email, String cpf, String senha) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.cpf = cpf;
		this.senha = senha;
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

}

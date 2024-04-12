<div align="center">
    <h2>DirtyCode</h2>
</div>

<p align="center"> <a href="https://www.youtube.com/watch?v=HRahsNwfS4w" target="_blank">Vídeo PITCH de apresentação do projeto</a> falta o link ainda </p>

<h3>Integrantes</h3>

- Matheus Chagas de Moraes Sampaio - RM 550489(2TDSPH)
- Paulo Henrique Moreira Angueira - RM 99704(2TDSPH)
- Victor Hugo Astorino Barra Mansa - RM 550573(2TDSPH)
- Aleck Ramos Cappucci - RM 551340(2TDSPM)
- Murilo Ribeiro Valério da Silva - RM 550858(2TDSPF)

--------------------------------------------------
<h3>Como Rodar a Aplicação </h3>

<h4>Pré-requisitos</h4> 

- [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/downloads/#java11) instalado em seu sistema.
- [Eclipse IDE](https://www.eclipse.org/downloads/) instalado em seu sistema.

<h4>Passos para Executar a Aplicação</h4> 

- Clonar o Repositório:
```bash
git clone https://github.com/matheusCMSampaio/DirtyCode.git
```

--------------------------------------------------


<div align="center">
    <img src="./public/readme.gif" alt="project gif" height="400px"/>
</div>

## 📚 Projeto 

<p></p>
<p></p>

<br/>

## 🖥 Tecnologias

- [Spring](https://spring.io)
- [Docker](https://www.docker.com/)
- [Figma](https://www.figma.com/file/d5rDjubNjdvIn1madq8DZd/Challenge?type=design&node-id=0%3A1&mode=design&t=9i6UZdLvgFCGnHWx-1)

<br/>

## 🧾 Funcionalidades

- [x] Sistema de cadastro totalmente funcional.
- [x] CRUD de usuários.
      
<br/>

## 📈 Diagrama

<div>
    <img src="./Diagrama/Diagrama de Java.png" alt="Diagrama de classes" height="400px"/>
</div>

<br/>

## 📃 Documentação da API

### Endpoints 

- [Autentificação de Usuário](#autentificação-de-usuário)
- [Registro de Usuário](#registro-de-usuário)
- [Obtenção de Usuário](#obtenção-de-usuário)
- [Alteração de Usuário](#alteração-de-usuário)
- [Deletar Usuário](#deletar-usuário)

## 📃 Documentação da API - Usuários

### 💠 Autenticação de Usuário

`POST` /user

Registro de usuário

#### Requisição

```js
{
	"nome": "name",
	"email": "name@gmail.com",
	"cpf": "11111111111",
	"senha": "12345678",
	"telefone":"5511911111111"
}
```

#### Resposta - sucesso

```js

Usuário cadastrado com sucesso!

```

<hr/>

### 💠 Registro de Usuário

`POST` /user

Cadastra um usuário no sistema

#### Requisição

```js
{
	"nome": "name",
	"email": "name@email.com",
	"cpf": "11111111111",
	"senha": "12345678",
	"telefone":"5511911111111"
}
```

#### Resposta - sucesso

```js

Usuário cadastrado com sucesso!

```
                                                
<hr/>

### 💠 Obtenção de Usuário

`GET` /user/{id}

Obtém as informações do usuário.

#### Resposta - sucesso

```js
{
	"id": {id},
	"nome": "name",
	"email": "name@email.com",
	"cpf": "11111111111",
	"senha": "12345678",
	"telefone": "5511911111111"
}
```

#### Resposta - erro

```js

Usuário não encontrado.

```

<br/>

### 💠 Alteração de Usuário

`PUT` /user/{id}

Altera informações do usuário.

#### Requisição

```js
{
	"nome": "name",
	"email": "name@email.com",
	"cpf": "11111111111",
	"senha": "12345678",
	"telefone":"5511911111111"
}
```

#### Resposta - sucesso

```js
{
	"id": {id},
	"nome": "name",
	"email": "name@email.com",
	"cpf": "11111111111",
	"senha": "12345678",
	"telefone": "5511911111111"
}
```

#### Resposta - erro

```js

Usuário não encontrado.

```

<hr/>

### 💠 Deletar Usuário

`DELETE` /user/{id}

Deleta um usuário

### Requisição - via id

#### Resposta - sucesso

```js

Usuário deletado com sucesso.

```

#### Resposta - erro

```js

Usuário não encontrado.

```

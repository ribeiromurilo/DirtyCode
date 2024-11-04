<div align="center">
    <h2>DirtyCode</h2>
</div>

<p align="center"> <a href="https://www.youtube.com/watch?v=HRahsNwfS4w" target="_blank">Vídeo PITCH de apresentação do projeto</a> </p>
<p align="center"> <a href="https://youtu.be/bnGKTKaV4bQ?si=ZIkYqL6Fp2E1uPnl" target="_blank">Video do codigo rodando</a> </p>
<p align="center"><a href="https://youtu.be/VaVm5ogDnw4" target="_blank">Solução</a></p>

<h3>Integrantes</h3>

- Matheus Chagas de Moraes Sampaio - RM 550489(2TDSPH)
- Paulo Henrique Moreira Angueira - RM 99704(2TDSPH)
- Victor Hugo Astorino Barra Mansa - RM 550573(2TDSPH)
- Aleck Ramos Cappucci - RM 551340(2TDSPM)
- Murilo Ribeiro Valério da Silva - RM 550858(2TDSA)

--------------------------------------------------
<h3>Funções</h3>

- Matheus: Java, Mobile
- Paulo: QA
- Victor: IA
- Aleck: .NET
- Murilo: DevOPS, BD
--------------------------------------------------
<h3>Como Rodar a Aplicação </h3>

<h4>Pré-requisitos</h4> 

- [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/downloads/#java11) instalado em seu sistema.
- [Eclipse IDE](https://www.eclipse.org/downloads/) instalado em seu sistema.

<h4>Passos para Executar a Aplicação</h4> 

- Clonar o Repositório:
```bash
git clone https://github.com/matheusCMSampaio/DirtyCode.git
cd DirtyCode
```
- Gerar o .jar
```bash
mvn clean package
```
- Login no Azure Container Registry
```bash
az acr login --name <nome-do-registry>
```
- Construa a imagem Docker usando o Dockerfile do projeto:
```bash
docker build -t <nome-do-registry>.azurecr.io/dirtycode:<versao> -f Dockerfile .
```
- Enviando para o ACR
```bash
docker push <nome-do-registry>.azurecr.io/dirtycode:<versao>
```
- Executando o .jar
```bash
java -jar target/nome-do-arquivo.jar
```
--------------------------------------------------


<div align="center">
    <img src="./public/readme.gif" alt="project gif" height="400px"/>
</div>

## 📚 Projeto 

<p>Nosso projeto planeja um desenvolvimento de uma API com machine leraning para analise de dados. Fazendo recomendações de produtos de uma provável compra para o usuário direcionado</p>
<p></p>

<br/>

## 🖥 Tecnologias

- [Spring](https://spring.io)
- [SQLDeveloper](https://www.oracle.com/br/database/sqldeveloper/)

<br/>

## 🧾 Funcionalidades

- [x] Sistema de cadastro totalmente funcional.
- [x] CRUD de usuários.
      
<br/>

## 📈 Diagrama

<div>
    <img src="./Diagrama/Diagrama de Java.png" alt="Diagrama de classes" height="400px"/>
</div>
<div>
    <img src="./Diagrama/Diagrama de BD.jpg" alt="Diagrama de classes" height="400px"/>
</div>
<br/>


## 📃 Documentação da API - Usuários

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

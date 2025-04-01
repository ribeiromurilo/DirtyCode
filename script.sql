-- DROPS
DROP TABLE t_avaliacao CASCADE CONSTRAINTS;
DROP TABLE t_formulario CASCADE CONSTRAINTS;
DROP TABLE t_produto CASCADE CONSTRAINTS;
DROP TABLE t_usuario CASCADE CONSTRAINTS;
DROP TABLE t_auditoria CASCADE CONSTRAINTS;
DROP TRIGGER trg_t_usuario_auditoria;
DROP SEQUENCE t_avaliacao_seq;
DROP SEQUENCE t_produto_seq;
DROP SEQUENCE t_usuario_seq;
DROP SEQUENCE t_formulario_seq;
DROP SEQUENCE t_auditoria_seq;
DROP PROCEDURE inserir_usuario;
DROP PROCEDURE atualizar_usuario;
DROP PROCEDURE deletar_usuario;
DROP PROCEDURE inserir_produto;
DROP PROCEDURE atualizar_produto;
DROP PROCEDURE deletar_produto;
DROP PROCEDURE inserir_avaliacao;
DROP PROCEDURE atualizar_avaliacao;
DROP PROCEDURE deletar_avaliacao;
DROP PROCEDURE inserir_formulario;
DROP PROCEDURE atualizar_formulario;
DROP PROCEDURE deletar_formulario;
DROP PROCEDURE procedure_join;
DROP PROCEDURE relatorio_media_classificacao;
DROP PROCEDURE relatorio_total_avaliacoes;
DROP PROCEDURE prc_json;
DROP PROCEDURE exibir_valores;
DROP FUNCTION validar_email;
DROP FUNCTION validar_senha;
DROP FUNCTION fnc_json;
DROP FUNCTION fnc_verificar_senha;

-- SPRINT 1
-- CRIAÇÃO DAS TABELAS 
CREATE TABLE t_usuario (
    id_usuario   NUMBER(12) NOT NULL,
    nm_nome      VARCHAR2(50) NOT NULL,
    ds_email     VARCHAR2(100),
    nr_cpf       NUMBER(12) NOT NULL,
    ds_senha     VARCHAR2(20) NOT NULL,
    nr_telefone  NUMBER(16),
    CONSTRAINT t_usuario_pk PRIMARY KEY (id_usuario)
);

CREATE TABLE t_produto (
    id_produto    NUMBER(9) NOT NULL,
    nm_produto    VARCHAR2(40) NOT NULL,
    vl_preco      NUMBER(9, 2) NOT NULL,
    ds_descricao  VARCHAR2(100) NOT NULL,
    CONSTRAINT t_produto_pk PRIMARY KEY (id_produto)
);

CREATE TABLE t_avaliacao (
    id_avaliacao      NUMBER(9) NOT NULL,
    id_usuario        NUMBER(12) NOT NULL,
    id_produto        NUMBER(9) NOT NULL,
    vl_classificacao  NUMBER(2, 1) NOT NULL,
    ds_comentario     VARCHAR2(50),
    dt_avalicacao     DATE NOT NULL,
    CONSTRAINT t_avaliacao_pk PRIMARY KEY (id_avaliacao),
    CONSTRAINT t_avaliacao_t_produto_fk FOREIGN KEY (id_produto)
        REFERENCES t_produto (id_produto),
    CONSTRAINT t_avaliacao_t_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES t_usuario (id_usuario)
);

CREATE TABLE t_formulario (
    id_usuario  NUMBER(12) NOT NULL,
    st_alergia  CHAR(1) NOT NULL,
    ds_alergia  VARCHAR2(200),
    ds_pele     VARCHAR2(20) NOT NULL,
    CONSTRAINT t_formulario_pk PRIMARY KEY (id_usuario),
    CONSTRAINT t_formulario_t_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES t_usuario (id_usuario)
);

-- CRIAÇÃO DAS SEQUENCES
CREATE SEQUENCE T_USUARIO_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
CACHE 20 
NOORDER  
NOCYCLE  
NOKEEP  
NOSCALE  
GLOBAL;
    
CREATE SEQUENCE  T_PRODUTO_SEQ 
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
CACHE 20 
NOORDER  
NOCYCLE  
NOKEEP  
NOSCALE  
GLOBAL ;

CREATE SEQUENCE  T_AVALIACAO_SEQ  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
CACHE 20 
NOORDER  
NOCYCLE  
NOKEEP  
NOSCALE  
GLOBAL ;

CREATE SEQUENCE T_FORMULARIO_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 6
CACHE 20 
NOORDER  
NOCYCLE  
NOKEEP  
NOSCALE  
GLOBAL ;

-- CRIAÇÃO DAS TRIGGERS
CREATE OR REPLACE TRIGGER T_USUARIO_TRG 
BEFORE INSERT ON T_USUARIO 
FOR EACH ROW 
BEGIN
  IF :NEW.ID_USUARIO IS NULL THEN
    SELECT T_USUARIO_SEQ.NEXTVAL INTO :NEW.ID_USUARIO FROM SYS.DUAL;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER T_AVALIACAO_TRG 
BEFORE INSERT ON T_AVALIACAO 
FOR EACH ROW 
BEGIN
  IF :NEW.ID_AVALIACAO IS NULL THEN
    SELECT T_AVALIACAO_SEQ.NEXTVAL INTO :NEW.ID_AVALIACAO FROM SYS.DUAL;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER T_PRODUTO_TRG 
BEFORE INSERT ON T_PRODUTO 
FOR EACH ROW 
BEGIN
  IF :NEW.ID_PRODUTO IS NULL THEN
    SELECT T_PRODUTO_SEQ.NEXTVAL INTO :NEW.ID_PRODUTO FROM SYS.DUAL;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER T_FORMULARIO_TRG 
BEFORE INSERT ON T_FORMULARIO 
FOR EACH ROW 
BEGIN
  IF :NEW.ID_USUARIO IS NULL THEN
    SELECT T_FORMULARIO_SEQ.NEXTVAL INTO :NEW.ID_USUARIO FROM SYS.DUAL;
  END IF;
END;
/

-- INSERÇÃO DE DADOS NA TABELA USUARIO
INSERT INTO T_USUARIO (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
VALUES ('Marcos Paulo da Silva', 'marcos@gmail.com', '12345678900', 'MARquinhos99', '993456789');

INSERT INTO T_USUARIO (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
VALUES ('Fernando Almeida Teixeira', 'fernando@gmail.com', '98765432100', 'Nand0Almeida', '987654321');

INSERT INTO T_USUARIO (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
VALUES ('Pedro Henrique Alves de Oliveira', 'pedro@gmail.com', '45678912300', 'PedroAOl1veira', '956789123');

INSERT INTO T_USUARIO (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
VALUES ('Ana Amorim', 'ana@gmail.com', '32165498700', 'AnaAmorims2', '981654987');

INSERT INTO T_USUARIO (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
VALUES ('Lucas Ribeiro Bittencourt', 'lucas@gmail.com', '78912345600', 'Lucas12345', '989123456');

-- INSERÇÃO DE DADOS NA TABELA PRODUTO
INSERT INTO T_PRODUTO (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
VALUES ('Creme de Barbear Gillette', 29.90, 'Creme de barbear de alta qualidade.');

INSERT INTO T_PRODUTO (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
VALUES ('Shampoo Anticaspa Clear Men', 15.50, 'Shampoo livre de caspas.');

INSERT INTO T_PRODUTO (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
VALUES ('Perfume Masculino Dior', 349.00, 'Fragrância marcante e sedutora.');

INSERT INTO T_PRODUTO (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
VALUES ('Gel de Limpeza Facial Nivea Men', 19.90, 'Gel de limpeza que remove impurezas e oleosidade.');

INSERT INTO T_PRODUTO (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
VALUES ('Creme Anti-Idade LOréal Men', 49.99, 'Creme hidratante anti-idade que reduz rugas e linhas de expressão.');

-- INSERÇÃO DE DADOS NA TABELA FORMULARIO
INSERT INTO T_FORMULARIO (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
VALUES (1, 'T', 'Amendoim', 'Normal');

INSERT INTO T_FORMULARIO (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
VALUES (2, 'F', NULL, 'Sensível');

INSERT INTO T_FORMULARIO (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
VALUES (3, 'T', 'Leite', 'Oleosa');

INSERT INTO T_FORMULARIO (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
VALUES (4, 'F', NULL, 'Normal');

INSERT INTO T_FORMULARIO (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
VALUES (5, 'T', 'Ovo', 'Seca');

-- INSERÇÃO DE DADOS NA TABELA AVALIACAO
INSERT INTO T_AVALIACAO (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
VALUES (1, 1, 4.5, 'Ótimo produto, estou muito satisfeito!', SYSDATE);

INSERT INTO T_AVALIACAO (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
VALUES (2, 2, 3.0, 'Produto regular, poderia ser melhor.', SYSDATE);

INSERT INTO T_AVALIACAO (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
VALUES (3, 3, 5.0, 'Excelente produto, recomendo a todos!', SYSDATE);

INSERT INTO T_AVALIACAO (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
VALUES (4, 4, 2.5, 'Meu marido não gostou muito do produto.', SYSDATE);

INSERT INTO T_AVALIACAO (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
VALUES (5, 5, 4.0, 'Bom produto, atendeu minhas expectativas.', SYSDATE);

-- MÉDIA DE CLASSIFICAÇÃO POR PRODUTO
DECLARE
    CURSOR avaliacao_cursor IS
        SELECT t_avaliacao.id_produto,
               AVG(t_avaliacao.vl_classificacao) AS media_classificacao,
               COUNT(t_avaliacao.id_avaliacao) AS total_avaliacoes,
               t_produto.nm_produto
          FROM t_avaliacao
          JOIN t_produto ON t_avaliacao.id_produto = t_produto.id_produto
         GROUP BY t_avaliacao.id_produto, t_produto.nm_produto
         ORDER BY media_classificacao DESC;
BEGIN
    FOR avaliacao_rec IN avaliacao_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || avaliacao_rec.nm_produto || 
                             ', Média de Classificação: ' || avaliacao_rec.media_classificacao || 
                             ', Total de Avaliações: ' || avaliacao_rec.total_avaliacoes);
    END LOOP;
END;
/

-- TOTAL DE AVALIAÇÕES POR USUÁRIO E PRODUTO
DECLARE
    CURSOR usuario_produto_cursor IS
        SELECT t_usuario.nm_nome,
               t_produto.nm_produto,
               COUNT(t_avaliacao.id_avaliacao) AS total_avaliacoes
          FROM t_usuario
          JOIN t_avaliacao ON t_usuario.id_usuario = t_avaliacao.id_usuario
          JOIN t_produto ON t_avaliacao.id_produto = t_produto.id_produto
         GROUP BY t_usuario.nm_nome, t_usuario.id_usuario, t_produto.nm_produto, t_produto.id_produto;
BEGIN
    FOR usuario_produto_rec IN usuario_produto_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || usuario_produto_rec.nm_nome || 
                             ', Produto: ' || usuario_produto_rec.nm_produto || 
                             ', Total de Avaliações: ' || usuario_produto_rec.total_avaliacoes);
    END LOOP;
END;
/

-- CLASSIFICAÇÕES DOS USUÁRIOS
DECLARE
    CURSOR avaliacao_usuario_cursor IS
        SELECT t_avaliacao.vl_classificacao,
               t_avaliacao.ds_comentario,
               t_usuario.nm_nome
          FROM t_avaliacao
          JOIN t_usuario ON t_avaliacao.id_usuario = t_usuario.id_usuario
         ORDER BY t_avaliacao.vl_classificacao DESC;
BEGIN
    FOR avaliacao_usuario_rec IN avaliacao_usuario_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || avaliacao_usuario_rec.nm_nome || 
                             ', Classificação: ' || avaliacao_usuario_rec.vl_classificacao || 
                             ', Comentário: ' || avaliacao_usuario_rec.ds_comentario);
    END LOOP;
END;
/

-- TESTES
SELECT 
    t_avaliacao.id_produto,
    AVG(t_avaliacao.vl_classificacao) AS media_classificacao,
    COUNT(t_avaliacao.id_avaliacao) AS total_avaliacoes,
    t_produto.nm_produto
FROM 
    t_avaliacao
JOIN 
    t_produto ON t_avaliacao.id_produto = t_produto.id_produto
GROUP BY 
    t_avaliacao.id_produto, t_produto.nm_produto
ORDER BY 
    media_classificacao DESC;

--
SELECT 
    t_usuario.nm_nome AS Usuario,
    t_produto.nm_produto AS Produto,
    COUNT(t_avaliacao.id_avaliacao) AS Total_Avaliacoes
FROM 
    t_usuario
JOIN 
    t_avaliacao ON t_usuario.id_usuario = t_avaliacao.id_usuario
JOIN 
    t_produto ON t_avaliacao.id_produto = t_produto.id_produto
GROUP BY 
    t_usuario.nm_nome, t_produto.nm_produto;

--
SELECT 
    t_avaliacao.vl_classificacao AS Classificacao,
    t_avaliacao.ds_comentario AS Comentario,
    t_usuario.nm_nome AS Usuario
FROM 
    t_avaliacao
JOIN 
    t_usuario ON t_avaliacao.id_usuario = t_usuario.id_usuario
ORDER BY 
    t_avaliacao.vl_classificacao DESC;


------------------------------------------------------------------------

-- SPRINT 2

-- 1) Criar duas funções para validar entrada de dados
-- VALIDAR FORMATO DO EMAIL
CREATE OR REPLACE FUNCTION validar_email(p_email IN VARCHAR2) 
RETURN BOOLEAN 
IS
    v_at   PLS_INTEGER;
    v_dot  PLS_INTEGER;
BEGIN
    v_at := INSTR(p_email, '@');
    v_dot := INSTR(p_email, '.', v_at);

    IF v_at > 1 AND v_dot > v_at + 1 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/

-- VALIDAR A SENHA
CREATE OR REPLACE FUNCTION validar_senha(p_senha IN VARCHAR2) 
RETURN BOOLEAN 
IS
    v_upper_case  PLS_INTEGER;
    v_lower_case  PLS_INTEGER;
    v_digit       PLS_INTEGER;
    v_special_char PLS_INTEGER;
BEGIN
    v_upper_case := REGEXP_COUNT(p_senha, '[A-Z]');
    v_lower_case := REGEXP_COUNT(p_senha, '[a-z]');
    v_digit := REGEXP_COUNT(p_senha, '\d');
    v_special_char := REGEXP_COUNT(p_senha, '[^A-Za-z0-9]');

    IF LENGTH(p_senha) >= 8 AND 
       v_upper_case > 0 AND 
       v_lower_case > 0 AND 
       v_digit > 0 AND 
       v_special_char > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/

-- TESTAR validar_email
DECLARE
    v_email  VARCHAR2(100) := 'teste@email.com';
    v_result BOOLEAN;
BEGIN
    v_result := validar_email(v_email);
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('O e-mail é válido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O e-mail é inválido.');
    END IF;
END;
/

-- TESTAR validar_senha
DECLARE
    v_senha  VARCHAR2(20) := 'SenhaValida@123';
    v_result BOOLEAN;
BEGIN
    v_result := validar_senha(v_senha);
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('A senha é válida.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('A senha é fraca.');
    END IF;
END;
/

-- 2) Criar procedures de INSERT/UPDATE e DELETE para as tabelas criadas anteriormente.
-- PROCEDURES PARA t_usuario
-- INSERT
CREATE OR REPLACE PROCEDURE inserir_usuario (
    p_nm_nome    IN VARCHAR2,
    p_ds_email   IN VARCHAR2,
    p_nr_cpf     IN VARCHAR2,
    p_ds_senha   IN VARCHAR2,
    p_nr_telefone IN VARCHAR2
) IS
BEGIN
    INSERT INTO t_usuario (NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA, NR_TELEFONE)
    VALUES (p_nm_nome, p_ds_email, p_nr_cpf, p_ds_senha, p_nr_telefone);
    COMMIT;
END;
/

-- UPDATE
CREATE OR REPLACE PROCEDURE atualizar_usuario (
    p_id_usuario IN NUMBER,
    p_nm_nome    IN VARCHAR2,
    p_ds_email   IN VARCHAR2,
    p_nr_cpf     IN VARCHAR2,
    p_ds_senha   IN VARCHAR2,
    p_nr_telefone IN VARCHAR2
) IS
BEGIN
    UPDATE t_usuario
    SET NM_NOME = p_nm_nome,
        DS_EMAIL = p_ds_email,
        NR_CPF = p_nr_cpf,
        DS_SENHA = p_ds_senha,
        NR_TELEFONE = p_nr_telefone
    WHERE ID_USUARIO = p_id_usuario;
    COMMIT;
END;
/

-- DELETE
CREATE OR REPLACE PROCEDURE deletar_usuario (
    p_id_usuario IN NUMBER
) IS
BEGIN
    DELETE FROM t_formulario 
    WHERE ID_USUARIO = p_id_usuario;
    DELETE FROM t_usuario 
    WHERE ID_USUARIO = p_id_usuario;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuário e registros relacionados deletados com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar usuário: ' || SQLERRM);
END;
/

-- PROCEDURES PARA t_produto
-- INSERT
CREATE OR REPLACE PROCEDURE inserir_produto (
    p_nm_produto    IN VARCHAR2,
    p_vl_preco      IN NUMBER,
    p_ds_descricao  IN VARCHAR2
) IS
BEGIN
    INSERT INTO t_produto (NM_PRODUTO, VL_PRECO, DS_DESCRICAO)
    VALUES (p_nm_produto, p_vl_preco, p_ds_descricao);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir produto: ' || SQLERRM);
END;
/

-- UPDATE
CREATE OR REPLACE PROCEDURE atualizar_produto (
    p_id_produto    IN NUMBER,
    p_nm_produto    IN VARCHAR2,
    p_vl_preco      IN NUMBER,
    p_ds_descricao  IN VARCHAR2
) IS
BEGIN
    UPDATE t_produto
    SET NM_PRODUTO = p_nm_produto,
        VL_PRECO = p_vl_preco,
        DS_DESCRICAO = p_ds_descricao
    WHERE ID_PRODUTO = p_id_produto;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar produto: ' || SQLERRM);
END;
/

-- DELETE
CREATE OR REPLACE PROCEDURE deletar_produto (
    p_id_produto IN NUMBER
) IS
BEGIN
    DELETE FROM t_avaliacao 
    WHERE ID_PRODUTO = p_id_produto;
    DELETE FROM t_produto 
    WHERE ID_PRODUTO = p_id_produto;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto e avaliações relacionadas deletados com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar produto: ' || SQLERRM);
END;
/

-- PROCEDURES PARA t_avaliacao
-- INSERT
CREATE OR REPLACE PROCEDURE inserir_avaliacao (
    p_id_usuario       IN NUMBER,
    p_id_produto       IN NUMBER,
    p_vl_classificacao IN NUMBER,
    p_ds_comentario    IN VARCHAR2,
    p_dt_avalicacao    IN DATE
) IS
BEGIN
    INSERT INTO t_avaliacao (ID_USUARIO, ID_PRODUTO, VL_CLASSIFICACAO, DS_COMENTARIO, DT_AVALICACAO)
    VALUES (p_id_usuario, p_id_produto, p_vl_classificacao, p_ds_comentario, p_dt_avalicacao);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação inserida com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir avaliação: ' || SQLERRM);
END;
/

-- UPDATE
CREATE OR REPLACE PROCEDURE atualizar_avaliacao (
    p_id_avaliacao    IN NUMBER,
    p_id_usuario      IN NUMBER,
    p_id_produto      IN NUMBER,
    p_vl_classificacao IN NUMBER,
    p_ds_comentario   IN VARCHAR2,
    p_dt_avalicacao   IN DATE
) IS
BEGIN
    UPDATE t_avaliacao
    SET VL_CLASSIFICACAO = p_vl_classificacao,
        DS_COMENTARIO = p_ds_comentario,
        DT_AVALICACAO = p_dt_avalicacao
    WHERE ID_AVALIACAO = p_id_avaliacao AND ID_PRODUTO = p_id_produto AND ID_USUARIO = p_id_usuario;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação atualizada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar avaliação: ' || SQLERRM);
END;
/

-- DELETE
CREATE OR REPLACE PROCEDURE deletar_avaliacao (
    p_id_avaliacao IN NUMBER,
    p_id_produto   IN NUMBER,
    p_id_usuario   IN NUMBER
) IS
BEGIN
    DELETE FROM t_avaliacao 
    WHERE ID_AVALIACAO = p_id_avaliacao AND ID_PRODUTO = p_id_produto AND ID_USUARIO = p_id_usuario;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação deletada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar avaliação: ' || SQLERRM);
END;
/

-- PROCEDURES PARA t_formulario
-- INSERT
CREATE OR REPLACE PROCEDURE inserir_formulario (
    p_id_usuario IN NUMBER,
    p_st_alergia IN CHAR,
    p_ds_alergia IN VARCHAR2,
    p_ds_pele    IN VARCHAR2
) IS
BEGIN
    INSERT INTO t_formulario (ID_USUARIO, ST_ALERGIA, DS_ALERGIA, DS_PELE)
    VALUES (p_id_usuario, p_st_alergia, p_ds_alergia, p_ds_pele);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir formulário: ' || SQLERRM);
END;
/

-- UPDATE
CREATE OR REPLACE PROCEDURE atualizar_formulario (
    p_id_usuario IN NUMBER,
    p_st_alergia IN CHAR,
    p_ds_alergia IN VARCHAR2,
    p_ds_pele    IN VARCHAR2
) IS
BEGIN
    UPDATE t_formulario
    SET ST_ALERGIA = p_st_alergia,
        DS_ALERGIA = p_ds_alergia,
        DS_PELE = p_ds_pele
    WHERE ID_USUARIO = p_id_usuario;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar formulário: ' || SQLERRM);
END;
/

-- DELETE
CREATE OR REPLACE PROCEDURE deletar_formulario (
    p_id_usuario IN NUMBER
) IS
BEGIN
    DELETE FROM t_formulario WHERE ID_USUARIO = p_id_usuario;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário deletado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar formulário: ' || SQLERRM);
END;
/

-- TESTES DE INSERT
-- Inserir usuário
BEGIN
    inserir_usuario('Murilo Silva', 'murilo@email.com', '12345678901', 'SenhaSegura@123', '987654321');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuário inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir usuário: ' || SQLERRM);
END;
/

-- Inserir produto
BEGIN
    inserir_produto('Desodorante Rexona', TO_NUMBER('12.50', '999.99'), 'Desodorante masculino, proteção contra odores.');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir produto: ' || SQLERRM);
END;
/

-- Inserir avaliação
BEGIN
    inserir_avaliacao(6, 6, TO_NUMBER('5.0', '9.9'), 'Ótimo produto!', SYSDATE);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação inserida com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir avaliação: ' || SQLERRM);
END;
/

-- Inserir formulário
BEGIN
    inserir_formulario(6, 'F', NULL, 'Normal');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir formulário: ' || SQLERRM);
END;
/

SELECT * FROM T_USUARIO;
SELECT * FROM T_PRODUTO;
SELECT * FROM T_AVALIACAO;
SELECT * FROM T_FORMULARIO;

-- TESTES DE UPDATE
-- Atualizar usuário
BEGIN
    atualizar_usuario(6, 'Murilo Souza', 'murilosouza@email.com', '12345678901', 'NovaSenhaSegura@123', '987654321');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuário atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar usuário: ' || SQLERRM);
END;
/

-- Atualizar produto
BEGIN
    atualizar_produto(6, 'Desodorante Old Spice', TO_NUMBER('27.90', '999.00'), 'Desodorante com fragrância intensa.');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar produto: ' || SQLERRM);
END;
/

-- Atualizar avaliação
BEGIN
    atualizar_avaliacao(6, 6, 6, TO_NUMBER('4.5', '9.9'), 'Produto bom, mas pode melhorar.', SYSDATE);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação atualizada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar avaliação: ' || SQLERRM);
END;
/

-- Atualizar formulário
BEGIN
    atualizar_formulario(6, 'T', 'Pólen', 'Seca');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar formulário: ' || SQLERRM);
END;
/

SELECT * FROM T_USUARIO;
SELECT * FROM T_PRODUTO;
SELECT * FROM T_AVALIACAO;
SELECT * FROM T_FORMULARIO;


-- TESTES DE DELETE
-- Deletar avaliação
BEGIN
    deletar_avaliacao(6, 6, 6);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Avaliação deletada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar avaliação: ' || SQLERRM);
END;
/

-- Deletar produto
BEGIN
    deletar_produto(6);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto deletado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar produto: ' || SQLERRM);
END;
/

-- Deletar formulário
BEGIN
    deletar_formulario(6);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Formulário deletado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar formulário: ' || SQLERRM);
END;
/

-- Deletar usuário
BEGIN
    deletar_usuario(6);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuário deletado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar usuário: ' || SQLERRM);
END;
/

SELECT * FROM T_USUARIO;
SELECT * FROM T_PRODUTO;
SELECT * FROM T_AVALIACAO;
SELECT * FROM T_FORMULARIO;

-- 4) Criar uma procedure utilizando um curso usar Join com pelo menos 2 tabela do projeto.
CREATE OR REPLACE PROCEDURE PROCEDURE_JOIN AS
    nome_usuario t_usuario.nm_nome%TYPE;
    nome_produto t_produto.nm_produto%TYPE;
BEGIN
    FOR c IN (
        SELECT u.nm_nome AS nome_usuario, p.nm_produto AS nome_produto
        FROM t_usuario u
        JOIN t_avaliacao a ON u.id_usuario = a.id_usuario
        JOIN t_produto p ON a.id_produto = p.id_produto
    ) LOOP
        nome_usuario := c.nome_usuario;
        nome_produto := c.nome_produto;
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || nome_usuario || ', Produto: ' || nome_produto);
    END LOOP;
END;
/

-- TESTE
BEGIN
    PROCEDURE_JOIN;
END;
/

-- 5) Criar uma procedure que imprima um relatório com pelo menos um regra de negócio, que contenha funções, inner Join, order by, sum ou count.
-- PRODUTOS ACIMA DE 3.5
CREATE OR REPLACE PROCEDURE relatorio_media_classificacao AS
    CURSOR c_produtos IS
        SELECT p.id_produto,
               p.nm_produto,
               AVG(a.vl_classificacao) AS media_classificacao
          FROM t_produto p
          JOIN t_avaliacao a ON p.id_produto = a.id_produto
         GROUP BY p.id_produto, p.nm_produto;
BEGIN
    FOR produto_rec IN c_produtos LOOP
        IF produto_rec.media_classificacao > 3.5 THEN
            DBMS_OUTPUT.PUT_LINE('Produto: ' || produto_rec.nm_produto || 
                                 ', Média de Classificação: ' || produto_rec.media_classificacao);
        END IF;
    END LOOP;
END;
/

-- TESTE
BEGIN
    relatorio_media_classificacao;
END;
/

-- TOTAL DE AVALIAÇÕES POR USUÁRIOS
CREATE OR REPLACE PROCEDURE relatorio_total_avaliacoes AS
    CURSOR c_usuarios IS
        SELECT u.nm_nome AS nome_usuario,
               COUNT(a.id_avaliacao) AS total_avaliacoes
          FROM t_usuario u
          LEFT JOIN t_avaliacao a ON u.id_usuario = a.id_usuario
         GROUP BY u.id_usuario, u.nm_nome
         ORDER BY total_avaliacoes DESC;
BEGIN
    FOR usuario_rec IN c_usuarios LOOP
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || usuario_rec.nome_usuario || 
                             ', Total de Avaliações: ' || usuario_rec.total_avaliacoes);
    END LOOP;
END;
/

-- TESTE
BEGIN
    relatorio_total_avaliacoes;
END;
/

-------------------------------------------------

-- SPRINT 3
-- 1) Criar 2 procedimentos

-- 01. join com JSON / converter os dados em formato JSON
CREATE OR REPLACE PROCEDURE prc_json IS
    json_result CLOB;
BEGIN
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'nm_nome' VALUE u.nm_nome,
                   'ds_email' VALUE u.ds_email,
                   'nm_produto' VALUE p.nm_produto,
                   'vl_classificacao' VALUE a.vl_classificacao,
                   'ds_comentario' VALUE a.ds_comentario
               )
           ) INTO json_result
    FROM t_usuario u
    JOIN t_avaliacao a ON u.id_usuario = a.id_usuario
    JOIN t_produto p ON a.id_produto = p.id_produto;
    DBMS_OUTPUT.PUT_LINE(json_result);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Muitos registros encontrados.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- TESTAR
SET SERVEROUTPUT ON;
BEGIN
    prc_json;
END;
/

-- 02. EXIBIR VALOR ANTERIOR, ATUAL E PRÓXIMO
CREATE OR REPLACE PROCEDURE exibir_valores IS
    CURSOR c_usuarios IS
        SELECT id_usuario, nm_nome
        FROM t_usuario
        ORDER BY id_usuario;
    v_anterior c_usuarios%ROWTYPE;
    v_atual c_usuarios%ROWTYPE;
    v_proximo c_usuarios%ROWTYPE;
BEGIN
    OPEN c_usuarios;
    FETCH c_usuarios INTO v_anterior;
    FETCH c_usuarios INTO v_atual;
    FETCH c_usuarios INTO v_proximo;
    DBMS_OUTPUT.PUT_LINE('cod_usuario  Anterior            Atual                Próximo');
    DBMS_OUTPUT.PUT_LINE(
        RPAD(v_anterior.id_usuario, 10) || 
        RPAD('Vazio', 22) || 
        RPAD(v_anterior.nm_nome, 22) || 
        NVL(v_atual.nm_nome, 'Vazio')
    );
    WHILE c_usuarios%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_atual.id_usuario, 10) || 
            RPAD(v_anterior.nm_nome, 22) || 
            RPAD(v_atual.nm_nome, 22) || 
            NVL(v_proximo.nm_nome, 'Vazio')
        );
        v_anterior := v_atual;
        v_atual := v_proximo;
        FETCH c_usuarios INTO v_proximo;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(
        RPAD(v_atual.id_usuario, 10) || 
        RPAD(v_anterior.nm_nome, 22) || 
        RPAD(v_atual.nm_nome, 22) || 
        'Vazio'
    );
    CLOSE c_usuarios;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Muitos registros encontrados.');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Erro de valor.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- TESTAR
SET SERVEROUTPUT ON;
BEGIN
    exibir_valores;
END;
/

-- 2) Desenvolver duas funções
-- 01. Passar dados em JSON
CREATE OR REPLACE FUNCTION fnc_json(
    p_cursor SYS_REFCURSOR
) RETURN CLOB IS
    json_result CLOB := '{"avaliacoes": [';
    v_novo_registro CLOB;
    v_nome VARCHAR2(100);
    v_email VARCHAR2(100);
    v_produto VARCHAR2(100);
    v_classificacao NUMBER;
    v_comentario VARCHAR2(4000);
BEGIN
    LOOP
        FETCH p_cursor INTO v_nome, v_email, v_produto, v_classificacao, v_comentario;
        EXIT WHEN p_cursor%NOTFOUND;
        v_nome := REPLACE(v_nome, '"', '\"');
        v_email := REPLACE(v_email, '"', '\"');
        v_produto := REPLACE(v_produto, '"', '\"');
        v_comentario := REPLACE(v_comentario, '"', '\"');
        v_novo_registro := '{"nome": "' || NVL(v_nome, 'Vazio') || '", ' ||
                           '"email": "' || NVL(v_email, 'Vazio') || '", ' ||
                           '"produto": "' || NVL(v_produto, 'Vazio') || '", ' ||
                           '"classificacao": ' || NVL(v_classificacao, '0') || ', ' ||
                           '"comentario": "' || NVL(v_comentario, 'Vazio') || '"},';
        json_result := json_result || v_novo_registro;
    END LOOP;
    json_result := RTRIM(json_result, ',') || ']}';
    RETURN json_result;
EXCEPTION
    WHEN OTHERS THEN
        RETURN '{"error": "Erro: ' || SQLERRM || '"}';
END;
/

-- TESTAR
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_json CLOB;
BEGIN
    OPEN v_cursor FOR
        SELECT u.nm_nome, u.ds_email, p.nm_produto, a.vl_classificacao, a.ds_comentario
        FROM t_usuario u
        JOIN t_avaliacao a ON u.id_usuario = a.id_usuario
        JOIN t_produto p ON a.id_produto = p.id_produto;
    v_json := fnc_json(v_cursor);
    DBMS_OUTPUT.PUT_LINE(v_json);
    CLOSE v_cursor;
END;
/

-- 02. VERIFICAR SENHA
CREATE OR REPLACE FUNCTION fnc_verificar_senha(p_senha IN VARCHAR2) RETURN VARCHAR2 IS
BEGIN
    IF LENGTH(p_senha) < 8 THEN
        RETURN 'Senha muito curta. Deve ter pelo menos 8 caracteres.';
    ELSIF NOT REGEXP_LIKE(p_senha, '[A-Z]') THEN
        RETURN 'Senha deve conter pelo menos uma letra maiúscula.';
    ELSIF NOT REGEXP_LIKE(p_senha, '[a-z]') THEN
        RETURN 'Senha deve conter pelo menos uma letra minúscula.';
    ELSIF NOT REGEXP_LIKE(p_senha, '[0-9]') THEN
        RETURN 'Senha deve conter pelo menos um número.';
    ELSIF NOT REGEXP_LIKE(p_senha, '[!@#$%^&*(),.<>?/\|}{~:]') THEN
        RETURN 'Senha deve conter pelo menos um caractere especial.';
    ELSIF REGEXP_LIKE(p_senha, '\s') THEN
        RETURN 'Senha não deve conter espaços em branco.';
    ELSE
        RETURN 'Senha válida.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Erro ao verificar a senha: ' || SQLERRM;
END;
/

-- TESTAR
DECLARE
    v_result VARCHAR2(4000);
BEGIN
    v_result := fnc_verificar_senha('Senha@123');
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

-- 3) Gatilho 
-- CRIAÇÃO DA TABELA
CREATE TABLE t_auditoria (
    id_auditoria NUMBER(12) NOT NULL,
    nome_tabela  VARCHAR2(30) NOT NULL,
    operacao     VARCHAR2(10) NOT NULL,
    dados_antigos CLOB,
    dados_novos  CLOB,
    usuario      VARCHAR2(50) NOT NULL,
    data_operacao DATE NOT NULL,
    CONSTRAINT t_auditoria_pk PRIMARY KEY (id_auditoria)
);

CREATE SEQUENCE t_auditoria_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- GATILHO t_usuario_auditoria
CREATE OR REPLACE TRIGGER trg_t_usuario_auditoria
AFTER INSERT OR UPDATE OR DELETE ON t_usuario
FOR EACH ROW
DECLARE
    v_dados_antigos CLOB;
    v_dados_novos  CLOB;
BEGIN
    IF INSERTING THEN
        v_dados_antigos := NULL;
        v_dados_novos := 'ID_USUARIO=' || :NEW.ID_USUARIO || 
                         ', NM_NOME=' || :NEW.NM_NOME ||
                         ', DS_EMAIL=' || :NEW.DS_EMAIL ||
                         ', NR_CPF=' || :NEW.NR_CPF ||
                         ', DS_SENHA=' || :NEW.DS_SENHA ||
                         ', NR_TELEFONE=' || :NEW.NR_TELEFONE;
        INSERT INTO t_auditoria (id_auditoria, nome_tabela, operacao, dados_antigos, dados_novos, usuario, data_operacao)
        VALUES (t_auditoria_seq.NEXTVAL, 't_usuario', 'INSERT', v_dados_antigos, v_dados_novos, USER, SYSDATE);
    ELSIF UPDATING THEN
        v_dados_antigos := 'ID_USUARIO=' || :OLD.ID_USUARIO ||
                           ', NM_NOME=' || :OLD.NM_NOME ||
                           ', DS_EMAIL=' || :OLD.DS_EMAIL ||
                           ', NR_CPF=' || :OLD.NR_CPF ||
                           ', DS_SENHA=' || :OLD.DS_SENHA ||
                           ', NR_TELEFONE=' || :OLD.NR_TELEFONE;
        v_dados_novos := 'ID_USUARIO=' || :NEW.ID_USUARIO ||
                         ', NM_NOME=' || :NEW.NM_NOME ||
                         ', DS_EMAIL=' || :NEW.DS_EMAIL ||
                         ', NR_CPF=' || :NEW.NR_CPF ||
                         ', DS_SENHA=' || :NEW.DS_SENHA ||
                         ', NR_TELEFONE=' || :NEW.NR_TELEFONE;
        INSERT INTO t_auditoria (id_auditoria, nome_tabela, operacao, dados_antigos, dados_novos, usuario, data_operacao)
        VALUES (t_auditoria_seq.NEXTVAL, 't_usuario', 'UPDATE', v_dados_antigos, v_dados_novos, USER, SYSDATE);
    ELSIF DELETING THEN
        v_dados_antigos := 'ID_USUARIO=' || :OLD.ID_USUARIO ||
                           ', NM_NOME=' || :OLD.NM_NOME ||
                           ', DS_EMAIL=' || :OLD.DS_EMAIL ||
                           ', NR_CPF=' || :OLD.NR_CPF ||
                           ', DS_SENHA=' || :OLD.DS_SENHA ||
                           ', NR_TELEFONE=' || :OLD.NR_TELEFONE;
        v_dados_novos := NULL;
        INSERT INTO t_auditoria (id_auditoria, nome_tabela, operacao, dados_antigos, dados_novos, usuario, data_operacao)
        VALUES (t_auditoria_seq.NEXTVAL, 't_usuario', 'DELETE', v_dados_antigos, v_dados_novos, USER, SYSDATE);
    END IF;
END;
/

-- TESTAR CRUD
INSERT INTO t_usuario (id_usuario, nm_nome, ds_email, nr_cpf, ds_senha, nr_telefone)
VALUES (6, 'João Silva', 'joao.silva@teste.com', '12345678901', 'senha123', '11987654321');

UPDATE t_usuario
SET nm_nome = 'João da Silva', ds_email = 'joao.dasilva@teste.com'
WHERE id_usuario = 6;

DELETE FROM t_usuario
WHERE id_usuario = 6;

-- VISUALIZAR
SELECT * FROM t_auditoria
ORDER BY data_operacao DESC;

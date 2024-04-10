package br.com.fiap.DirtyCode.model.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.fiap.DirtyCode.model.entity.Usuario;

public class UsuarioRepository extends Repository {

    public Usuario save(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO T_USUARIO (ID_USUARIO, NM_NOME, DS_EMAIL, NR_CPF, DS_SENHA) VALUES (SQ_ID_USUARIO.nextval,?,?,?,?)";

        try (PreparedStatement ps = getConn().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getCpf());
            ps.setString(4, usuario.getSenha());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Falha ao inserir usuário. Nenhuma linha afetada.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    Long id = generatedKeys.getLong(1);
                    usuario.setId(id);
                    System.out.println("Usuário inserido com sucesso. ID: " + id);
                    return usuario;
                } else {
                    throw new SQLException("Falha ao inserir usuário. Nenhum ID obtido.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao salvar usuário: " + e.getMessage());
            throw new RuntimeException("Erro ao salvar usuário", e); // relança a exceção com uma mensagem mais descritiva
        } finally {
            closeConn();
        }
    }

}
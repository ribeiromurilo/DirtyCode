package br.com.fiap.DirtyCode.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.UsuarioRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/user")
@Slf4j
public class UsuarioResource {

    @Autowired
    UsuarioRepository repository;

    // Página para exibir todos os usuários
    @GetMapping
    public String getAllUsersPage(Model model) {
        List<Usuario> usuarios = repository.findAll();
        model.addAttribute("usuarios", usuarios);
        return "userList";  // Nome do template Thymeleaf userList.html
    }

    // Página para exibir um único usuário
    @GetMapping("{id}")
    public String findById(@PathVariable Long id, Model model) {
        Optional<Usuario> usuario = repository.findById(id);
        if (usuario.isPresent()) {
            model.addAttribute("usuario", usuario.get());
            return "userDetail";  // Nome do template Thymeleaf userDetail.html
        } else {
            model.addAttribute("error", "Usuário não encontrado.");
            return "error";  // Nome do template para erro
        }
    }

    // Formulário para cadastrar novo usuário
    @GetMapping("/new")
    public String showNewUserForm(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "userForm";  // Template Thymeleaf com formulário de criação
    }

    // Salvar novo usuário
    @PostMapping("/save")
    public String save(@ModelAttribute Usuario usuario, Model model) {
        try {
            repository.save(usuario);
            model.addAttribute("message", "Usuário cadastrado com sucesso!");
            return "success";  // Página de sucesso
        } catch (Exception e) {
            model.addAttribute("error", "Erro ao cadastrar o usuário.");
            return "error";  // Página de erro
        }
    }

    // Página para deletar usuário
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id, Model model) {
        boolean exists = repository.existsById(id);
        if (exists) {
            repository.deleteById(id);
            model.addAttribute("message", "Usuário deletado com sucesso.");
            return "success";  // Página de sucesso
        } else {
            model.addAttribute("error", "Usuário não encontrado.");
            return "error";  // Página de erro
        }
    }

    // Página para atualizar usuário
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<Usuario> usuario = repository.findById(id);
        if (usuario.isPresent()) {
            model.addAttribute("usuario", usuario.get());
            return "userForm";  // Mesmo template do formulário de criação
        } else {
            model.addAttribute("error", "Usuário não encontrado.");
            return "error";  // Página de erro
        }
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Usuario usuario, Model model) {
        boolean exists = repository.existsById(id);
        if (exists) {
            usuario.setId(id);
            repository.save(usuario);
            model.addAttribute("message", "Usuário atualizado com sucesso!");
            return "success";  // Página de sucesso
        } else {
            model.addAttribute("error", "Usuário não encontrado.");
            return "error";  // Página de erro
        }
    }
}

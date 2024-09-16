package br.com.fiap.DirtyCode.controller;

import br.com.fiap.DirtyCode.model.Produto;
import br.com.fiap.DirtyCode.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/produto")
public class ProdutoResourceThymeleaf {

    @Autowired
    private ProdutoRepository repository;

    // Listar produtos
    @GetMapping("/list")
    public ModelAndView listarProdutos() {
        ModelAndView modelAndView = new ModelAndView("produto-list");
        modelAndView.addObject("produtos", repository.findAll());
        modelAndView.addObject("title", "Lista de Produtos");
        return modelAndView;
    }

    // Adicionar novo produto (Formulário de criação)
    @GetMapping("/new")
    public String novoProdutoForm(Model model) {
        model.addAttribute("produto", new Produto());
        model.addAttribute("title", "Adicionar Novo Produto");
        return "produto-form";
    }

    // Salvar o produto
    @PostMapping("/save")
    public String salvarProduto(@ModelAttribute Produto produto) {
        repository.save(produto);
        return "redirect:/produto/list";
    }

    @GetMapping("/edit/{id}")
    public String editarProdutoForm(@PathVariable("id") Long id, Model model) {
        Produto produto = repository.findById(id).orElseThrow(() -> new IllegalArgumentException("ID inválido: " + id));
        model.addAttribute("produto", produto);
        model.addAttribute("title", "Editar Produto");
        return "produto-form";
    }

    // Atualizar produto
    @PostMapping("/update/{id}")
    public String atualizarProduto(@PathVariable("id") Long id, @ModelAttribute Produto produto) {
        produto.setId(id);
        repository.save(produto);
        return "redirect:/produto/list";
    }

    // Excluir produto
    @GetMapping("/delete/{id}")
    public String excluirProduto(@PathVariable("id") Long id) {
        Produto produto = repository.findById(id).orElseThrow(() -> new IllegalArgumentException("ID inválido: " + id));
        repository.delete(produto);
        return "redirect:/produto/list";
    }
}

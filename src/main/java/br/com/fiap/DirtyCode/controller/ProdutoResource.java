package br.com.fiap.DirtyCode.controller;
import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.NOT_FOUND;
import static org.springframework.http.HttpStatus.NO_CONTENT;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.fiap.DirtyCode.model.Produto;
import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.ProdutoRepository;
import jakarta.validation.Valid;
import jakarta.websocket.server.PathParam;

@RequestMapping(value = "produto")
@RestController
public class ProdutoResource {
	
	@Autowired
	ProdutoRepository repository;
	
	@GetMapping
	public List<Produto> findAll(){
		return repository.findAll();
	}
	
	@PostMapping
	@ResponseStatus(CREATED)
	public Produto save(@RequestBody @Valid Produto produto) {
		return repository.save(produto);
	}
	
	@GetMapping("{id}")
	public ResponseEntity<?> findById(@PathVariable Long id){
		Optional<Produto> produto = repository.findById(id);
		if(produto.isPresent()) {
			return ResponseEntity.ok(produto.get());
		}else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body("Produto não encontrado");
		}
	}
	@DeleteMapping("{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        boolean exists = repository.existsById(id);
        if (exists) {
            repository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK).body("Produto deletado com sucesso.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produto não encontrado.");
        }
    }
    @PutMapping("{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Produto produto) {
        boolean exists = repository.existsById(id);
        if (exists) {
            produto.setId(id);
            Produto updatedProd= repository.save(produto);
            return ResponseEntity.ok(updatedProd);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produto não encontrado.");
        }
    }
}

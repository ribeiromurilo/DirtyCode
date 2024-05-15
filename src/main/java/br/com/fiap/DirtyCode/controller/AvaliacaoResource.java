package br.com.fiap.DirtyCode.controller;

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
import org.springframework.web.bind.annotation.RestController;

import br.com.fiap.DirtyCode.model.Avaliacao;
import br.com.fiap.DirtyCode.model.Usuario;
import br.com.fiap.DirtyCode.repository.AvaliacaoRepository;

@RestController
@RequestMapping(value = "avalicoes")
public class AvaliacaoResource {

	@Autowired
	AvaliacaoRepository repository;

	@PostMapping
	public ResponseEntity<String> save(@RequestBody Avaliacao avaliacao) {
		Avaliacao save = repository.save(avaliacao);

		return ResponseEntity.status(HttpStatus.CREATED).body("Usuário cadastrado com sucesso!");
	}

	@GetMapping
	public List<Avaliacao> findAll() {
		return repository.findAll();
	}

	@GetMapping("{id}")
	public ResponseEntity<?> findById(@PathVariable Long id) {
		Optional<Avaliacao> avaliacao = repository.findById(id);
		if (avaliacao.isPresent()) {
			return ResponseEntity.ok(avaliacao.get());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body("Avaliação não encontrado.");
		}
	}

	@DeleteMapping("{id}")
	public ResponseEntity<String> delete(@PathVariable Long id) {
		boolean exists = repository.existsById(id);
		if (exists) {
			repository.deleteById(id);
			return ResponseEntity.status(HttpStatus.OK).body("Avaliação deletado com sucesso.");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body("Avaliação não encontrado.");
		}
	}

	@PutMapping("{id}")
	public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Avaliacao avaliacao) {
		boolean exists = repository.existsById(id);
		if (exists) {
			avaliacao.setId(id);
			Avaliacao updatedAvaliacao = repository.save(avaliacao);
			return ResponseEntity.ok(updatedAvaliacao);
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
		}
	}
}

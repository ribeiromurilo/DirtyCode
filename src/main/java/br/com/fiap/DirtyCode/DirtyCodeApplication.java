package br.com.fiap.DirtyCode;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@SpringBootApplication
public class DirtyCodeApplication {

	public static void main(String[] args) {
		SpringApplication.run(DirtyCodeApplication.class, args);
	}
	
	@RequestMapping
	@ResponseBody
	public String home() {
		return "Bem-vindo";
	}

}

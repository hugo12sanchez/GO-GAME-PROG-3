package com.example.grupo.belmg.paginavideojuegos.Repositorios;

import com.example.grupo.belmg.paginavideojuegos.Entidades.Base;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

@NoRepositoryBean
public interface RepositorioBase <E extends Base, ID extends Serializable> extends JpaRepository<E, ID> {

}

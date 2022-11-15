package com.example.grupo.belmg.paginavideojuegos.Repositorios;

import com.example.grupo.belmg.paginavideojuegos.Entidades.Categoria;
import com.example.grupo.belmg.paginavideojuegos.Entidades.Merch;
import com.example.grupo.belmg.paginavideojuegos.Entidades.Videojuego;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RepositorioMerch extends RepositorioBase<Merch, Long>{

    /*@Query(value = "SELECT * FROM merchs WHERE merchs.nombre LIKE %?1%",
            nativeQuery = true
    )
    List<Merch> search(String filtro);*/

    @Query(value = "SELECT * FROM merchs WHERE merchs.activo = true", countQuery = "SELECT count(*) FROM merchs", nativeQuery = true)
    Page<Merch> findAllByActivo(Pageable pageable);

    @Query(value = "SELECT * FROM merchs WHERE merchs.id = :id AND merchs.activo = true", nativeQuery = true)
    Optional<Merch> findByIdAndActivo(@Param("id") long id);


    @Query(
            value = "SELECT * FROM merchs WHERE merchs.nombre LIKE %:filtro%",
            nativeQuery = true
    )
    List<Merch> searchNativo(@Param("filtro") String filtro);

    @Query(
            value = "SELECT * FROM merchs WHERE merchs.nombre LIKE %:filtro%",
            countQuery = "SELECT count(*) FROM merchs",
            nativeQuery = true
    )
    Page<Merch> searchNativo(@Param("filtro") String filtro, Pageable pageable);

    @Query(value = "SELECT * FROM merchs WHERE merchs.nombre LIKE %:q% AND merchs.activo =true", nativeQuery = true, countQuery = "SELECT count(*) FROM merch")
    Page<Merch> findByNombre(@Param("q")String q, Pageable pageable);
}

package com.example.grupo.belmg.paginavideojuegos.Controladores;

import com.example.grupo.belmg.paginavideojuegos.Entidades.Merch;
import com.example.grupo.belmg.paginavideojuegos.Servicios.ImplementacionServicioMerch;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "gogames/v1/merchs")
public class ControladorMerch extends ImplementacionControladorBase<Merch, ImplementacionServicioMerch>{
}

package com.proyect.lab5_20203644.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homecontroller {

    @GetMapping({"/", "/profesionales"})
    public String profesionales() {
        return "profesional";
    }

    @GetMapping("/pacientes")
    public String pacientes() {
        return "pacientes";
    }

    @GetMapping("/citas")
    public String citas() {
        return "citas";
    }

    @GetMapping("/foro")
    public String foro() {
        return "/foro";
    }
}

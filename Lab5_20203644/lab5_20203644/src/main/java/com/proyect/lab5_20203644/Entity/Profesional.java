package com.proyect.lab5_20203644.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "profesionales")
public class Profesional {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idProfesionales")
    private Integer id;

    private String nombre;
    private String imagen;
    @Column(name = "descripcionProfesional")
    private String descripcion;

}

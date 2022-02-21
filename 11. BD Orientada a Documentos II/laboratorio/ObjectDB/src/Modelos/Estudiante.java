/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Date;
import javax.persistence.Entity;

/**
 *
 * @author neriomoran
 */
@Entity
public class Estudiante extends Persona{
    
    private float promedioNotas;
    private char Status;
    private Date FechaInscripcion;
    private Integer CodCarrera;
       
    
    
    public Estudiante
    (String Nombre, String Apellido, String Cedula, Date FechaNacimiento,
    float promedioNotas,char Status,Date FechaInscripcion,Integer CodCarrera)
    {        
        super(Nombre, Apellido, Cedula, FechaNacimiento);
        
        this.promedioNotas = promedioNotas;
        this.Status = Status;
        this.FechaInscripcion = FechaInscripcion;
        this.CodCarrera = CodCarrera;
    
    
    }

    /**
     * @return the promedioNotas
     */
    public float getPromNotas() {
        return promedioNotas;
    }

    /**
     * @return the Status
     */
    public char getStatus() {
        return Status;
    }

    /**
     * @return the FechaInscripcion
     */
    public Date getFechaI() {
        return FechaInscripcion;
    }

    /**
     * @return the CodCarrera
     */
    public Integer getCodCarrera() {
        return CodCarrera;
    }
    
    
    public void imprimirDatos(){
        System.out.println(String.format("(%s, %s,%s, %s, %f, %c,%s, %d)",
            this.getNombre(), this.getApellido(),this.getCedula(),
            this.getFechaNacimiento().toString(), this.promedioNotas,
            this.Status,this.FechaInscripcion.toString(),this.CodCarrera
        ));
    }
    
    
}

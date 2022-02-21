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
public class Profesor extends Persona{
    
    private char Escalafon;
    private boolean Ordinario;
    private float Salario;
    private Date FechaInicio;
    
    
    public Profesor
    (String Nombre, String Apellido, String Cedula, Date FechaNacimiento,
     char Escalafon, boolean Ordinario, float Salario, Date FeDate) {
        super(Nombre, Apellido, Cedula, FechaNacimiento);
        
        this.Escalafon = Escalafon;
        this.Ordinario = Ordinario;
        this.Salario = Salario;
        this.FechaInicio = FechaNacimiento;
                
    }

    /**
     * @return the Escalafon
     */
    public char getEscalafon() {
        return Escalafon;
    }

    /**
     * @return the Ordinario
     */
    public boolean isOrdinario() {
        return Ordinario;
    }

    /**
     * @return the Salario
     */
    public float getSalario() {
        return Salario;
    }

    /**
     * @return the FechaInicio
     */
    public Date getFechaInicio() {
        return FechaInicio;
    }
    
 
    public void imprimirDatos(){
        System.out.println(String.format("(%s, %s,%s, %s, %c, %b,%f, %s)",
            this.getNombre(), this.getApellido(),this.getCedula(),
            this.getFechaNacimiento().toString(), this.Escalafon,
            this.Ordinario,this.Salario,this.FechaInicio.toString()
        ));
    }
    
}

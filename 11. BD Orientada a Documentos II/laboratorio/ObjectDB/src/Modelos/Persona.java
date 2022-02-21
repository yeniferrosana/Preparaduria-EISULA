/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author neriomoran
 */
@Entity
public class Persona {
    
    @Id private String Cedula;
    private String Nombre;
    private String Apellido;
    private Date FechaNacimiento;

    
    
        
    /**
     * 
     */
    public Persona
        (String Nombre, String Apellido, String Cedula, Date FechaNacimiento ) {
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Cedula = Cedula;
        this.FechaNacimiento = FechaNacimiento;
                
    }
    
    
    
    public Integer getEdad() {
        Calendar dob = Calendar.getInstance();
        dob.setTime(this.FechaNacimiento);
        Calendar today = Calendar.getInstance();
        Integer age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
        if (today.get(Calendar.DAY_OF_YEAR) < dob.get(Calendar.DAY_OF_YEAR))
        age--;
        return age;
    }
    
   
    
    
    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @return the Apellido
     */
    public String getApellido() {
        return Apellido;
    }

    /**
     * @return the Cedula
     */
    public String getCedula() {
        return Cedula;
    }

    /**
     * @return the FechaNacimiento
     */
    public Date getFechaNacimiento() {
        return FechaNacimiento;
    }

   
}

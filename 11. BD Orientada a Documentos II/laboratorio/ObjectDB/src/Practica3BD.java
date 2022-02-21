/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Modelos.*;

import static com.sun.org.apache.xalan.internal.lib.ExsltMath.random;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import static jdk.nashorn.internal.objects.NativeMath.random;

/**
 *
 * @author neriomoran
 */
public class Practica3BD {
    
    protected static Random random = new Random();
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
        // TODO code application logic here
        
        
      // Open a database connection
        EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("$objectdb/db/practica3.odb");
        
        
        // Realiza la conexion a la base de datos
        EntityManager em = emf.createEntityManager();
 
        
     
        em.getTransaction().begin();
        
        
        //Inializacion de la informacion
       for (int i = 11; i < 20; i++) {
            Estudiante student = new Estudiante("Alvaro"+Integer.toString(i),
            "Luis"+Integer.toString(i),Integer.toString(i),
            Practica3BD.genRandonDate(), Practica3BD.randomInRange(0, 20), 
            Practica3BD.randomChar(), Practica3BD.genRandonDate(), Practica3BD.randomInterger(0, i));
            
            
           Profesor professor = new Profesor("Carlos"+Integer.toString(i),
            "Antonio"+Integer.toString(i),Integer.toString(i+1000),
                   Practica3BD.genRandonDate(), Practica3BD.randomChar(),
                   Practica3BD.randomBool(),Practica3BD.randomInRange(0, 2000), Practica3BD.genRandonDate());
            
            
            
            em.persist(professor);
            em.persist(student);
            
        }
        
        em.getTransaction().commit();//punto de la transaccion
        
        
        // Imprimir Estudiantes 
        TypedQuery<Estudiante> querys =
            em.createQuery("SELECT student FROM Estudiante student", Estudiante.class);
        List<Estudiante> results = querys.getResultList();
        for (Estudiante student : results) {
            student.imprimirDatos();
        }
        
        // Imprimir Profesores
        TypedQuery<Profesor> queryp =
            em.createQuery("SELECT professor FROM Profesor professor", Profesor.class);
        List<Profesor> resultsp = queryp.getResultList();
        for (Profesor professor : resultsp) {
            professor.imprimirDatos();
        }
        
        // numero de estudiantes activados
        Query q1 = em.createQuery("SELECT COUNT(student)"
                                + "FROM Estudiante student "
                                  +"WHERE student.Status= 'A' ");
        System.out.println("Estudiantes Activos: " + q1.getSingleResult());
        
        
        //Promedio de notas de los promedios de los estudiantes registrados
        Query q2 = em.createQuery("SELECT AVG(student.promedioNotas)"
                                + "FROM Estudiante student");
        System.out.println("Promedio de notas de todos los estudiantes registrados " + q2.getSingleResult());
        
        
        //Media de la edad de estudiantes inactivos
        TypedQuery<Estudiante> query3 =
            em.createQuery("SELECT AVG(student.getEdad())"
                    + " FROM Estudiante student"
                    + " WHERE student.Status='I' ", Estudiante.class);
    
        System.out.println("Edad media de los estudiantes inactivos " + query3.getSingleResult());
        
        
        
        
        
       // Imprimir Profesores ordinarios y la media de sus salarios
        TypedQuery<Profesor> query4 =
            em.createQuery("SELECT professor"
                    + " FROM Profesor professor "
                    + "WHERE professor.Ordinario = true", Profesor.class);
            
        Query q4 = em.createQuery("SELECT AVG(professor.Salario)"
                    + " FROM Profesor professor "
                    + "WHERE professor.Ordinario = true", Profesor.class);
        
        List<Profesor> resultp_ord = query4.getResultList();
        
        System.out.println("Profesores ordinarios");
        for (Profesor professor : resultp_ord) {
            professor.imprimirDatos();
        }
        
        System.out.println("Media Salarios profesores ordinarios " + q4.getSingleResult());
        
        
        
        //Informacion de los profesores que comenzaron a laborar en el 2016
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse("2016-01-01");
       
         TypedQuery<Profesor> query5 =
            em.createQuery("SELECT professor"
                    + " FROM Profesor professor "
                    + " WHERE professor.FechaInicio >= :date ", Profesor.class);
                        
        List<Profesor> resultp_act;
        resultp_act = query5.setParameter("date", date, TemporalType.TIMESTAMP).getResultList();
        
        System.out.println("Profesores que iniciaron en 2016");
        for (Profesor professor : resultp_act) {
            professor.imprimirDatos();
        }
        
        
        
        
        //Edad media de todas las personas registradas
        
        TypedQuery<Persona> query6 =
            em.createQuery("SELECT AVG(person.getEdad())"
                    + " FROM Persona person", Persona.class);
  
           System.out.println("Edad media de personas registradas " + query6.getSingleResult());
        
        
      
        // Close the database connection:
        em.close(); 
        emf.close();   
    
        
        
        
        
        
    }
    
    //utilidades
    public static Date genRandonDate(){
        int randomYear = Practica3BD.randomInterger(1950, 2017);
        int dayOfYear = Practica3BD.randomInterger(1, 365);
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, randomYear);
        calendar.set(Calendar.DAY_OF_YEAR, dayOfYear);
        Date randomDoB = calendar.getTime();
    
        return randomDoB;
    }
    
    public static float randomInRange(float min, float max) {
        
        float range = max - min;
        double scaled = Practica3BD.random.nextDouble() * range;
        double shifted = scaled + min;
        
        return (float)shifted; // == (rand.nextDouble() * (max-min)) + min;
    }
    
    public static Integer randomInterger(int min, int max) {
        
       return (Integer)(min + (int)(Math.random() * ((max - min) + 1)));
       
    }
    
    public static char randomChar()
    {
        char[] estates = new char[] {'A','I','G'};
        char elegido = estates[Practica3BD.randomInterger(0,2)];
        return elegido;
    }
    
    public static boolean randomBool()
    {
        
        Integer elegido = Practica3BD.randomInterger(0,5);
        if(elegido%2 == 0)
        {   
            return true;
        }else{
            return false;
        }
 
    }
    
}



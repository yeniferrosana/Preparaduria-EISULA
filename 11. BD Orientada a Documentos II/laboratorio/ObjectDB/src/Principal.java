import javax.persistence.*;
import java.util.*;
import Modelos.Point;


public class Principal {
	
    public static void main(String[] args) {
    	
        // Open a database connection
        // (create a new database if it doesn't exist yet):
        EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("$objectdb/db/Modelos_points.odb");
        
        EntityManager em = emf.createEntityManager();
        
        
        /*
         * Iniciamos una transaccion, que basicamente 
         * es el incio de un conjunto de operaciones sobre la base de datos
         * que es tratada como una unidad
         * */
        
        // Store 1000 Point objects in the database:
        em.getTransaction().begin();
        for (int i = 0; i < 1000; i++) {
            Modelos.Point p = new Modelos.Point(i, i);
            em.persist(p);
        }
        em.getTransaction().commit();
        
        
        
        // ¿Que hace la siguiente consulta?

        Query q1 = em.createQuery("SELECT COUNT(p) FROM Modelos.Point p");
        System.out.println("Total Points: " + q1.getSingleResult());

        
        // ¿Que hace la siguiente consulta? 
        Query q2 = em.createQuery("SELECT AVG(p.x) FROM Modelos.Point p");
        System.out.println("Average X: " + q2.getSingleResult());

        
        // ¿Que hace la siguiente consulta?
        TypedQuery<Point> query =
            em.createQuery("SELECT p FROM Modelos.Point p", Modelos.Point.class);
        
        List<Modelos.Point> results = query.getResultList();
        
        for (Modelos.Point p : results) {
            System.out.println(p);
        }

        // Close the database connection:
        em.close();
        emf.close();
    }
    
}
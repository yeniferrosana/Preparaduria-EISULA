package Modelos;
import java.io.Serializable;
import javax.persistence.*;

/*
 * Para poder almacenar objectos en la base de datos utilizando JPA (Java Persistance Api)
 * es necesario una clase entidad JPA la cual generalmente es un POJO. (Plain Old Java Object).
 * 
 * Una entidad es una clase que es marcada para tener la habilidad de ser represetanda como un objeto en la base de datos
 * 
 * */

/*La marcamos como entidad*/
@Entity
public class Point implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /*Marcamos el identificador(clave primaria)*/
    @Id @GeneratedValue
    private long id;

    /*Atributos*/
    private int x;
    private int y;

    /*Metodos*/
    public Point() {
    }
   

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public Long getId() {
        return id;
    }

    public int getX() {
         return x;
    }

    public int getY() {
         return y;
    }

    @Override
    public String toString() {
        return String.format("(%d, %d)", this.x, this.y);
    }
}
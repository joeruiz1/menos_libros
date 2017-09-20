/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import dato.Factura;
import dato.Libro;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Juan Manuel
 */
public class Inventario implements Serializable {

    private static final long serialVersionUID = 470485492119446872L;
    private ArrayList<Libro> inventario;
    private ArrayList<Factura> facturas;

    public Inventario() {
        this.inventario = new ArrayList<Libro>();
        this.facturas = new ArrayList<Factura>();
    }

    public Factura readPrestamo(int id) {
        Factura resultado = null;
        Libro li = new Libro();
        for (Factura facturas : this.facturas) {

            li = facturas.getLi();

            if (li.getId() == id) {
                resultado = facturas;
            }
        }
        return resultado;
    }

    public void addActivo(Libro li) {
        this.inventario.add(li);
    }

    public void addPrestamo(Factura fac) {
        this.facturas.add(fac);
    }

    public ArrayList<Libro> getLibros() {
        return inventario;
    }

    public ArrayList<Factura> getPrestamos() {
        return facturas;
    }

}

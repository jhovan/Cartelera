//
//  Carrito.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

class Carrito : CustomStringConvertible {
    
    var dulces : [Dulce: Int]

    init() {
        self.dulces = [:]
    }
    
    public var description: String {
        
        if dulces.count == 0{
            return "Carrito vacío"
        }
        
        var resultado: String = "Objetos en el carrito:\n\n\n"
        
        for (dulce, cantidad) in self.dulces {
            resultado += "\(dulce.nombre)\nPrecio: $ \(dulce.precio) \tCantidad: \(cantidad)\n\n"
        }
        
        resultado += "\nTotal: $ \(self.getTotal())"
        
        return resultado
    }
    
    // Agrega un dulce en una cantidad dada
    func agregar(dulce: Dulce, cantidad: Int) {
        let dulceExists = dulces[dulce] != nil
        if dulceExists {
            dulces[dulce]! += cantidad
        }
        else {
            dulces[dulce] = cantidad
        }
    }
    
    // Obtiene el precio total del carrito
    func getTotal() -> Int{
        var total = 0
        for (dulce, cantidad) in dulces {
            total += dulce.precio * cantidad
        }
        return total
    }
    
    //vacia el carrito
    func vaciar() {
        self.dulces = [:]
    }
}



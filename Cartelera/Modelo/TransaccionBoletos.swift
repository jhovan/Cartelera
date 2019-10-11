//
//  TransaccionBoletos.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct TransaccionBoletos: CustomStringConvertible {
    var funcion: Funcion
    var cantidadAdultos: Int
    var cantidadNinos: Int

    static var id: Int = 0
    
    init(funcion: Funcion, cantidadAdultos: Int, cantidadNinos: Int) {
        self.funcion = funcion
        self.cantidadAdultos = cantidadAdultos
        self.cantidadNinos = cantidadNinos
        TransaccionBoletos.id += 1
    }
    
    
    public var description: String {
        return "Número de transacción: \(TransaccionBoletos.id) \n\nPedido\n\n\nPelicula: \(funcion.getTitulo())\nHora: \(funcion.getHora())\n\nBoletos de adulto: \(cantidadAdultos)\nPrecio: $ \(funcion.getPrecio())\n\nBoletos de niño: \(cantidadNinos)\nPrecio: $ \(funcion.getPrecio()/2)\n\n\nTotal: $ \(self.total())"
    }
    
    public func total() -> Int {
        let precio = funcion.getPrecio()
        return cantidadAdultos * precio + cantidadNinos * precio / 2
    }

}


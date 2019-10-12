//
//  Dulce.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct Dulce: Codable, Hashable, Comparable {
    
    var id: Int
    var nombre: String
    var precio: Int
    
    // Funcion hash para conformar el protocolo hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func getImageName() -> String {
        return "snack_\(id)"
    }
    
    func getFormattedPrecio () -> String {
        return "Precio: $ \(precio)"
    }
    
    static func < (lhs: Dulce, rhs: Dulce) -> Bool {
        return lhs.id < rhs.id
    }
}

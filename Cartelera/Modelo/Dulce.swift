//
//  Dulce.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct Dulce: Codable, Hashable {
    var id: Int
    var nombre: String
    var precio: Int
    
    // Funcion hash para conformar el protocolo hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

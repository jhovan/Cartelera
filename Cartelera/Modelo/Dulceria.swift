//
//  Dulceria.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct Dulceria {
    var dulces : [Dulce]
    var carrito : Carrito
    
    init (dulces: [Dulce]) {
        self.dulces = dulces
        self.carrito =  Carrito()
    }
}

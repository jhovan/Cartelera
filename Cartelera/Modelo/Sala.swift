//
//  Sala.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct Sala: Codable {
    var id: Int
    var tipo: String
    var cupo: Int
    var precio: Int
}

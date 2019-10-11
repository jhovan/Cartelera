//
//  Pelicula.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

struct Pelicula: Codable {
    var id: Int
    var titulo: String
    var clasificacion: String
    var duracion: Int
    var sinopsis: String
    var genero: String
    var valoracion: Double
    
    func getImageName() -> String {
        return "movie_\(id)"
    }
}

//
//  Funcion.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

class Funcion: Codable {
    private var id: Int
    private var pelicula: Pelicula
    private var sala: Sala
    private var hora: String
    private var boletosVendidos: Int
    
    init(id: Int, pelicula: Pelicula, sala: Sala, hora: String, boletosVendidos: Int) {
        self.id = id
        self.pelicula = pelicula
        self.sala = sala
        self.hora = hora
        self.boletosVendidos = boletosVendidos
    }
        
    // Devuelve el numero de boletos disponibles
    func boletosDisponibles() -> Int {
        return self.sala.cupo - self.boletosVendidos
    }
    
    // Incrementa los boletos vendidos en caso de que haya suficientes
    // lanza una excepcion en caso contrario
    func venderBoletos(cantidad: Int) throws {
        let disponibles = self.boletosDisponibles()
        if disponibles >= cantidad {
            self.boletosVendidos += cantidad
        }
        else {
            throw venderBoletosError.boletosInsuficientes(disponibles: disponibles)
        }
    }
}

enum venderBoletosError: Error {
    case boletosInsuficientes(disponibles: Int)
}

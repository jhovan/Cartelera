//
//  Funcion.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import Foundation

class Funcion: Codable, Comparable {
    
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
        
    
    static func < (lhs: Funcion, rhs: Funcion) -> Bool {
        return (lhs.hora < rhs.hora) && (lhs.id < rhs.id)
    }
    
    static func == (lhs: Funcion, rhs: Funcion) -> Bool {
        return lhs.id == rhs.id
    }
    
    // Devuelve el numero de boletos disponibles
    func getBoletosDisponibles() -> Int {
        return self.sala.cupo - self.boletosVendidos
    }
    
    // Incrementa los boletos vendidos en caso de que haya suficientes
    // lanza una excepcion en caso contrario
    func venderBoletos(cantidad: Int) throws {
        let disponibles = self.getBoletosDisponibles()
        if disponibles >= cantidad {
            self.boletosVendidos += cantidad
        }
        else {
            throw venderBoletosError.boletosInsuficientes(disponibles: disponibles)
        }
    }
    
    func getImageName() -> String {
        return pelicula.getImageName()
    }
    
    func getTitulo() -> String {
        return pelicula.titulo
    }
    
    func getDescripcionCelda () -> String {
        return "Hora: \(hora)\nDuración \(pelicula.duracion) min.\nTipo de sala: \(sala.tipo)\nPrecio:$\(sala.precio)/$\(sala.precio/2)\nBoletos disponibles: \(getBoletosDisponibles())/\(sala.cupo)"
    }
    
    func getDetalles() -> String {
        return "Valoración: \(Int(pelicula.valoracion * 100))%\nGénero: \(pelicula.genero)\tClasificación: \(pelicula.clasificacion)\n\n\(pelicula.sinopsis)"
    }
    
    func getPrecio() -> Int {
        return self.sala.precio
    }
    
    func getSala() -> String {
        return "\(self.sala.id), \(self.sala.tipo)"
    }
    
    func getHora() -> String {
        return self.hora
    }
}

enum venderBoletosError: Error {
    case boletosInsuficientes(disponibles: Int)
}

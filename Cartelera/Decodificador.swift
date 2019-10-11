//
//  Decodificador.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class Decodificador {
    
    static func getCartelera() -> Cartelera {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Diccionario de peliculas
        var dictPeliculas: [Int: Pelicula] = [:]
        // Diccionario de salas
        var dictSalas: [Int: Sala] = [:]
        // Lista de funciones
        var listaFunciones: [Funcion] = []
        
        // Leemos el json desde el archivo
        let asset = NSDataAsset(name: "data", bundle: Bundle.main)
        let json = try? JSONSerialization.jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        // Leemos el json por partes
        if let json = json as? [String: NSDictionary]{
            //Creamos el diccionario de peliculas
            if let peliculas = json["peliculas"] as? [String: NSDictionary] {
                for (_, nsdictPelicula) in peliculas {
                    let data = try? nsdictPelicula.toString()?.data(using: .utf8)!
                    let pelicula = try! JSONDecoder().decode(Pelicula.self, from: data!)
                    dictPeliculas[pelicula.id] = pelicula
                }
            }
            else {
                print("No hay peliculas")
            }
            //Creamos el diccionario de salas
            if let salas = json["salas"] as? [String: NSDictionary] {
                for (_, nsdictSala) in salas {
                    let data = try? nsdictSala.toString()?.data(using: .utf8)!
                    let sala = try! JSONDecoder().decode(Sala.self, from: data!)
                    dictSalas[sala.id] = sala
                }
            }
            else {
                print("No hay salas")
            }
            //Llenamos la lista de funciones
            if let funciones = json["funciones"] as? [String: NSDictionary] {
                for (_, nsdictFuncion) in funciones {
                    let funcion = Funcion(json:nsdictFuncion as! [String : Any],dictPeliculas: dictPeliculas, dictSalas: dictSalas)
                    listaFunciones.append(funcion!)
                }
            }
            else {
                print("No hay funciones")
            }
        } else {
            print("Json nulo")
        }
        
        return Cartelera(funciones: listaFunciones)
    }
    
    static func getDulceria() -> Dulceria {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        

        var listaDulces: [Dulce] = []
        
        // Leemos el json desde el archivo
        let asset = NSDataAsset(name: "data", bundle: Bundle.main)
        let json = try? JSONSerialization.jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        // Leemos el json por partes
        if let json = json as? [String: NSDictionary]{
            //Llenamos la lista de dulces
            if let dulces = json["dulces"] as? [String: NSDictionary] {
                    for (_, nsdictDulce) in dulces {
                        let data = try? nsdictDulce.toString()?.data(using: .utf8)!
                        let dulce = try! JSONDecoder().decode(Dulce.self, from: data!)
                        listaDulces.append(dulce)
                    }
            }
            else {
                print("No hay dulces")
            }
            
        } else {
            print("Json nulo")
        }
        
        return Dulceria(dulces: listaDulces)
    }
    
}

extension NSDictionary{
    func toString() throws -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        }
        catch (let error){
            throw error
        }
    }
}

extension Funcion {
    
    // Nuevo constructor que soporta json
    convenience init?(json: [String: Any], dictPeliculas: [Int: Pelicula], dictSalas: [Int: Sala]) {
        guard let peliculaId = json["pelicula"] as? Int,
            let salaId = json["sala"] as?  Int,
            let hora = json["hora"] as? String,
            let boletosVendidos = json["boletos_vendidos"] as? Int,
            let id = json["id"] as? Int
        else {
            return nil
        }

        let pelicula = dictPeliculas[peliculaId]!
        let sala = dictSalas[salaId]!
        
        self.init(id: id, pelicula: pelicula, sala: sala, hora: hora, boletosVendidos: boletosVendidos)

    }
}


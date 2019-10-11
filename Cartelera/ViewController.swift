//
//  ViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 10/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cartelera: Cartelera?
    var dulceria: Dulceria?

    override func viewDidLoad() {
        super.viewDidLoad()
        (cartelera, dulceria) = Decodificador.leerBaseDeDatos()
    }
    
        
}




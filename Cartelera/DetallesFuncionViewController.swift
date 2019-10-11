//
//  DetallesFuncionViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class DetallesFuncionViewController: UIViewController {

    
    public var funcion: Funcion?
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descripcionCelda: UILabel!
    @IBOutlet weak var detalles: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titulo.text = funcion?.getTitulo()
        descripcionCelda.text = funcion?.getDescripcionCelda()
        imagen.image = UIImage(named: (funcion?.getImageName())!)
        detalles.text = funcion?.getDetalles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "boletosSegue" {
            let viewController: BoletosViewController = segue.destination as! BoletosViewController
            viewController.funcion = self.funcion
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

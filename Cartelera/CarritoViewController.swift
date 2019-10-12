//
//  CarritoViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class CarritoViewController: UIViewController {

    public var carrito:Carrito?
    
    @IBOutlet weak var texto: UILabel!
    
    
    @IBOutlet weak var botonVaciar: UIButton!
    
    @IBAction func vaciar(_ sender: Any) {
        carrito?.vaciar()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var botonPagar: UIButton!


    @IBAction func comprer(_ sender: Any) {
        carrito?.vaciar()
        
        let alert = UIAlertController(title: "", message: "Gracias por tu compra, puedes recoger tus dulces una vez en la función", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        texto.text = carrito?.description
        if carrito?.getTotal() == 0 {
            botonPagar.isEnabled = false
            botonVaciar.isEnabled = false
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

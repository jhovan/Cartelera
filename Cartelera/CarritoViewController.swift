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
    
    @IBAction func vaciar(_ sender: Any) {
        carrito?.vaciar()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func comprer(_ sender: Any) {
        carrito?.vaciar()
        self.dismiss(animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        texto.text = carrito?.description
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

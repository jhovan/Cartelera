//
//  BoletosTicketViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class BoletosTicketViewController: UIViewController {

    public var transaccion: TransaccionBoletos?
    @IBOutlet weak var descripcion: UILabel!
    
    @IBAction func cerrar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descripcion.text = transaccion?.description
        
        // Do any additional setup after loading the view.
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

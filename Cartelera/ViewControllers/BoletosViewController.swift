//
//  BoletosViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class BoletosViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public var funcion: Funcion?
    var pickerData: [Int] = []
    
    @IBOutlet weak var adultos: UIPickerView!
    @IBOutlet weak var ninos: UIPickerView!
    
    
    
    @IBAction func confirmar(_ sender: Any) {
        let disponibles = funcion?.getBoletosDisponibles()
        let requeridos = adultos.selectedRow(inComponent: 0)   + ninos.selectedRow(inComponent: 0)
        
        if requeridos == 0 {
            let alert = UIAlertController(title: "Ups", message: "Debes comprar al menos un boleto", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if requeridos <= disponibles! {
            try! funcion?.venderBoletos(cantidad: requeridos)
            performSegue(withIdentifier: "conditionSegue", sender: nil)
        }
        else {
            let alert = UIAlertController(title: "Ups", message: "No hay suficientes boletos disponibles para completar tu compra", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "conditionSegue" {
            let viewController: BoletosTicketViewController = segue.destination as! BoletosTicketViewController
            viewController.transaccion = TransaccionBoletos(funcion: self.funcion!, cantidadAdultos: adultos.selectedRow(inComponent: 0), cantidadNinos: ninos.selectedRow(inComponent: 0))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.adultos.delegate = self
        self.adultos.dataSource = self
        
        self.ninos.delegate = self
        self.ninos.dataSource = self

        pickerData = Array(0...100)
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
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

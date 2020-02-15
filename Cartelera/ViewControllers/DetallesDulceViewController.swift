//
//  DetallesDulceViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class DetallesDulceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    public var carrito:Carrito?
    public var dulce:Dulce?
    var pickerData: [Int] = []

    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var cantidad: UIPickerView!
    
    
    
    @IBAction func AgregarAlCarrito(_ sender: Any) {
        let cantidadDulces = cantidad.selectedRow(inComponent: 0) + 1
        carrito?.agregar(dulce: dulce!, cantidad: cantidadDulces)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.cantidad.delegate = self
        self.cantidad.dataSource = self
        
        pickerData = Array(1...100)
        
        nombre.text = dulce?.nombre
        precio.text = "$ \(dulce!.precio)"
        imagen.image = UIImage(named: (dulce!.getImageName()))
        
        
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

//
//  BoletosViewController.swift
//  Cartelera
//
//  Created by Jhovan Gallardo on 11/10/19.
//  Copyright © 2019 UNAM. All rights reserved.
//

import UIKit

class BoletosViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var adultos: UIPickerView!
    @IBOutlet weak var ninos: UIPickerView!
    
    
    @IBAction func confirmar(_ sender: Any) {
    }
    
    
    var pickerData: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.adultos.delegate = self
        self.adultos.dataSource = self
        
        self.ninos.delegate = self
        self.ninos.dataSource = self

        
        pickerData = [0,1,2,3,4,5,6,7,8,9,10]
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

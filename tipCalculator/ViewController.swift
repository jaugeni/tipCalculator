//
//  ViewController.swift
//  tipCalculator
//
//  Created by YAUHENI IVANIUK on 2/16/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var costLbl: UITextField!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var sliderOut: UISlider!
    @IBOutlet weak var totalLbl: UILabel!
    
    var totalCost = Double()
    var tipAmount = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        costLbl.delegate = self
        amountLbl.text = String(format: "%0.0f", sliderOut.value) + "%"
        tipAmount = Double(sliderOut.value)
    }
    
    func calcTotalCost(cost: Double) {
        let tip = (tipAmount / 100) * cost
        totalCost = tip + Double(costLbl.text!)!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        costLbl.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    @IBAction func sliderAct(_ sender: Any) {
        tipAmount = Double(sliderOut.value)
        let tipString = String(format: "%0.0f", tipAmount)
        tipAmount = Double(tipString)!
        amountLbl.text = "\(tipString)%"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        if costLbl.text != "" {
            calcTotalCost(cost: Double(costLbl.text!)!)
            totalLbl.text = String(format: "%0.2f", totalCost) + "$"
        } else {
            totalLbl.text = "\(0)"
        }
    }
}


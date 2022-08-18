//
//  ViewController.swift
//  Conversor
//
//  Created by Jarede Lima on 28/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelUnit: UILabel!
    @IBOutlet weak var textFieldValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch labelUnit.text!{
        case "Temperatura":
            labelUnit.text = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            labelUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
        case "Moeda":
            labelUnit.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
        default:
            labelUnit.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
            
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch labelUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(labelResult.text!)!
        labelResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(textFieldValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Farenheint"
            labelResult.text = String(temperature * 1.8 + 32.0)
        } else {
            labelResultUnit.text = "Celsius"
            labelResult.text = String ((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(textFieldValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Libra"
            labelResult.text = String(weight / 2.2046)
        } else {
            labelResultUnit.text = "Kilograma"
            labelResult.text = String(weight * 2.2046 )
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(textFieldValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Dólar"
            labelResult.text = String(currency / 3.5)
        } else {
            labelResultUnit.text = "Real"
            labelResult.text = String (currency * 3.5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(textFieldValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            labelResultUnit.text = "Kilômetro"
            labelResult.text = String(distance / 1000.0)
        } else {
            labelResultUnit.text = "Metros"
            labelResult.text = String (distance * 1000.0)
        }
    }
}

//
//  StockhouseVC.swift
//  ZooGame
//
//  Created by Мария Изюменко on 20.11.2021.
//

import UIKit

class StockhouseVC: UIViewController {
    
    var foodType = ""
    var foodCount = ""
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var meatPressed: UIButton!
    @IBOutlet weak var fruitPressed: UIButton!
    @IBOutlet weak var hayPressed: UIButton!
    @IBOutlet weak var grassPressed: UIButton!
    @IBOutlet weak var rainbowPressed: UIButton!
    @IBOutlet weak var fishPressed: UIButton!
    @IBOutlet weak var bambooPressed: UIButton!
    @IBOutlet weak var seedPressed: UIButton!
    @IBOutlet weak var unusedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meatPressed.tag = 0
        fruitPressed.tag = 1
        hayPressed.tag = 2
        grassPressed.tag = 3
        rainbowPressed.tag = 4
        fishPressed.tag = 5
        bambooPressed.tag = 6
        seedPressed.tag = 7
    }
    
    func isHiddenFalse() {
        infoLabel.isHidden = false
        quantityLabel.isHidden = false
        stepper.isHidden = false
        sendButton.isHidden = false
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        self.quantityLabel.text = Int(sender.value).description
    }
    
    @IBAction func feedButtonPressed(_ sender: UIButton) {
        isHiddenFalse()
    }
    
    @IBAction func sendFood(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            foodType = "Meat"
            foodCount = quantityLabel.text!
        case 1:
            foodType = "Fruit"
            foodCount = quantityLabel.text!
        case 2:
            foodType = "Hay"
            foodCount = quantityLabel.text!
        case 3:
            foodType = "Grass"
            foodCount = quantityLabel.text!
        case 4:
            foodType = "Rainbow"
            foodCount = quantityLabel.text!
        case 5:
            foodType = "Fish"
            foodCount = quantityLabel.text!
        case 6:
            foodType = "Bamboo"
            foodCount = quantityLabel.text!
        case 7:
            foodType = "Seed"
            foodCount = quantityLabel.text!
        default:
            print("switch")
        }
    }
    
}

//
//  ViewController.swift
//  ZooGame
//
//  Created by Мария Изюменко on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalsCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showAlert() {
    let alert = UIAlertController(title: "Ошибка", message: "Заполните поле с количеством клеток", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(defaultAction)
    self.present(alert, animated: true)
}
    
    @IBAction func continueButton(_ sender: Any) {
        if animalsCountTextField.text?.isEmpty != true  {
            performSegue(withIdentifier: "continueSegue", sender: AnyObject.self)
            
        } else {
            showAlert()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


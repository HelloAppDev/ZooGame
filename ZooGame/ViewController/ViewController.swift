import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalsCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true)
    }
//    Переход на следующий вьюконтроллер при не пустом textField
    @IBAction func continueButton(_ sender: Any) {
        if animalsCountTextField.text?.isEmpty != true  {
            performSegue(withIdentifier: "continueSegue", sender: AnyObject.self)
        } else {
            showAlert(message: "Заполните поле с количеством клеток")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continueSegue",
           let zooTableVC = segue.destination as? ZooTableViewController {
            zooTableVC.maximumCage = Int(animalsCountTextField.text ?? "10") ?? 10
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


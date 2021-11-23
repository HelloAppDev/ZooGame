import UIKit

class StockhouseVC: UIViewController {
    
    var foodType: FoodType = .unknown
    var foodCount: Int = 0
    
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
    }
    
    func isHiddenFalse() {
        infoLabel.isHidden = false
        quantityLabel.isHidden = false
        stepper.isHidden = false
        sendButton.isHidden = false
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        self.quantityLabel.text = Int(sender.value).description
        foodCount = Int(quantityLabel.text ?? "0") ?? 0
    }
    
    @IBAction func feedButtonPressed(_ sender: UIButton) {
        isHiddenFalse()
        switch sender.tag {
        case 0:
            foodType = .meat
        case 1:
            foodType = .fruit
        case 2:
            foodType = .hay
        case 3:
            foodType = .grass
        case 4:
            foodType = .rainbow
        case 5:
            foodType = .fish
        case 6:
            foodType = .bamboo
        case 7:
            foodType = .seed
        default:
            foodType = .unknown
        }
    }
    
}

import UIKit

class TableViewCell: UITableViewCell {
    
    // Отдельный класс для ячеек
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var eatLabel: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
}

class ZooTableViewController: UITableViewController {
    
    var feedIdentifier: Int?
    var maximumCage: Int?
    var zooDataList: [AnimalData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return zooDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let index = indexPath.row
        let cage = zooDataList[index]
        
        cell.typeLabel?.text = cage.type
        cell.countLabel?.text = "Quantity: \(cage.count)"
        cell.foodLabel?.text = "Food: \(cage.foodType)"
        cell.eatLabel?.text = "Eat: \(cage.foodCount)"
        if let badFoodType = cage.badFoodType,
           let badFoodCount = cage.badFoodCount {
            cell.extraLabel?.text = "\(badFoodType): \(badFoodCount)"
            cell.extraLabel.isHidden = false
        } else {
            cell.extraLabel.isHidden = true
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedIdentifier = indexPath.row
    }
    
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "ZooDataAPI", withExtension: "json") else { return }
        do {
            let data = try Data (contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([AnimalData].self, from: data)
            print(receivedData)
            let maximumCage = receivedData.count < maximumCage ?? 0 ? receivedData.count : maximumCage ?? 0
            self.zooDataList = Array(receivedData[0..<(maximumCage)])
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch(let error) {
            print(error)
        }
    }
    
    @IBAction func unwindToTableVC(segue: UIStoryboardSegue) {
        guard let svc = segue.source as? StockhouseVC,
              let feedIdentifier = feedIdentifier else { return }
        let foodType = svc.foodType
        let foodCount = svc.foodCount
        zooDataList[feedIdentifier].addFood(foodType: foodType, foodCount: foodCount)
        self.tableView.reloadData()
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        for index in 0..<zooDataList.count {
            zooDataList[index].eatFood()
        }
        zooDataList = zooDataList.filter{ $0.count>0 }
        self.tableView.reloadData()
    }
    
    
}

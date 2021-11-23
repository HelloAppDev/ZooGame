//
//  TableViewController.swift
//  ZooGame
//
//  Created by Мария Изюменко on 18.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Отдельный класс для ячеек
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var eatLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
    
}

class ZooTableViewController: UITableViewController {
    
    var feedIdentifier = ""
    var zooDataList: [AnimalData] = []
    var foodKind = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
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
        cell.typeLabel?.text = zooDataList[indexPath.row].type
        cell.countLabel?.text = "Quantity: \(zooDataList[indexPath.row].count)"
        cell.foodLabel?.text = "Food: \(zooDataList[indexPath.row].food)"
        cell.eatLabel?.text = "Eat: \(zooDataList[indexPath.row].eat)"
        cell.extraLabel?.text = "\(foodKind): \(feedIdentifier)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    
    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "ZooDataAPI", withExtension: "json") else { return }
    
        do {
              let data = try Data (contentsOf: fileLocation)
              let receivedData = try JSONDecoder().decode([AnimalData].self, from: data)
              print(receivedData)
              self.zooDataList = receivedData
              DispatchQueue.main.async {
              self.tableView.reloadData()
                  }
      } catch {
          print("Error")
      }
    }
    
    @IBAction func unwindToTableVC(segue: UIStoryboardSegue) {
        guard let svc = segue.source as? StockhouseVC else { return }
        self.feedIdentifier = svc.quantityLabel.text!
        self.foodKind = svc.foodType
    
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.tableView.reloadData()
    }
    
    
}

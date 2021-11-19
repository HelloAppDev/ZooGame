//
//  TableViewController.swift
//  ZooGame
//
//  Created by Мария Изюменко on 18.11.2021.
//

import UIKit

class MyTableViewController: UITableViewController {

    
    var ZooDataList: [ZooData] = [ZooData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ZooDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = ZooDataList[indexPath.row].type
        cell?.textLabel?.text = ZooDataList[indexPath.row].count
        cell?.textLabel?.text = ZooDataList[indexPath.row].eat
        cell?.textLabel?.text = ZooDataList[indexPath.row].food
        cell?.textLabel?.text = ZooDataList[indexPath.row].age
        return cell!
    }

    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "ZooDataList", withExtension: "json") else { return }
    
    do {
    let data = try Data (contentsOf: fileLocation)
        let receivedData = try JSONDecoder().decode([ZooData].self, from: data)
        self.ZooDataList = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    } catch {
        print("Error")
    
    }

    }
}

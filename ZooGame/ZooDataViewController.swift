//
//  ZooViewControlle.swift
//  ZooGame
//
//  Created by Мария Изюменко on 17.11.2021.
//

import UIKit

enum ZooJSONKeys: String, CodingKey {
    case type, count, eat, food, age
}

struct ZooData: Decodable {
    let type, count, eat, food, age: String
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: ZooJSONKeys.self)
        
        self.type = try rootContainer.decode(String.self, forKey: .type)
        self.count = try rootContainer.decode(String.self, forKey: .count)
        self.eat = try rootContainer.decode(String.self, forKey: .eat)
        self.food = try rootContainer.decode(String.self, forKey: .food)
        self.age = try rootContainer.decode(String.self, forKey: .age)
    }
    
}

class ZooDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let json = """
            [
              {
                  "type": "lion",
                  "count": "5",
                  "eat": "meat",
                  "food": "23",
                  "age": "3"
                
            },
            {
              
                  "type": "monkey",
                  "count": "9",
                  "eat": "fruit",
                  "food": "32",
                  "age": "2"
                
            },
            {
              
                  "type": "elephant",
                  "count": "3",
                  "eat": "grass",
                  "food": "19",
                  "age": "12"
                
            },
            {
              
                  "type": "parrot",
                  "count": "14",
                  "eat": "seed",
                  "food": "32",
                  "age": "1"
                
            },
            {
              
                  "type": "pandas",
                  "count": "6",
                  "eat": "bamboo",
                  "food": "26",
                  "age": "4"
                
            },
            {
              
                  "type": "wolves",
                  "count": "3",
                  "eat": "meat",
                  "food": "21",
                  "age": "6"
                
            },
            {
              
                  "type": "zebras",
                  "count": "4",
                  "eat": "hay",
                  "food": "26",
                  "age": "7"
                
            },
            {
              
                  "type": "unicorn",
                  "count": "2",
                  "eat": "rainbow",
                  "food": "25",
                  "age": "18"
                
            },
            {
              
                  "type": "hippo",
                  "count": "4",
                  "eat": "fruits",
                  "food": "22",
                  "age": "10"
                
            },
            {
              
                  "type": "shark",
                  "count": "7",
                  "eat": "fish",
                  "food": "44",
                  "age": "13"
                
            },
            {
              
                  "type": "bear",
                  "count": "3",
                  "eat": "fish",
                  "food": "44",
                  "age": "8"
                }
            ]
            """
            
        guard let data = json.data(using: .utf8) else { return }
       
        
        do {
            let zooDataApi = try JSONDecoder().decode(ZooData.self, from: data)
            print (zooDataApi)
        } catch let error {
            print(error)
        }
    }

}


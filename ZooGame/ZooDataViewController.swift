//
//  ZooViewControlle.swift
//  ZooGame
//
//  Created by Мария Изюменко on 17.11.2021.
//

import UIKit

struct AnimalData: Codable {
    let type: String
    let count: Int
    let eat: String
    let food: Int
      }

class ZooData {
    
    func parseJSON() {
    
        let json = """
            [
                          {
                          "type": "lion",
                          "count": 5,
                          "eat": "meat",
                          "food": 23
                        
                    },
                    {
                      
                          "type": "monkey",
                          "count": 9,
                          "eat": "fruit",
                          "food": 32
                        
                    },
                    {
                      
                          "type": "elephant",
                          "count": 3,
                          "eat": "grass",
                          "food": 19
                        
                    },
                    {
                      
                          "type": "parrot",
                          "count": 14,
                          "eat": "seed",
                          "food": 32
                        
                    },
                    {
                      
                          "type": "pandas",
                          "count": 6,
                          "eat": "bamboo",
                          "food": 26
                        
                    },
                    {
                      
                          "type": "wolves",
                          "count": 3,
                          "eat": "meat",
                          "food": 21
                        
                    },
                    {
                      
                          "type": "zebras",
                          "count": 4,
                          "eat": "hay",
                          "food": 26
                        
                    },
                    {
                      
                          "type": "unicorn",
                          "count": 2,
                          "eat": "rainbow",
                          "food": 25
                        
                    },
                    {
                      
                          "type": "hippo",
                          "count": 4,
                          "eat": "fruit",
                          "food": 22
                        
                    },
                    {
                      
                          "type": "shark",
                          "count": 7,
                          "eat": "fish",
                          "food": 44
                        
                    },
                    {
                      
                          "type": "bear",
                          "count": 3,
                          "eat": "fish",
                          "food": 44
                        }
            ]
            """
            
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let zooDataApi = try JSONDecoder().decode([AnimalData].self, from: data)
            print (zooDataApi)
        } catch let error {
            print(error)
        }
    }

}

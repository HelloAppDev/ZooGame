import UIKit

// Модель данных JSON
struct AnimalData: Codable {
    let type: String
    var count: Int
    let minimumFoodCount: Int
    let foodType: FoodType
    private(set) var foodCount: Int
    private(set) var badFoodType: FoodType?
    private(set) var badFoodCount: Int?
}

// Расширение для получения данных из склада
extension AnimalData {
    mutating func addFood(foodType: FoodType, foodCount: Int) {
        if self.foodType == foodType {
            self.foodCount += foodCount
        } else {
            self.badFoodType = foodType
            self.badFoodCount = foodCount
        }
    }
    
// Функция вероятности появления приплода 30%
    mutating func eatFood() {
        foodCount = foodCount - (count * minimumFoodCount)
        if foodCount > 0 {
            let chance = Int.random(in: 0...100)
            if chance < 30 {
                count += 1
            }
        } else {
//   Уменьшение количества животных в клетке из-за недостатка корма
            count = count - (-foodCount/minimumFoodCount)
            foodCount =  0
        }
        badFoodType = nil
        badFoodCount = nil
    }
    
}

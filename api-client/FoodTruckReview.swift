//
//  FoodTruckReview.swift
//  api-client
//
//  Created by Kathy Higgins on 2/14/17.
//  Copyright © 2017 ColoApps. All rights reserved.
//

import Foundation

struct FoodTruckReview {
    var id: String = ""
    var title: String = ""
    var text: String = ""
    
    static func ParReviewJSONData(data: Data) -> [FoodTruckReview] {
        var foodTruckReviews = [FoodTruckReview]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            // Parse JSON data
            if let reviews = jsonResult as? [Dictionary<String, AnyObject>] {
                for review in reviews {
                    var newReview = FoodTruckReview()
                    newReview.id = review["_id"] as! String
                    newReview.title = review["title"] as! String
                    newReview.text = review["text"] as! String
                    
                    foodTruckReviews.append(newReview)
                }
            }
            
        } catch let err {
            print(err)
        }
        return foodTruckReviews
            
        }
        
    }


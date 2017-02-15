//
//  DataService.swift
//  api-client
//
//  Created by Kathy Higgins on 2/14/17.
//  Copyright © 2017 ColoApps. All rights reserved.
//

import Foundation

protocol DataServiceDelegate: class  {
    func trucksLoaded()
    func reviewsLoaded()
}

class DataService {
    static let instance = DataService()

    weak var delegate: DataServiceDelegate?
    var foodTrucks = [FoodTruck]()
    var reviews = [FoodTruckReview]()
    
    // GET all food trucks
    func getAllFoodTrucks(){
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set a URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        // Create the request
        //Get all foodtrucks (GET /api/v1/foodtruck)
        guard let URL = URL(string: GET_ALL_FT_URL) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) ->Void in
        // let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?)-> Void  in
            if (error == nil) {
            // Success
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
                if let data = data {
                    self.foodTrucks = FoodTruck.parseFoodTruckJSONData(data: data)
                    self.delegate?.trucksLoaded()
                }
            
            }
            else {
                // Failure
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // GET all reviews for a specific food truck
    
}

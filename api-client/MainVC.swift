//
//  MainVC.swift
//  api-client
//
//  Created by Kathy Higgins on 2/14/17.
//  Copyright © 2017 ColoApps. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.delegate = self

        DataService.instance.getAllFoodTrucks()
    }

}

extension MainVC: DataServiceDelegate {
    func trucksLoaded() {
        print(DataService.instance.foodTrucks)
    }
    
    func reviewsLoaded() {
        
    }
}


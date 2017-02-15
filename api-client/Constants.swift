
//
//  Constants.swift
//  api-client
//
//  Created by Kathy Higgins on 2/14/17.
//  Copyright © 2017 ColoApps. All rights reserved.
//

import Foundation

// Callbacks
// Typealias for callbacks sed in Data Service

typealias callback = (_ success: Bool) -> ()

// Base URL
let BASE_API_URL = "http://localhost:3005/api/v1"

//let BASE_API_URL = "http://localhost:3005/v1"

//GET all food trucks
let GET_ALL_FT_URL = "\(BASE_API_URL)/foodtruck"

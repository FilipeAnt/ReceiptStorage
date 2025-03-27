//
//  Receipt.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import Foundation
import CoreData

struct Receipt {
    var image: Data // Image in Data format
    var date: Date
    var amount: Double
    var currency: String
}

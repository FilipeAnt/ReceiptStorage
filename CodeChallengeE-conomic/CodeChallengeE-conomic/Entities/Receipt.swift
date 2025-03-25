//
//  Receipt.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import Foundation
import CoreData

class Receipt: NSManagedObject {
    @NSManaged var imageData: Data?
    @NSManaged var date: Date?
    @NSManaged var totalAmount: Double
    @NSManaged var currency: String?
}

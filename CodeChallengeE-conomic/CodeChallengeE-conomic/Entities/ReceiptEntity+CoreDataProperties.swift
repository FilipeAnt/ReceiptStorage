//
//  ReceiptEntity+CoreDataProperties.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//
//

import Foundation
import CoreData


extension ReceiptEntity1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReceiptEntity> {
        return NSFetchRequest<ReceiptEntity>(entityName: "ReceiptEntity")
    }

    @NSManaged public var imageData: Data?
    @NSManaged public var date: Date?
    @NSManaged public var amount: Double
    @NSManaged public var currency: String?

}

extension ReceiptEntity1 : Identifiable {

}

//
//  RecipeEntityData+CoreDataProperties.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//
//

import Foundation
import CoreData


extension RecipeEntityData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeEntityData> {
        return NSFetchRequest<RecipeEntityData>(entityName: "RecipeEntityData")
    }

    @NSManaged public var imageData: Data?
    @NSManaged public var amount: Double
    @NSManaged public var currency: String?
    @NSManaged public var date: Date?

}

extension RecipeEntityData : Identifiable {

}

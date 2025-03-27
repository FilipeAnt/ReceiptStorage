//
//  ViewAllReceiptsViewModel.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//

import Foundation
import UIKit
import CoreData

class ViewAllReceiptsViewModel {
    
    func fetchReceipts() -> [RecipeEntityData] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<RecipeEntityData> = RecipeEntityData.fetchRequest()
        
        do {
            let receipts = try context.fetch(fetchRequest)
            return receipts
        } catch {
            print("Error fetching receipts: \(error)")
            return []
        }
    }
    
}

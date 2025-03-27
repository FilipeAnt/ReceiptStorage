//
//  LoadReceiptViewModel.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//


import Foundation
import UIKit
import CoreData

class LoadReceiptViewModel {
    
    var context: NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func saveReceipt(receipt: Receipt) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        
        context.perform {
            let newReceipt = NSEntityDescription.insertNewObject(forEntityName: "RecipeEntityData", into: context) as! RecipeEntityData
            newReceipt.imageData = receipt.image
            newReceipt.date = receipt.date
            newReceipt.amount = receipt.amount
            newReceipt.currency = receipt.currency
            do {
                try context.save()
            } catch {
                print("Failed to save receipt in background: \(error)")
            }
        }
    }
    
    
}

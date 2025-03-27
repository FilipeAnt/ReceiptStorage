//
//  ViewAllReceiptsViewController.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 25/03/2025.
//

import Foundation
import UIKit
import CoreData

class ViewAllReceiptsViewController: UIViewController {
    
    @IBOutlet weak var receiptsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   /* func fetchReceipts() -> [Receipt] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Receipt> = Receipt.fetchRequest() as! NSFetchRequest<Receipt>

        do {
            let receipts = try context.fetch(fetchRequest)
            return receipts
        } catch {
            print("Error fetching receipts: \(error)")
            return []
        }
    } */
}

//
//  ViewAllReceiptsViewController.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//

import Foundation
import UIKit
import CoreData

class ViewAllReceiptsViewController: UIViewController {
    
    @IBOutlet weak var receiptsTableView: UITableView!
    
    var receipts: [RecipeEntityData]?
    var viewAllReceiptsViewModel: ViewAllReceiptsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAllReceiptsViewModel = ViewAllReceiptsViewModel()
        receipts = viewAllReceiptsViewModel?.fetchReceipts()
        setupTableView()
        receiptsTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        receiptsTableView.dataSource = self
        receiptsTableView.delegate = self
        //tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0);
        receiptsTableView.register(UINib(nibName: "ReceiptCell", bundle: nil), forCellReuseIdentifier: "ReceiptTableViewCell")
    }
}

extension ViewAllReceiptsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return receipts?.count ?? 0
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell", for: indexPath) as? ReceiptTableViewCell else { return UITableViewCell() }
        guard let receipt = receipts?[indexPath.row] else { return UITableViewCell() }
            // Configure cell with receipt data
        cell.amountValueLabel?.text = "  \(receipt.amount) \(receipt.currency ?? "")"
        cell.dateValueLabel.text = "  \(receipt.date?.formatted(date: .abbreviated, time: .omitted) ?? "")"
        cell.receiptImageView.image = UIImage(data: receipt.imageData!)
        return cell
    }
}

//
//  ReceiptCell.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//

import Foundation
import UIKit

class ReceiptTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var amountTitleLabel: UILabel!
    @IBOutlet weak var amountValueLabel: UILabel!
    @IBOutlet weak var receiptImageView: UIImageView!
    
    let cornerRadius: CGFloat = 20.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupValues(date: Date, amount: Double) {
        
    }
    
    func setupUI() {
    }
    
}

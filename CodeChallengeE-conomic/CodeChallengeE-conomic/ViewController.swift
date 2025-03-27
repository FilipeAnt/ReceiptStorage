//
//  ViewController.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var receiptLoadBtn: UIButton!
    @IBOutlet weak var receiptIconImg: UIImageView!
    @IBOutlet weak var viewUploadedReceiptsBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func receiptLoadPressed(_ sender: Any) {
        Router.shared.route(to: .addNewReceipt, navigation: self.navigationController ?? UINavigationController())
    }
    
    
    @IBAction func ViewUploadedReceiptsBtnPressed(_ sender: Any) {
        Router.shared.route(to: .viewAllReceipts, navigation: self.navigationController ?? UINavigationController())
    }
    
}


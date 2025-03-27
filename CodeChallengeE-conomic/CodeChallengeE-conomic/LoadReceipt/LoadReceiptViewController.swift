//
//  LoadReceiptViewController.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import Foundation
import UIKit
import CoreData

class LoadReceiptViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var addReceiptImgView: UIImageView!
    @IBOutlet weak var addReceiptImgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTextfield: UITextField!
    @IBOutlet weak var selectCurrencyLabel: UILabel!
    @IBOutlet weak var selectCurrencyTextfield: UITextField!
    @IBOutlet weak var addReceiptButton: UIButton!
    
    var context: NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var receipt: Receipt?

    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        setupAddReceiptImg()
        // Do any additional setup after loading the view.
    }
    
    private func setupAddReceiptImg() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(addImgTapped))
        addReceiptImgView.isUserInteractionEnabled = true
        addReceiptImgView.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func addImgTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addReceiptBtnPressed(_ sender: Any) {
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addReceiptImgView.image = image
                 // Save image as Data
                 let imageData = image.jpegData(compressionQuality: 0.8)
                 // Create the receipt object
                 let newReceipt = Receipt(image: imageData!, date: Date(), amount: 100.0, currency: "USD") // Amount and currency are placeholders
                 receipt = newReceipt
             }
         picker.dismiss(animated: true, completion: nil)
     }
    
    func saveReceiptToCoreData(receipt: Receipt) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newReceipt = NSEntityDescription.insertNewObject(forEntityName: "ReceiptEntity", into: context) as! ReceiptEntity1
        newReceipt.imageData = receipt.image
        newReceipt.date = receipt.date
        newReceipt.amount = receipt.amount
        newReceipt.currency = receipt.currency
        
        do {
            try context.save()
        } catch {
            print("Failed to save receipt: \(error)")
        }
    }
    
    
}

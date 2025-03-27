//
//  LoadReceiptViewController.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import Foundation
import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
         guard let image = info[.originalImage] as? UIImage else {
             return
         }
         
         saveReceipt(image: image)
         picker.dismiss(animated: true, completion: nil)
     }
    
    func saveReceipt(image: UIImage) {
        var receipt = Receipt(imageData: image.jpegData(compressionQuality: 1.0), date: Date(), totalAmount: 100.0, currency: "USD")
      }
    
    
}

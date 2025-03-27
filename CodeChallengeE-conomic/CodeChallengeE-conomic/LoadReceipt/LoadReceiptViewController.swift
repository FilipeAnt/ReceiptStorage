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
    @IBOutlet weak var selectCurrencyPickerView: UIPickerView!
    @IBOutlet weak var addReceiptButton: UIButton!
    
  
    var imageData: Data?
    var loadReceiptViewModel: LoadReceiptViewModel?
    let currencies = ["USD","EUR","GB","INR","JPY","AUD","CAD","CHF","CNY"] // We can add more currencies to the picker
    var selectedCurrency: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        loadReceiptViewModel = LoadReceiptViewModel()
        setupAddReceiptImg()
        setupCurrencyPicker()
        // Do any additional setup after loading the view.
    }
    
    private func setupAddReceiptImg() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(addImgTapped))
        addReceiptImgView.isUserInteractionEnabled = true
        addReceiptImgView.addGestureRecognizer(tap)
    }
    
    private func setupCurrencyPicker(){
        selectCurrencyPickerView.delegate = self
        selectCurrencyPickerView.dataSource = self
    }
    
    @objc fileprivate func addImgTapped(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addReceiptBtnPressed(_ sender: Any) {
        if let imageData = imageData, let amount = Double(totalAmountTextfield.text ?? ""), let currency = selectedCurrency {
            let newReceipt = Receipt(image: imageData, date: datePicker.date, amount: amount, currency: currency)
            loadReceiptViewModel?.saveReceipt(receipt: newReceipt)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addReceiptImgView.image = image
            imageData = image.jpegData(compressionQuality: 0.8)
             }
         picker.dismiss(animated: true, completion: nil)
     }
}

extension LoadReceiptViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       // Number of rows in the picker (based on number of currencies)
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return currencies.count
       }
       
       // MARK: - UIPickerViewDelegate
       
       // What to display for each row
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return currencies[row]
       }
       
       // Handle when a row is selected
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           let selectedCurrency = currencies[row]
           self.selectedCurrency = selectedCurrency
       }
}

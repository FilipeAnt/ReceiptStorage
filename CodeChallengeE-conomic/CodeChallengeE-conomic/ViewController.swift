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
    var context: NSManagedObjectContext! // Assume this is initialized elsewhere

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func receiptLoadPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         guard let image = info[.originalImage] as? UIImage else {
             return
         }
         
         saveReceipt(image: image)
         picker.dismiss(animated: true, completion: nil)
     }
    
    func saveReceipt(image: UIImage) {
          let receipt = Receipt(context: context)
          receipt.imageData = image.jpegData(compressionQuality: 1.0)
          receipt.date = Date()
          receipt.totalAmount = 100.0 // You can set this dynamically or allow user input
          receipt.currency = "USD"
          
          do {
              try context.save()
          } catch {
              print("Failed to save receipt: \(error)")
          }
      }
}


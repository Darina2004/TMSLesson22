//
//  ViewController.swift
//  TMSLesson22
//
//  Created by Mac on 7.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonShowMessage: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var buttonLoadImage: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedCountryIndex: Int?
    var selectedCity: String?
    
    var countryArray = [ "Moscow", "Paris", "London", "New York", "Minsk"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let gestureHandler = UITapGestureRecognizer(target: self, action: #selector(buttonLoadImageTapped))
        buttonLoadImage.addGestureRecognizer(gestureHandler)
        
    }
    
    @IBAction func ButtonShowMessageTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Важное сообщение", message: "Спасибо, что выбрали наше приложение", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
            self.showAlert(message: "Спасибо!")
            
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: { _ in
            
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func buttonLoadImageTapped(_ sender: Any) {
        classicActionSheet()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func classicActionSheet() {
        let alert = UIAlertController(title: "Add Photo from Gallery", message: "Do You want to add photo?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open Gallery", style: .default, handler: { _ in
            self.pickPhotoButtonTapped()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel")
        }))
        self.present(alert, animated: true)
    }
    
    func pickPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func updateLabel() {
        if let selectedCountryIndex = selectedCountryIndex {
            let selectedCountry = countryArray[selectedCountryIndex]
            labelCountry.text = selectedCountry
        }
    }
    
}


//
//  MainViewController.swift
//  AlertController
//
//  Created by Tu Doan on 02/10/2018.
//  Copyright © 2018 DoanVantu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var btnChooseImageSource: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var alertController:UIAlertController!
    var pickerController: UIImagePickerController!
    
    @IBAction func btnChooseImageSource(_ sender: Any) {
        // Chon "Ok" & "Cancel" o giua man hinh.
        
       /* alertController = UIAlertController(title: "Alert", message: "Are you sure", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive(Mau do)) { (actinon) in
            print("Press Cancel")
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { (actinon) in
            print("Press Ok")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController!, animated: true) {
            print("presented")
        }
        */
        
        // Chon "Camera" & "Photo" xuat hien o duoi man hinh di len.
        
        alertController = UIAlertController(title: "Take image", message: "Choose image source(Chon anh)", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {(action) in
            print("You choose Camera")
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) {(action) in
            print("You choose Photo")
            self.openPhoto()
        }
        alertController.addAction(cameraAction)
        alertController.addAction(photoAction)
        alertController.view.tintColor = UIColor.magenta // "magenta" la mau tim. Chon mau cho view
        self.present(alertController!, animated: true) {
            print("presented")
        }
    }
    func  openCamera()  {
        pickerController = UIImagePickerController()
        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
            //Kiem tra xem thiet bi co ho tro camera hay kg? neu kg co thi kg chay nua
            return
        }
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true) {
            print("Presented camera")
        }
    }
    func  openPhoto()  {
        pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    //Mask _ UINavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

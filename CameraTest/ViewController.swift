//
//  ViewController.swift
//  CameraTest
//
//  Created by vlad on 6/2/17.
//  Copyright © 2017 com.hat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let photoPickerController = UIImagePickerController()
    
    @IBAction func showCamera(_ sender: Any) {
        photoPickerController.sourceType = .camera
        photoPickerController.cameraDevice = .front
        
        photoPickerController.delegate = self
        present(photoPickerController, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let storyboard = storyboard else {return}
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "EditingViewController")
        
        picker.present(viewController, animated: true)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

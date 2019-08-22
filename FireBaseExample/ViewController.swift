//
//  ViewController.swift
//  FireBaseExample
//
//  Created by Apple on 21/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var image:UIImage?=nil
    @IBOutlet weak var imagename: UITextField!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBAction func upload(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        let storage = Storage.storage()
        var data = Data()
        data = (self.image?.pngData())!;
        let storageRef = storage.reference()
        print(storageRef)
        var imagenameurl="images/"+imagename.text!+".png"
        //var imagenameurl="images/sec.png"
        
        let imageRef=storageRef.child(imagenameurl)
        imageRef.putData(data,metadata: nil,completion: { (metadata,error) in
            guard let metadata = metadata else{
                print(error)
                return
            }
           // let downloadURL = storageRef.downloadURL(completion: <#(URL?, Error?) -> Void#>)
           //  print(downloadURL)
        })
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // imageview.image = info[.originalImage] as? UIImage
       self.image=info[.originalImage] as! UIImage;
        imageview.image=image
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
   

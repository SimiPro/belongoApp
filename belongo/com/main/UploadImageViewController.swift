//
//  UploadImageViewController.swift
//  belongo
//
//  Created by Simon Huber on 06/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//


import Alamofire


class UploadImageViewController: UINavigationViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {


    @IBOutlet weak var sendbtn: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var shootButton: UIBarButtonItem!
    
    @IBOutlet weak var libraryButton: UIBarButtonItem!
    let picker = UIImagePickerController()
    var chosenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self   //the required delegate to get a photo back to the app.
        sendbtn.hidden = true
     
    }
    
    @IBAction func sendImage(sender: UIButton!) {
        
        Alamofire.request(.GET, "http://localhost:8000/image/upload")
            .responseJSON {(request, response, data, error) in
                println(response)
        }

        
        
        println("Sending image")
        chosenImage!.CGImage
        var data = UIImageJPEGRepresentation(chosenImage!, 1.0)
        Alamofire.upload(.POST, "http://localhost:8000/image/upload?name=simi.jpg",data)
        .responseJSON { (request, response, JSON, error) in
                println(JSON)
                println(error)
        }
    }
    
    
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func pick(sender: UIBarButtonItem!) {
        //get a photo from the library. We present as a popover on iPad, and fullscreen on smaller devices.
        picker.allowsEditing = true //2
        picker.sourceType = .PhotoLibrary //3
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)//4
        picker.popoverPresentationController?.barButtonItem = sender

    
    }
    
    @IBAction func shoot(sender: UIBarButtonItem!) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        }
        else {
            noCamera()
        }

    }
    
    //MARK: - Delegates
    //What to do when the picker returns with a photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage //2
        imageView.contentMode = .ScaleAspectFit //3
        imageView.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
        sendbtn.hidden = false
    }
    //What to do if the image picker cancels.
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

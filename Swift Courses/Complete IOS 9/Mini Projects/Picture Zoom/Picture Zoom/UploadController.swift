//
//  UploadController.swift
//  Picture Zoom
//
//  Created by Tingbo Chen on 3/2/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class UploadController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var userProfileImages = Dictionary<String,AnyObject>()
    var currentImage_str: String = ""
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //print("image selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.imageView.image = image
        
    }
    
    func initiateImageScrollView() {
        setUpScrollView()
        
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    //Toolbar and buttons
    func initiateToolbar() {
        let toolbar = UIToolbar()
        toolbar.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)
        toolbar.sizeToFit()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        
        let deleteButton_var = UIBarButtonItem(title: " Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "deleteButton")
        let pictureButton_var = UIBarButtonItem(title: "Picture ", style: UIBarButtonItemStyle.Plain, target: self, action: "pictureButton")
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([deleteButton_var, flexibleSpace, pictureButton_var], animated: false)
        
        toolbar.userInteractionEnabled = true
        toolbar.backgroundColor = UIColor.blackColor()
        toolbar.barTintColor = UIColor.blackColor()
        self.view.addSubview(toolbar)
    }
    
    func deleteButton(){
        //print("test")
        self.imageView.image = UIImage(named: "placeholder-camera-green.png")
        self.savePicture()
    }
    
    func pictureButton(){
        //print("test")
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(currentImage_str)
        
        if NSUserDefaults().objectForKey("userProfileImages") != nil {
            self.userProfileImages = NSUserDefaults().objectForKey("userProfileImages")! as! NSDictionary as! Dictionary<String,AnyObject>
            
            if self.userProfileImages[currentImage_str] != nil {
                self.imageView = UIImageView(image: UIImage(data: (self.userProfileImages[currentImage_str] as? NSData)!))
            } else {
                self.imageView = UIImageView(image: UIImage(named: "placeholder-camera-green"))
            }
            
        }
        
        self.initiateImageScrollView()
        
        self.initiateToolbar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func savePicture() {
        //Save Image
        if imageView.image != nil && self.imageView.image != UIImage(named: "placeholder-camera-green.png") {
            
            if let imageData = UIImagePNGRepresentation(self.imageView.image!){
                self.userProfileImages[currentImage_str] = imageData
                NSUserDefaults.standardUserDefaults().setObject(self.userProfileImages, forKey: "userProfileImages")
                
                //print("saved")
            }
        } else if self.imageView.image == UIImage(named: "placeholder-camera-green.png") {
            
            self.userProfileImages[currentImage_str] = nil
            
            NSUserDefaults.standardUserDefaults().setObject(self.userProfileImages, forKey: "userProfileImages")
            
            //print("deleted")
        }

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    // MARK: - Set up scroll view
    
    private func setUpScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimumScale = min(widthScale, heightScale)
        
        // set up zooming properties for the scroll view
        scrollView.minimumZoomScale = minimumScale
        scrollView.maximumZoomScale = 3.0
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            self.savePicture()
        }
    }
    
}

extension UploadController : UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    /*
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
    }
    */
}




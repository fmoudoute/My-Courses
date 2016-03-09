//
//  PanViewController.swift
//  Picture Zoom
//
//  Created by Tingbo Chen on 3/3/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

/*
To Do:

-figure out second scroll view at the bottom of the screen for info

-figure out double tap or pinch to segue to zoom screen

*/


import UIKit

class PanViewController: UIViewController, UIScrollViewDelegate {
    
    var pictureScroll: UIScrollView!
    
    var pageControl: UIPageControl!
    
    var secondaryScroll: UIScrollView!

    var userProfileImages = Dictionary<String,AnyObject>()
    
    var pageImages: [UIImage] = []
    
    var pageViews: [UIImageView?] = []
    
    var navBar_adjust = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults().objectForKey("userProfileImages") == nil {
            
            self.userProfileImages = ["image_0":NSData(),"image_1":NSData(),"image_2":NSData(),"image_3":NSData(),"image_4":NSData()]
            
            self.userProfileImages["image_0"] = nil
            self.userProfileImages["image_1"] = nil
            self.userProfileImages["image_2"] = nil
            self.userProfileImages["image_3"] = nil
            self.userProfileImages["image_4"] = nil
            
            NSUserDefaults.standardUserDefaults().setObject(self.userProfileImages, forKey: "userProfileImages")
            
        } else if NSUserDefaults().objectForKey("userProfileImages") != nil {
            
            self.userProfileImages = NSUserDefaults().objectForKey("userProfileImages")! as! NSDictionary as! Dictionary<String,AnyObject>
        }
        
        //Set up pageImages
        let image_str: [String] = ["image_0","image_1","image_2","image_3","image_4"]
        
        for img_name in image_str {
            
            if (self.userProfileImages[img_name] != nil) {
                
                self.pageImages.append(UIImage(data: (self.userProfileImages[img_name] as? NSData)!)!)
            }
            
        }
        
        self.setUpScrollView()
        
        self.initiateImageScroll()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpScrollView() {
        
        self.navBar_adjust = Float(self.navigationController!.navigationBar.frame.size.height) + Float(self.navigationController!.navigationBar.frame.size.height)/2.2
        
        
        //====Set up Picture Scroll View
        
        let picScr_x = CGFloat(0)
        let picScr_y = CGFloat(self.navBar_adjust)
        let picScr_w = self.view.frame.size.width
        let picScr_h = self.view.frame.size.width
        
        pictureScroll = UIScrollView(frame: CGRectMake(picScr_x, picScr_y,picScr_w,picScr_h))
        
        pictureScroll.bounds = pictureScroll.frame
        
        pictureScroll.backgroundColor = UIColor.blackColor()
        
        pictureScroll.pagingEnabled = true

        view.addSubview(pictureScroll)
        pictureScroll.delegate = self //Set scroll view delegate to view delegate
        
        //====Adds Page Control to subview
        let pgCont_x = self.pictureScroll.frame.size.width * 0.25
        let pgCont_y = self.pictureScroll.frame.size.height + self.pictureScroll.frame.size.height*0.09
        let pgCont_w = self.pictureScroll.frame.size.width * 0.5
        let pgCont_h = CGFloat(37)
        
        self.pageControl = UIPageControl(frame: CGRectMake(pgCont_x,pgCont_y,pgCont_w,pgCont_h))
        
        /*
        //Not working...
        let salmon_color = UIColor(red: 255.0, green: 102.0, blue: 102.0, alpha: 1.0)
        let spring_color = UIColor(red: 102.0, green: 255.0, blue: 204.0, alpha: 1.0)
        
        self.pageControl.tintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = salmon_color
        */
        
        view.addSubview(pageControl)
        
        //====Adds Secondary Scroll view
        let secScr_x = CGFloat(0)
        let secScr_y = CGFloat(self.navBar_adjust) + self.pictureScroll.frame.height
        let secScr_w = self.view.frame.size.width
        let secScr_h = self.view.frame.size.height - self.pageControl.frame.height - self.pictureScroll.frame.height
        
        secondaryScroll = UIScrollView(frame: CGRectMake(secScr_x,secScr_y,secScr_w,secScr_h))
        
        secondaryScroll.bounds = secondaryScroll.frame
        
        secondaryScroll.autoresizingMask = [.None, .FlexibleHeight]
        
        secondaryScroll.backgroundColor = UIColor.whiteColor()
        
        //====Adds Name Label
        let nmLab_x = CGFloat(0)
        let nmLab_y = secScr_y
        let nmLab_w = secScr_w
        let nmLab_h = secScr_h * 0.20
        
        var nameLabel = UILabel(frame: CGRectMake(nmLab_x, nmLab_y, nmLab_w, nmLab_h))
        nameLabel.numberOfLines = 1
        nameLabel.font.fontWithSize(CGFloat(22))
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.text = "Alison"
        secondaryScroll.addSubview(nameLabel)
        
        view.addSubview(secondaryScroll)
        secondaryScroll.delegate = self
        
    }
    
    func initiateImageScroll() {
        
        let pageCount = self.pageImages.count
        self.pageControl.numberOfPages = pageCount
        
        //Appends to Page Views Number of Pages
        for i in 0..<pageCount {
            self.pageViews.append(nil)
        }
        
        let pagesScrollViewSize = pictureScroll.frame.size
        
        pictureScroll.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: 1)
        
        loadVisiblePages()
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        print(pictureScroll.bounds)
        print(pictureScroll.frame)
        
        if let pageView = pageViews[page]{
            
        } else {
            
            var boundsVar = pictureScroll.bounds
            
            boundsVar.origin.x = boundsVar.size.width * CGFloat(page)
            //boundsVar.origin.y = 64
            
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleToFill
            newPageView.frame = boundsVar
            pictureScroll.addSubview(newPageView)
            
            pageViews[page] = newPageView
            
        }
        
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        
        let pageWidth = pictureScroll.frame.size.width
        let page = Int(floor((pictureScroll.contentOffset.x*2.0 + pageWidth) / (pageWidth*2.0)))
        
        //Lock y-Bounds:
        pictureScroll.bounds.origin.y = CGFloat(self.navBar_adjust)
        
        pageControl.currentPage = page
        
        let firstPage = page - 1
        let lastPage = page + 1
        
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        for var index = lastPage + 1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        loadVisiblePages()
    }
}



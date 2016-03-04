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
    
    var scrollView: UIScrollView!
    
    var pageControl: UIPageControl!

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
        
        scrollView = UIScrollView(frame: CGRectMake(0,
            CGFloat(self.navBar_adjust),
            self.view.frame.size.width,
            self.view.frame.size.width))
        
        scrollView.bounds = scrollView.frame
        
        scrollView.backgroundColor = UIColor.blackColor()
        
        //Turn on paging:
        scrollView.pagingEnabled = true

        view.addSubview(scrollView)
        
        
        //Adds Page Control to subview
        self.pageControl = UIPageControl(frame: CGRectMake(
            self.scrollView.frame.size.width * 0.25,
            self.scrollView.frame.size.height + self.scrollView.frame.size.height*0.09,
            self.scrollView.frame.size.width * 0.5,
            37))
        
        let salmon_color = UIColor(red: 255.0, green: 102.0, blue: 102.0, alpha: 1.0)
        let spring_color = UIColor(red: 102.0, green: 255.0, blue: 204.0, alpha: 1.0)
        
        self.pageControl.tintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = salmon_color
        
        view.addSubview(pageControl)
        
        //Set scroll view delegate to view delegate
        scrollView.delegate = self
    }
    
    func initiateImageScroll() {
        
        let pageCount = self.pageImages.count
        self.pageControl.numberOfPages = pageCount
        
        //Appends to Page Views Number of Pages
        for i in 0..<pageCount {
            self.pageViews.append(nil)
        }
        
        let pagesScrollViewSize = scrollView.frame.size
        
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: 1)
        
        loadVisiblePages()
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        print(scrollView.bounds)
        print(scrollView.frame)
        
        if let pageView = pageViews[page]{
            
        } else {
            
            var boundsVar = scrollView.bounds
            
            boundsVar.origin.x = boundsVar.size.width * CGFloat(page)
            //boundsVar.origin.y = 64
            
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleToFill
            newPageView.frame = boundsVar
            scrollView.addSubview(newPageView)
            
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
        
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x*2.0 + pageWidth) / (pageWidth*2.0)))
        
        //Lock y-Bounds:
        scrollView.bounds.origin.y = CGFloat(self.navBar_adjust)
        
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



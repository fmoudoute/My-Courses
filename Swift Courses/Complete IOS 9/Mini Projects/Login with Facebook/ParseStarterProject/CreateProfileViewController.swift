//
//  CreateProfileViewController.swift
//  ParseStarterProject
//
//  Created by Tingbo Chen on 2/16/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class CreateProfileViewController: UIViewController {
    
    @IBOutlet var profilePic: UIImageView!
    
    @IBOutlet var nameOutlet: UILabel!
    
    @IBOutlet var ageOutlet: UILabel!
    
    @IBOutlet var sexPreferenceSwitch: UISwitch!
    
    var savedArray: [AnyObject] = ["nil"]

    @IBAction func finishProfileEdit(sender: AnyObject) {
        
        PFUser.currentUser()?["interestedWomen"] = sexPreferenceSwitch.on
        PFUser.currentUser()?.save()
        
        //Save in perm storage user preferences
        if sexPreferenceSwitch.on == true {
            self.savedArray[0] = "women"
        } else if sexPreferenceSwitch.on == false {
            self.savedArray[0] = "men"
        }
        
        NSUserDefaults.standardUserDefaults().setObject(self.savedArray, forKey: "savedArray")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //Programmatically adding users
        
        let urlArray = ["http://m.rgbimg.com/cache1nTOqz/users/g/ge/geloo/600/mludlC6.jpg","http://res.freestockphotos.biz/pictures/14/14912-a-beautiful-young-woman-in-business-attire-pv.jpg","http://res.freestockphotos.biz/pictures/15/15254-a-young-woman-drinking-bottled-water-outdoors-before-exercising-pv.jpg","http://m.rgbimg.com/cache1nTOov/users/g/ge/geloo/600/mlucOXA.jpg","http://d2436y6oj07al2.cloudfront.net/spff/previews/LL0000A509.jpg","https://40.media.tumblr.com/b6728de7bb1cc1d7338af84944d39764/tumblr_nakevna1031sm2ruzo1_500.jpg","http://images.twistmagazine.com/uploads/images/file/21604/sabrina-carpenter-selfie.jpg?fit=crop&h=666&w=500","http://i3.mirror.co.uk/incoming/article7146195.ece/ALTERNATES/s615/Kourtney-Kardashian-Main.jpg","http://www.youthsfashion.com/wp-content/plugins/RSSPoster_PRO/cache/2830d_gwen-stefani-makeup-free-selfie.png","http://www.eonline.com/eol_images/Entire_Site/2014316/rs_634x830-140416103626-634.human-barbie.cm.41614.jpg","http://i2.wp.com/starmagazine.com/wp-content/uploads/2015/01/lady-gaga-no-makeup.jpg?w=600","http://st2.depositphotos.com/2069237/6276/v/380/depositphotos_62760067-Girl-with-surfboard.jpg","http://g03.a.alicdn.com/kf/HTB1JsX0IXXXXXXGXXXXq6xXFXXXv/New-Fashion-Women-Autumn-Winte-Coat-Female-Fake-Two-Splicing-Down-Vest-And-Woolen-Sweater-Thick.jpg","http://i.kinja-img.com/gawker-media/image/upload/s--zsTfvoaN--/kbxdaxcekgkoiup4ex45.jpg","http://25.media.tumblr.com/tumblr_m9pf1bF9Qh1qj552mo1_500.jpg","http://i5.asn.im/hot-asian-women-_uaf5.jpg","https://lh4.googleusercontent.com/-XcDtIRIuypY/UdxP9QJWpEI/AAAAAAAAuaU/MO1e85ejAsI/w506-h750/hot-asian-chicks-self-shot.jpg","http://k2.okccdn.com/php/load_okc_image.php/images/16/150x150/558x800/120x140/450x471/0/11985691427390211399.jpeg","http://k03.kn3.net/964CF0DCC.jpg","http://www.friendsmania.net/fashion/wp-content/uploads/2015/01/Facebook-Girls-Fake-Display-Pictures-FB-fake-girls-leaked-profile-pictures-201.jpg","http://www.lapatilla.com/site/wp-content/uploads/2014/09/Lauren-Hanley-8.jpg","http://data.whicdn.com/images/214389749/large.jpg","http://data.whicdn.com/images/49165870/large.jpg","http://www.wholesale7.net/images/201210/goods_img/53586_P_1350204423927.jpg"]
        
        //print(urlArray.count)
        
        let femaleName_ls = ["Cindy","Lauren","Faye","Azi","Queenie","Theorina","Jay","Tina","Min Ju","Christina","Meg","Ming Ming","Umi","Andi","Cathy L","Carol","Zoe","Hee","Cathy C",
            "Bella","Aurora","Neva","Hangbing","Amy"]
        
        //print(femaleName_ls)
        
        var counter = 0
        
        for url in urlArray {
            
            let ns_url = NSURL(string: url)!
            //print(ns_url)
            
            if let data = NSData(contentsOfURL: ns_url) {
                
                self.profilePic.image = UIImage(data: data)
                
                //Save Image File to Parse
                let imageFile: PFFile = PFFile(data: data)
                
                var user:PFUser = PFUser()
                
                user.username = femaleName_ls[counter]
                counter += 1
                
                user.password = "aaa"
                
                user["image"] = imageFile
                user["interestedWomen"] = false
                user["gender"] = "female"
                
                user.signUp()
                
                PFUser.currentUser()?.save()
                
            }
            
        }
        */
        
        //=========
        
        
        if NSUserDefaults().objectForKey("savedArray") != nil {
            self.savedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray as [AnyObject] //Converting back to Array
        }
        
        //Gets information about the user from Facebook.
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, gender, locale"])
        
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error)
            } else if let result = result {
                print(result)
                
                PFUser.currentUser()?["gender"] = result["gender"]
                PFUser.currentUser()?["name"] = result["name"]
                
                PFUser.currentUser()?.save()
                
                //Set sexPreference Switch
                if self.savedArray[0] as! String == "nil" {
                    if result["gender"] as! String == "male" {
                        self.sexPreferenceSwitch.on = true
                    } else if result["gender"] as! String == "female" {
                        self.sexPreferenceSwitch.on = false
                    }
                } else if self.savedArray[0] as! String == "men" {
                    self.sexPreferenceSwitch.on = false
                } else if self.savedArray[0] as! String == "women" {
                    self.sexPreferenceSwitch.on = true
                }
                
                
                let userID = result["id"] as! String
                
                let facebookProfilePictureUrl = "https://graph.facebook.com/" + userID + "/picture?type=large"
                
                if let fbpicUrl = NSURL(string: facebookProfilePictureUrl) {
                    if let data = NSData(contentsOfURL: fbpicUrl) {
                        
                        self.profilePic.image = UIImage(data: data)
                        
                        self.nameOutlet.text = result["first_name"] as? String
                        
                        //Save Image File to Parse
                        let imageFile: PFFile = PFFile(data: data)
                        PFUser.currentUser()?["image"] = imageFile
                        PFUser.currentUser()?.save()
                        
                    }
                }
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

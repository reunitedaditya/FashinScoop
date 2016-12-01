//
//  ProfileViewController.swift
//  beta1
//
//  Created by united on 22/11/16.
//  Copyright © 2016 united. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
 
    var lastContentOffset : CGFloat = 0
    
    @IBOutlet weak var subTitle: UILabel!
    var main = ["Most Popular" , "Personal Curation"]
    
    @IBOutlet weak var settings: UIButton!
   
    @IBOutlet weak var mainTitle: UILabel!

    @IBOutlet weak var MainTableView: UITableView!
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        initializeGestures()
        MainTableView.dataSource = self
        MainTableView.delegate = self

    }
    
    var profileViewStandardFrame : CGRect?
    var mainTitleViewStandardFrame : CGRect?
    var subtitleViewStandardFrame : CGRect?

    @IBOutlet weak var profileImageView: UIImageView!

    
    func initializeGestures(){      //setup gesture recognizer
 
        
        let topSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ProfileViewController.handleSwipe))
    
      let botSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ProfileViewController.handleSwipe))
        
        topSwipe.direction = .up
        botSwipe.direction = .down
        MainTableView.addGestureRecognizer(topSwipe)
        MainTableView.addGestureRecognizer(botSwipe)
        
        profileViewStandardFrame = self.profileImageView.frame
        mainTitleViewStandardFrame = self.mainTitle.frame
        subtitleViewStandardFrame = self.subTitle.frame

        
    }
    
    

    func handleSwipe( sender : UISwipeGestureRecognizer) {     //swipe action function
    
        if sender.direction == .down {
            
            //slide down
            print("sliding down")
            
            UIView.animate(withDuration: 1.0 / 3 , delay: 0, options: .curveEaseOut, animations: {
                
                self.backgroundImage.isHidden = true
                self.profileImageView.frame = self.profileViewStandardFrame!
                self.MainTableView.layer.position.y = 535.0
                self.mainTitle.frame = self.mainTitleViewStandardFrame!
                self.subTitle.frame = self.subtitleViewStandardFrame!
                self.mainTitle.textColor = UIColor.white
                self.subTitle.textColor = UIColor.white
                self.backgroundImage.isHidden = false
                
            }, completion: nil)
            

        
            
        } else if sender.direction == .up {
           
            
            //slide up
            
            print("sliding up")
            

            UIView.animate(withDuration: 1.0 / 3 , delay: 0, options: .curveEaseOut, animations: {
                
                self.backgroundImage.isHidden = true
                self.profileImageView.frame = CGRect(x: -20, y: -130, width: 50, height: 50)
                self.profileImageView.layer.cornerRadius = 5.0
                self.MainTableView.layer.position.y = 370
                self.mainTitle.layer.position.x = self.MainTableView.layer.position.x - 80
                self.mainTitle.layer.position.y = 40
                self.subTitle.layer.position.y = 60
                self.subTitle.layer.position.x = self.MainTableView.layer.position.x - 75
                self.mainTitle.textColor = UIColor.black
                self.subTitle.textColor = UIColor.black
                
            }, completion: nil)
            
         
            
        }
        
    }

   
}

extension ProfileViewController : UITableViewDataSource , UITableViewDelegate , UIScrollViewDelegate {
    
    //Delegate methods
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            
            return main[0]
            
        case 1 :
            
            return main[1]
        default:
            
            return "Nope"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
           
            return cell
            
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view  as! UITableViewHeaderFooterView
        
        header.contentView.backgroundColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
    
    }
    
    

  
}

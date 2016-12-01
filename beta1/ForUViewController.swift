//
//  ForUViewController.swift
//  beta1
//
//  Created by united on 21/11/16.
//  Copyright © 2016 united. All rights reserved.
//

import UIKit

class ForUViewController: UIViewController {
    
    
    let recommendationThumbnails = [ "color","footwear" , "Summer Collection" ]
    let titleRecommendation = ["Play with Colors" , "Footwear combinations" , "Ready for a Sunny Day"]
    let dressArray = ["nike" , "dress2"  , "dress4" , "dress5"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
      initializeCollectionView()
    }


    
    @IBOutlet weak var RecommendationCollectionView: UICollectionView!
    @IBOutlet weak var clothCollectionView: UICollectionView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeCollectionView(){
        
        self.clothCollectionView.delegate = self
        self.clothCollectionView.dataSource = self
        
        self.RecommendationCollectionView.delegate = self
        
        self.RecommendationCollectionView.dataSource = self
    }
    


}

extension ForUViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == RecommendationCollectionView {
        
       return recommendationThumbnails.count
            
        } else {
            
            return dressArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == RecommendationCollectionView {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecommendationCollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.mainImageView.image = UIImage(named : recommendationThumbnails[indexPath.row])
        cell.infoLabel.text = titleRecommendation[indexPath.row]
        
    
        
        return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothCell", for: indexPath) as! ClothCollectionViewCell
            
            cell.backgroundColor = UIColor.white
            cell.clothImageView.image = UIImage(named: dressArray[indexPath.row])
            
            return cell
        
        }
    }
    

}

//
//  SearchViewController.swift
//  beta1
//
//  Created by united on 25/11/16.
//  Copyright © 2016 united. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aroundTheGlobeCollectionView.delegate = self
        aroundTheGlobeCollectionView.dataSource = self

        initilizeGestures()
    }
  
    
    let globeArray = ["adidas" , "alone" , "partyWear" , "christmasSkirt" , "color" , "geek" , "globalTrends" , "Naps" ,"Vans" , "Gold" , "footwear" , "yellow"]
  
    
    func initilizeGestures(){
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchViewController.handleTop))
        
        self.view.addGestureRecognizer(tap)
        
        
    }
    @IBOutlet weak var aroundTheGlobeCollectionView: UICollectionView!
    
    
    
    
    
    func handleTop(sender : UITapGestureRecognizer) {
       
        view.endEditing(true)
        
    }
    
    
}

extension SearchViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return globeArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GlobeCell", for: indexPath) as! GlobeCollectionViewCell
        
        cell.ImageOfCell.image = UIImage(named : globeArray[indexPath.row])
        
        
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

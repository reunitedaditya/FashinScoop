//
//  TopTableViewCell.swift
//  beta1
//
//  Created by united on 22/11/16.
//  Copyright © 2016 united. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    var imageCollection = [  "Vans" , "Gold" , "yellow" , "geek" , "adidas"]
    var punchLine = ["Vans Top 10" , "Our Gold Collection." , "Yellow is the new black." ,
                     "Geek Style" , "Beach wear"]

    @IBOutlet weak var TopCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        TopCollectionView.delegate = self
        TopCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TopTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageCollection.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.myImageView.image = UIImage(named : imageCollection[indexPath.row])
        cell.punchLine.text =  punchLine[indexPath.row]
        
        
        return cell
    }
    
    
    
    
}

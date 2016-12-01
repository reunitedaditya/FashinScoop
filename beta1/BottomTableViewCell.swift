//
//  BottomTableViewCell.swift
//  beta1
//
//  Created by united on 22/11/16.
//  Copyright © 2016 united. All rights reserved.
//

import UIKit

class BottomTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomCollectionView: UICollectionView!
    var clothes = ["whitey", "blueTshirt" , "greyTop" , "greyWhite" ,"Naps"]
    override func awakeFromNib() {
        super.awakeFromNib()

    
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BottomTableViewCell :  UICollectionViewDelegate  , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as! BottomCollectionViewCell
        
        cell.imageFrame.image = UIImage(named : clothes[indexPath.row])
        
        return cell
        
        
    }
    
    
    
    
    
    
}

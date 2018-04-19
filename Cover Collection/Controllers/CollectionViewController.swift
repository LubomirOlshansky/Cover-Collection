//
//  ViewController.swift
//  Cover Collection
//
//  Created by Lubomir Olshansky on 17/04/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var values = Array(0...100)

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
}


// MARK: UICollectionViewDataSource
extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell

        cell.textLabel.text = String(values[indexPath.row])
        
        return cell
    }
}

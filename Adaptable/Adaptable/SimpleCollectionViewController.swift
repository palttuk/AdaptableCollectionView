//
//  SimpleCollectionViewController.swift
//  Adaptable
//
//  Created by heeso Kim on 2017. 2. 17..
//  Copyright © 2017년 heeso Kim. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SimpleCollectionViewController: UICollectionViewController {
  var sections: [Section]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Register cell classes
    configure()
    
    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   }
   */
}

extension SimpleCollectionViewController: AdaptableCollectionView {
  
  var delegate: UICollectionViewDelegate {
    return SimpleColllectionViewDelegate()
  }
  
  var dataSource: UICollectionViewDataSource {
    return SimpleCollectoinViewDataSource()
  }
  
}

// MARK: UICollectionViewDelegate
class SimpleColllectionViewDelegate: NSObject, UICollectionViewDelegate {
  /*
   // Uncomment this method to specify if the specified item should be highlighted during tracking
   override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment this method to specify if the specified item should be selected
   override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
   override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
   
   }
   */
  
}

// MARK: UICollectionViewDataSource
class SimpleCollectoinViewDataSource: NSObject, UICollectionViewDataSource {
  var sections: [Section]!
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sections.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return sections[section].rowItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    
    return cell
  }
  
}





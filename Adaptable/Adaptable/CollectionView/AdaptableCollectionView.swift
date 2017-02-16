//
//  AdaptableCollectionView.swift
//  Adaptable
//
//  Created by heeso Kim on 2017. 2. 17..
//  Copyright © 2017년 heeso Kim. All rights reserved.
//

import UIKit

protocol ReusableView: class {
  static var reuseIdentifier: String { get set }
}

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

struct SupplementaryInfo {
  var title: String?
  var view: ReusableView
}

struct RowItem {
  var cell: ReusableView
}

struct Section {
  var headerInfo: SupplementaryInfo?
  var rowItems: [RowItem]
  var footerInfo: SupplementaryInfo?
}

protocol AdaptableCollectionView: class {
  var collectionView: UICollectionView? { get set }
  var delegate: UICollectionViewDelegate { get }
  var dataSource: UICollectionViewDataSource { get }
}

extension AdaptableCollectionView {
  func configure() {
    self.collectionView?.delegate = delegate
    self.collectionView?.dataSource = dataSource
  }
  
  
  func configureCells(_ cell: [ReusableView]) {
    
  }
}


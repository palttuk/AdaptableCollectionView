//
//  AdaptableCollectionView.swift
//  Adaptable
//
//  Created by heeso Kim on 2017. 2. 17..
//  Copyright © 2017년 heeso Kim. All rights reserved.
//

import UIKit

protocol Reusable: class {
  static var reuseIdentifier: String { get }
  
}

extension Reusable where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
  
}

protocol NibReusable: Reusable {
  static var nib: UINib? { get }
}

extension NibReusable {
  static var nib: UINib? {
    return nil
  }
}

struct SupplementaryInfo {
  var title: String?
  var view: Reusable
}

struct RowItem {
  var cell: Reusable
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
  
  func configureCells(_ cell: [Reusable]) {
    
  }
}


extension UITableView {
  func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
    self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: NibReusable {
    guard let nib = T.nib else {
      fatalError()
      return
    }
    
    self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
    return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
  }

  func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
    self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibReusable {
    guard let nib = T.nib else {
      fatalError()
    }
    self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
    return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
  }
}

extension UICollectionView {
  func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
      self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: NibReusable {
    guard let nib = T.nib else {
      fatalError()
    }
    
    self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
    return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
  }

  func registerReusableSupplementaryView<T: NibReusable>(elementKind: String, _: T.Type) {
    guard let nib = T.nib else {
      fatalError()     
    }

    self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
    self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: NSIndexPath) -> T where T: Reusable, T: Reusable {
    return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
  }
}

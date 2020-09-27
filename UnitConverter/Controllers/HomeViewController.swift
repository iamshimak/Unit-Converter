//
//  ViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let labelNames: [String] = ["Weight", "Temperature", "Length", "Speed", "Liquid"]
    let segueIdentifiers: [String] = ["weightSegue", "temperatureSegue", "lengthSegue", "speedSegue", "volumeSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GradientColor(.topToBottom,
                                                  frame: view.frame,
                                                  colors: [FlatYellowDark(), FlatOrangeDark()])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EquationCollectionViewCell.identifier, for: indexPath) as! EquationCollectionViewCell
        cell.nameLabel.text = labelNames[indexPath.row]
        cell.setGradientBackground(forIndex: indexPath.row)
        return cell
    }
    
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: nil)
    }
    
    // MARK: - DelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace: CGFloat = 30.0
        let availableWidth: CGFloat = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 2
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.60)
    }
    
}


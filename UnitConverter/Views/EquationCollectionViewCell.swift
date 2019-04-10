//
//  EquationCollectionViewCell.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit
import ChameleonFramework

class EquationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "equationCell"
    
    static let gradientColors: [[UIColor]] = [
        [FlatMint(), FlatMintDark()],
        [FlatOrange(), FlatOrangeDark()],
        [FlatSkyBlue(), FlatSkyBlueDark()],
        [FlatPink(), FlatPinkDark()],
        [FlatPurple(), FlatPurpleDark()]
    ]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func awakeFromNib() {
        setupNameLabel()
    }
    
    func setup() {
        roundCorner()
        setCellShadow()
    }
    
    func roundCorner() {
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.masksToBounds = true
    }
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3
        self.clipsToBounds = false
    }
    
    func setGradientBackground(forIndex index: Int) {
        self.contentView.backgroundColor = GradientColor(.leftToRight,
                                                         frame: frame,
                                                         colors: EquationCollectionViewCell.gradientColors[index])
    }
    
    func setupNameLabel() {
        nameLabel.textColor = UIColor.white
    }
}

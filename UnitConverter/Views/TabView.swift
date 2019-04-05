//
//  TabView.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class TabView: UIView {
    
    static let sharedInstance = createTabView()
    
    @IBOutlet weak var equationButton: UIButton!
    @IBOutlet weak var constantsButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    static func createTabView() -> TabView {
        return Bundle.main.loadNibNamed("TabView", owner: self, options: nil)?.first as! TabView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        //addSubview(TabView.sharedInstance)
    }
    
    func setupFrame(from view: UIView) {
        self.frame = view.bounds
        
    }

}

//
//  TabView.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/26/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class TabView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)![0] as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = bounds
        addSubview(view)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

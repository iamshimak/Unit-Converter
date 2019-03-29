//
//  BrandViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {
    
    var tabBar: TabView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar = TabView.createTabView()
    }
    
    func setupTabBarFrom(view: UIView) {
        tabBar.frame = view.bounds
        view.addSubview(tabBar)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

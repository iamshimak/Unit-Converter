//
//  UnitsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class UnitsViewController: BrandViewController {
    
    var keyboardView: KeyboardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        let navigationItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveButtonPressed))
        self.navigationItem.rightBarButtonItem = navigationItem
    }
    
    @objc func onSaveButtonPressed() {
        
    }
    
    func setupKeyBoard(_ scrollView: UIScrollView) {
        keyboardView = KeyboardView.createKeyboardView()
        keyboardView.scrollView = scrollView
        
        keyboardView.onNumberKeyPressed = { number, sign in
            self.onNumberKeyPressed(number: number, sign: sign)
        }
        
        keyboardView.onHideKeyPressed = {
            self.onHideKeyPressed()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.keyWindow!.addSubview(keyboardView)
    }
    
    func onNumberKeyPressed(number: Int, sign: KeyboardView.Sign) {
        
    }
    
    func onHideKeyPressed() {
        
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

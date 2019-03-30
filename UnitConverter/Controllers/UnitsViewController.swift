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
        
        keyboardView.onNumberKeyPressed = { sign, number, tag in
            self.onNumberKeyPressed(number: number, sign: sign, tag: tag)
        }
        
        keyboardView.onHideKeyPressed = {
            self.onHideKeyPressed()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.keyWindow!.addSubview(keyboardView)
    }
    
    func onNumberKeyPressed(number: Float, sign: KeyboardView.Sign, tag: Int) {
        
    }
    
    func onHideKeyPressed() {
        
    }
    
    // MARK: - TextField helpers
    
    func updateTextField(tag: Int, value: Float) {
        let textField : UITextField = self.view.viewWithTag(tag) as! UITextField
        textField.text = String(describing: value)
    }
    
    func getTextFieldValue(from tag: Int) -> Float {
        let textField : UITextField = self.view.viewWithTag(tag) as! UITextField
        
        let value: Float
        if let text = textField.text, let floatText = NumberFormatter().number(from: text) {
            value = floatText.floatValue
        } else {
            value = 0.0
        }
        
        return value
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

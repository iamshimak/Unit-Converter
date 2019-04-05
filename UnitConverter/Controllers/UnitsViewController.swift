//
//  UnitsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class UnitsViewController: BrandViewController, UITextFieldDelegate {
    
    var keyboardView: KeyboardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupKeyboardHide()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        //TODO back button history name change
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.keyWindow!.addSubview(keyboardView)
    }
    
    func setupNavigationItem() {
        let navigationItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveButtonPressed))
        self.navigationItem.rightBarButtonItem = navigationItem
    }
    
    func setupKeyboardHide() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        keyboardView.hide()
    }
    
    @objc func onSaveButtonPressed() {
        
    }
    
    func setupKeyBoard(_ scrollView: UIScrollView) {
        keyboardView = KeyboardView.createKeyboardView()
        keyboardView.scrollView = scrollView
        
        keyboardView.onNumberKeyPressed = { sign, number, pressedNumber, tag in
            guard let number = number else {
                self.clearTextFields(tags: self.textFields())
                return
            }
            self.textfield(value: number, for: tag)
        }
        
        keyboardView.onHideKeyPressed = {
            self.onHideKeyPressed()
        }
    }
    
    func onHideKeyPressed() {
        
    }
    
    // MARK: - TextField helpers
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.show()
        keyboardView.textField(for: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardView.hide()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // TODO validations
        let tag = textField.tag
        let value = TextUtils.numberValue(for: textField.text, range: range, replaceString: string)
        textfield(value: value, for: tag)
        
        return true
    }
    
    func textfield(value: Float,for tag: Int) {}
    
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
    
    func clearTextFields(tags: [Int]) {
        for tag in tags {
            let textField : UITextField = self.view.viewWithTag(tag) as! UITextField
            textField.text = nil
        }
    }
    
    func textFields() -> [Int] {
        return []
    }
    
}

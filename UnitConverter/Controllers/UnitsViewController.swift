//
//  UnitsViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class UnitsViewController: BrandViewController {
    
    var keyboardView: KeyboardView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupKeyboardHide()
        setupKeyBoard()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterNotifications()
    }
    
    func setupNavigationItem() {
        let navigationItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveButtonPressed))
        self.navigationItem.rightBarButtonItem = navigationItem
    }
    
    func setupKeyboardHide() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
    
    @objc func dismissKeyboard() {
        //keyboardView.hide()
    }
    
    @objc func onSaveButtonPressed() {
        
    }
    
    func setupKeyBoard() {
        keyboardView = KeyboardView.shared
        
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

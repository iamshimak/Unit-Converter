//
//  UnitsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class UnitsViewController: UIViewController {
    
    var keyboardView: KeyboardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardView = KeyboardView.createKeyboardView()
        
        keyboardView.onNumberKeyPressed = { number, sign in
            self.onNumberKeyPressed(number: number, sign: sign)
        }
        
        keyboardView.onHideKeyPressed = {
            self.onHideKeyPressed()
        }
        
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

//
//  AlertManager.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 4/7/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class AlertManager {
    static func showSaveAlert(_ viewController: UIViewController) {
        let alert = UIAlertController(title: "Saved", message: "Results successfully saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}

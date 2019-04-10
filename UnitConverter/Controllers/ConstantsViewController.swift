//
//  ConstantsViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 4/10/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class ConstantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let equationTitles: [String] = ["Electron mass", "Proton mass", "Neutron mass", "Electric permitivitty", "Magnetic permitivitty", "Speed of light in meteres"]
    var equations: [String:NSAttributedString] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEquations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Constants"
        self.tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func mathItalicFont(size: CGFloat) -> UIFont {
        return UIFont(name:"TexGyreTermes-Italic", size: size)!
    }
    
    private func addEquations() {
        let defaultFontSize: CGFloat = 20
        let fontItalic = mathItalicFont(size: defaultFontSize)
        let preTextItalic = mathItalicFont(size: defaultFontSize + 5)
        
        var attributedString = NSMutableAttributedString(string: "me", attributes: [.font: preTextItalic])
        var preTextAttributes: [NSAttributedString.Key : Any] = [
            .font: fontItalic,
            .baselineOffset: -3
        ]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        equations["Electron mass"] = attributedString
        
        attributedString = NSMutableAttributedString(string: "mp", attributes: [.font: preTextItalic])
        preTextAttributes = [.font: fontItalic, .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        equations["Proton mass"] = attributedString
        
        attributedString = NSMutableAttributedString(string: "mn", attributes: [.font: preTextItalic])
        preTextAttributes = [.font: fontItalic, .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        equations["Neutron mass"] = attributedString
        
        attributedString = NSMutableAttributedString(string: "\u{03b5}0", attributes: [.font: preTextItalic])
        preTextAttributes = [.font: mathItalicFont(size: defaultFontSize - 1), .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        equations["Electric permitivitty"] = attributedString
        
        attributedString = NSMutableAttributedString(string: "\u{03bc}0", attributes: [.font: mathItalicFont(size: defaultFontSize + 7)])
        preTextAttributes = [.font: mathItalicFont(size: defaultFontSize - 3), .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        equations["Magnetic permitivitty"] = attributedString
        
        attributedString = NSMutableAttributedString(string: "C", attributes: [.font: preTextItalic])
        equations["Speed of light in meteres"] = attributedString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "constantCell", for: indexPath) as! EquationTableViewCell
        
        let arrayEquations = Array(equations)
        cell.updateValues(title: arrayEquations[indexPath.row].key, attributedEquation: arrayEquations[indexPath.row].value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

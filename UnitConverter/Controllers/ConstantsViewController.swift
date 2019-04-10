//
//  ConstantsViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 4/10/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class ConstantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var symbols: [ConstantsEquation] = []
    
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
    
    func mathFont(size: CGFloat) -> UIFont {
        return UIFont(name:"TeX Gyre Termes Math", size: size)!
    }
    
    private func addEquations() {
        let defaultFontSize: CGFloat = 20
        let fontItalic = mathItalicFont(size: defaultFontSize)
        let preFontItalic = mathItalicFont(size: defaultFontSize + 5)
        let unitFont = mathFont(size: defaultFontSize)
        let unitSubFont = mathFont(size: defaultFontSize - 10)
        
        var attributedString = NSMutableAttributedString(string: "me", attributes: [.font: preFontItalic])
        var preTextAttributes: [NSAttributedString.Key : Any] = [
            .font: fontItalic,
            .baselineOffset: -3
        ]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        
        var unitAttributedString = NSMutableAttributedString(string: "9.109xxxxx x 10-31 kg", attributes: [.font: unitFont])
        var unitAttributes: [NSAttributedString.Key : Any] = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:15,length:3))
        
        var equation = ConstantsEquation()
        equation.title = "Electron mass"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
        
        attributedString = NSMutableAttributedString(string: "mp", attributes: [.font: preFontItalic])
        preTextAttributes = [.font: fontItalic, .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        
        unitAttributedString = NSMutableAttributedString(string: "1.672xxxxx x 10-27 kg", attributes: [.font: unitFont])
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:15,length:3))
        
        equation = ConstantsEquation()
        equation.title = "Proton mass"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
        
        attributedString = NSMutableAttributedString(string: "mn", attributes: [.font: preFontItalic])
        preTextAttributes = [.font: fontItalic, .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        
        unitAttributedString = NSMutableAttributedString(string: "1.674xxxxx x 10-27 kg", attributes: [.font: unitFont])
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:15,length:3))
        
        equation = ConstantsEquation()
        equation.title = "Neutron mass"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
        
        attributedString = NSMutableAttributedString(string: "\u{03b5}0", attributes: [.font: preFontItalic])
        preTextAttributes = [.font: mathItalicFont(size: defaultFontSize - 1), .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        
        unitAttributedString = NSMutableAttributedString(string: "8.854xxxxx × 10−12 C2/N m2", attributes: [.font: unitFont])
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:15,length:3))
        
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:20,length:1))
        
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:25,length:1))
        
        equation = ConstantsEquation()
        equation.title = "Electric permitivitty"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
        
        attributedString = NSMutableAttributedString(string: "\u{03bc}0", attributes: [.font: mathItalicFont(size: defaultFontSize + 7)])
        preTextAttributes = [.font: mathItalicFont(size: defaultFontSize - 3), .baselineOffset: -3]
        attributedString.setAttributes(preTextAttributes, range: NSRange(location:1,length:1))
        
        unitAttributedString = NSMutableAttributedString(string: "4π × 10−7 T m/A", attributes: [.font: unitFont])
        unitAttributes = [
            .font: unitSubFont,
            .baselineOffset: 10
        ]
        unitAttributedString.setAttributes(unitAttributes, range: NSRange(location:7,length:2))
        
        equation = ConstantsEquation()
        equation.title = "Magnetic permitivitty"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
        
        attributedString = NSMutableAttributedString(string: "C", attributes: [.font: preFontItalic])
        unitAttributedString = NSMutableAttributedString(string: "m/s", attributes: [.font: unitFont])
        
        equation = ConstantsEquation()
        equation.title = "Speed of light in meteres"
        equation.symbol = attributedString
        equation.unit = unitAttributedString
        symbols.append(equation)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "constantCell", for: indexPath) as! EquationTableViewCell
        let equation = symbols[indexPath.row]
        cell.updateValues(title: equation.title!, attributedEquation: equation.symbol!, unit: equation.unit!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

class ConstantsEquation {
    var title: String? = nil
    var symbol: NSAttributedString? = nil
    var unit: NSAttributedString? = nil
}

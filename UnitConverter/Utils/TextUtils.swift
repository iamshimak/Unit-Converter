//
//  TextUtils.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class TextUtils {
    static func numberValue(for currentText: String?, range: NSRange, replaceString: String) -> Float {
        let value: String
        if let text = currentText, let _range = Range(range, in: text) {
            value = text.replacingCharacters(in: _range, with: replaceString)
        } else {
            value = replaceString
        }
    
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: value)?.floatValue ?? 0
    }
}

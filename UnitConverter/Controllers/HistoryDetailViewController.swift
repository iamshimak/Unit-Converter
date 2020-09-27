//
//  HistoryDetailViewController.swift
//  UnitConverter
//
//  Created by Shimak on 9/27/20.
//  Copyright © 2020 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public var equationVals: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if equationVals["stones"] != nil {
            equationVals["stones"] = [equationVals["stones"], equationVals["stone_pounds"]] as Any
        }
        
        equationVals.removeValue(forKey: "savedDate")
    }
    
}

extension HistoryDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equationVals.count == 0 ? 1 : equationVals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < equationVals.count {
            let equation = Array(equationVals)[indexPath.row]
            
            if equation.value is [Any] {
                let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTwoLabelsTableViewCell.identifierr,
                                                         for: indexPath) as! HistoryTwoLabelsTableViewCell
                let vals = equation.value as! [Float]
                cell.titleLabel.text = "Stones and Pounds"
                cell.valueLabel.text = String(describing: vals[0])
                cell.secondLabel.text = String(describing: vals[1])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
                
                cell.titleLabel.text = equation.key
                cell.valueLabel.text = String(describing: equation.value)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            return cell
        }
    }
}

extension HistoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

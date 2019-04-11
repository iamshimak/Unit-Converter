//
//  HistoryViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var equationVals: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.sendActions(for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "History"
        self.tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Retrieve object from UserDefaults and uodate current value
    @IBAction func onSegmentedValueChanged(_ sender: UISegmentedControl) {
        var val: [String: Any]?
        switch sender.selectedSegmentIndex {
        case 0:
            val = EquationsStoreManager.retrieve(object: Equations.Weight.self).equationDictionary
            if val != nil {
                val!["stones"] = [val!["stones"], val!["stone_pounds"]] as Any
            }
        case 1:
            val = EquationsStoreManager.retrieve(object: Equations.Temperature.self).equationDictionary
        case 2:
            val = EquationsStoreManager.retrieve(object: Equations.Length.self).equationDictionary
        case 3:
            val = EquationsStoreManager.retrieve(object: Equations.Speed.self).equationDictionary
        case 4:
            val = EquationsStoreManager.retrieve(object: Equations.Liquid.self).equationDictionary
        default:
            break
        }
        
        equationVals = val ?? [:]
        tableview.reloadData()
    }
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

}

//
//  HistoryViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var equationVals: [String: Float] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.sendActions(for: .valueChanged)
    }
    
    @IBAction func onSegmentedValueChanged(_ sender: UISegmentedControl) {
        var val: [String:Float]?
        switch sender.selectedSegmentIndex {
        case 0:
            val = EquationsStoreManager.retrieve(object: Equations.Weight.self).equationDictionary
        case 2:
            val = EquationsStoreManager.retrieve(object: Equations.Length.self).equationDictionary
        default:
            break
        }
        
        if let _val = val {
            equationVals = _val
            tableview.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equationVals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        cell.titleLabel.text = Array(equationVals)[indexPath.row].key
        cell.equationLabel.text = String(describing: Array(equationVals)[indexPath.row].value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
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

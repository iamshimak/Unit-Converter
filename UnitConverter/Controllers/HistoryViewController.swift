//
//  HistoryViewController.swift
//  UnitConverter
//
//  Created by Ahamed Shimak on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var equationElements: [Any] = []
    private let historyDetailSegue = "historyDetailSegue"
    
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
        var val: [Any]?
        switch sender.selectedSegmentIndex {
        case 0:
            val = EquationsStoreManager.retrieve(object: Equations.Weight.self)?.elements()
        case 1:
            val = EquationsStoreManager.retrieve(object: Equations.Temperature.self)?.elements()
        case 2:
            val = EquationsStoreManager.retrieve(object: Equations.Length.self)?.elements()
        case 3:
            val = EquationsStoreManager.retrieve(object: Equations.Speed.self)?.elements()
        case 4:
            val = EquationsStoreManager.retrieve(object: Equations.Liquid.self)?.elements()
        default:
            break
        }
        
        equationElements = val ?? []
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == historyDetailSegue {
            if let nextViewController = segue.destination as? HistoryDetailViewController {
                let equation = equationElements[tableview.indexPathForSelectedRow!.row]
                let equationDic = (equation as! Encodable).equationDictionary
                
                nextViewController.title = String(describing: equation).components(separatedBy: ".").last
                nextViewController.equationVals = equationDic!
            }
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equationElements.count == 0 ? 1 : equationElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < equationElements.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
            cell.titleLabel.text = String(indexPath.row)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            return cell
        }
    }
    
}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: historyDetailSegue, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

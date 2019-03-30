//
//  ConstantViewController.swift
//  UnitConverter
//
//  Created by Suwadith Srithar on 3/30/19.
//  Copyright © 2019 Ahamed Shimak. All rights reserved.
//

import UIKit

class ConstantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let equationTitles: [String] = ["Electron mass", "Proton mass", "Neutron mass", "Electric permitivitty", "Magnetic permitivitty", "Speed of light in meteres"]
    let equations: [String] = ["m_e", "m_p", "m_n", "e_0", "\\mu_0", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equationTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "constantCell", for: indexPath) as! EquationTableViewCell
        cell.updateValues(title: equationTitles[indexPath.row], equation: equations[indexPath.row])
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

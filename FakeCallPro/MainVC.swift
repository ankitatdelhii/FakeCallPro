//
//  MainVC.swift
//  FakeCallPro
//
//  Created by Ankit Saxena on 24/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var settingsTableView: UITableView!
    var settingsArray = ["Time", "Caller", "Ring & Vibration", "Voice", "Wallpaper"]
    var tempdefaultSettings = ["3 Seconds Later", "Ashish", "Opening", "Voice2", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.separatorStyle = .none
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsCell
        cell.fLabel.text = settingsArray[indexPath.row]
        cell.sLabel.text = tempdefaultSettings[indexPath.row]
        print(cell.fLabel.frame.height)
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
}
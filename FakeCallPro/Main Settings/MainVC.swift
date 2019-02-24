//
//  MainVC.swift
//  FakeCallPro
//
//  Created by Ankit Saxena on 24/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, selectTimeDelegate {

    @IBOutlet weak var settingsTableView: UITableView!
    var settingsArray = ["Time", "Caller", "Ring & Vibration", "Voice", "Wallpaper"]
    var tempdefaultSettings = ["3 Seconds Later", "Ashish", "Opening", "Voice2", ""]
    var defaultSettings = [String]()
    let cellImage = ["time", "caller", "ringtone", "voice", "wallpaper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.separatorStyle = .singleLine
        settingsTableView.tableFooterView = UIView()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsCell
        let currentIndex = indexPath.row
        cell.fLabel.text = settingsArray[currentIndex]
        cell.sLabel.text = tempdefaultSettings[currentIndex]
        cell.cellImage.image = UIImage(named: cellImage[currentIndex])
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = indexPath.row
        if currentIndex == 0{
            performSegue(withIdentifier: "timeSet", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timeSet"{
            let destinationVC = segue.destination as! TimeVC
            destinationVC.delegate = self
        }
    }
    
    func timeSelected(sTime: String) {
        tempdefaultSettings.insert(sTime, at: 0)
        settingsTableView.reloadData()
    }
}

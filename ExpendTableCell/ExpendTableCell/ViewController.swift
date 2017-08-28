//
//  ViewController.swift
//  ExpendTableCell
//
//  Created by Appinventiv Technologies on 28/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//============== TableViewOutlet==========
    @IBOutlet weak var tableView: UITableView!
//============== Variable's ==============
    let itemInList = ["Bike's"]
    let bikeArray = ["Accura","Ducati Bikes","Hero","Honda","TVS","Yamaha"]
    let bicycleArray = ["Avon","Atlas","Hero","Montra","Suncross"]
    let cars = ["Audi","BMW","Ford","Maruti"]
    var clickOnButton = false
    var cellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
    
    @IBAction func CellData(_ sender: UIButton) {
        cellIndex = sender.tag
        self.clickOnButton = !self.clickOnButton
        self.tableView.reloadSections([0], with: .automatic)
       
    }
    
    
}
//================= Extension for ViewController class ==============
//------- Method for section---------
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemInList.count
    }
//------- Method for rows -----------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.clickOnButton == false{
            return 0
        }
        return self.bikeArray.count
    }
//------ Method for assigning data in cell --------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as? CellData else{
            fatalError()
        }
        cell.cellButton.tag = indexPath.row
        cell.cellButton.isUserInteractionEnabled = false
        cell.cellButton.setTitle(bikeArray[indexPath.row], for: .normal)
        return cell
    }
//------ Method for data section header -----------
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        
        return self.itemInList[section]
        
    }
//------- Method for assigning data in cell header --------
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData") as? CellData
            else{
                fatalError()
        }
        cell.cellButton.setTitle(itemInList[section], for: .normal)
        cell.cellButton.isUserInteractionEnabled = true
        return cell.contentView
    }
//------ Hieght of header cell ----------------------------
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
// ============== Class for Cell =============
class CellData: UITableViewCell {
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var btnImage: UIImageView!
    
}



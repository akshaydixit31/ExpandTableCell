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
    let itemInList = ["Bike's","BiCycle","Car's"]
    let bikeArray = ["Accura","Ducati Bikes","Hero","Honda","TVS","Yamaha"]
    let bicycleArray = ["Avon","Atlas","Hero","Montra","Suncross"]
    let cars = ["Audi","BMW","Ford","Maruti"]
    var expandedSections : NSMutableSet = []
    var clickOnButton = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
    
    @objc func sectionTapped(_ sender: UIButton) {
        print("section Tapped")
        let section = sender.tag
        print(section)
        let shouldExpand = !expandedSections.contains(section)
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
        } else {
            expandedSections.removeAllObjects()
        }
        self.tableView.reloadData()
    }

        
}
//================= Extension for ViewController class ==============
//------- Method for section---------
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemInList.count
    }
//------- Method for assigning data in cell header --------
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        var imageView = UIImageView()
        if (expandedSections.contains(section)) {
            imageView = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 18, height: 10))
            imageView.image = UIImage(named: "down-arrow")
        } else {
            imageView = UIImageView.init(frame: CGRect(x: 10, y: 15, width: 10, height: 18))
            imageView.image = UIImage(named: "right-arrow")
        }
        
        let headerTitle = UILabel.init(frame: CGRect(x: 38, y: 4, width: 250, height: 28))
        headerTitle.text = itemInList[section]
        
        let tappedSection = UIButton.init(frame: CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerView.frame.size.height))
        tappedSection.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        tappedSection.tag = section
        
        headerView.addSubview(imageView)
        headerView.addSubview(headerTitle)
        headerView.addSubview(tappedSection)
        headerView.backgroundColor = UIColor.red
        return headerView
    }
//------ Hieght of header cell ----------------------------
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

//------- Method for rows -----------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            switch section {
            case 0:
                return bikeArray.count
            case 1:
                return bicycleArray.count
            default:
                return cars.count
            }
        } else {
            return 0
        }
    }
    
//------ Method for assigning data in cell --------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as? CellData else{
            fatalError()
        }
//    ==================
        switch indexPath.section {
        case 0:
            cell.nameLabel.text = bikeArray[indexPath.row]
            
        case 1:
            cell.nameLabel.text = bicycleArray[indexPath.row]
            
        default:
             cell.nameLabel.text = cars[indexPath.row]
            
        }
        return cell
    }


    
}
// ============== Class for Cell =============
class CellData: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    
}



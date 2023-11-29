//
//  ViewController.swift
//  TableViewEditTask
//
//  Created by Yudiz-subhranshu on 10/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var doneBtn: UIBarButtonItem!
    @IBOutlet var editBtn: UIBarButtonItem!
    var myArray = [ContactDetails]()
    let rfc = UIRefreshControl()
    var data = [ContactDetails]()
    var i = 0
    
    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        doneBtn.isHidden = true
        editBtn.isHidden = false
        ///Add data to the list
        DataAdd(fistName: "Subhranshu", lastName: "Rout", phoneNum: "7077955230", photo: "images11")
        DataAdd(fistName: "Adames", lastName: "John", phoneNum: "6370189652", photo: "images2")
        DataAdd(fistName: "Quincy Adames", lastName: "Jhon", phoneNum: "6985321470", photo: "images3")
        DataAdd(fistName: "Arthur", lastName: "Chester", phoneNum: "9635821047", photo: "images4")
        DataAdd(fistName: "Biden", lastName: "Joe", phoneNum: "7556988442", photo: "images5")
        DataAdd(fistName: "Bloomberg", lastName: "Michale", phoneNum: "7886399551", photo: "images6")
        DataAdd(fistName: "Buchanan", lastName: "James", phoneNum: "9512368740", photo: "images7")
        DataAdd(fistName: "Van Buren", lastName: "Martin", phoneNum: "8264536789  ", photo: "images8")
        DataAdd(fistName: "H.W. Bush", lastName: "George", phoneNum: "9517423680", photo: "images9")
        DataAdd(fistName: "W. Bush", lastName: "George", phoneNum: "9630125487", photo: "images1")
        DataAdd(fistName: "Cheney", lastName: "Dick", phoneNum: "9658230147", photo: "images12")
        DataAdd(fistName: "Cleveland", lastName: "Grover", phoneNum: "99635214780", photo: "images13")
        
        super.viewDidLoad()
        
        ///Setting up the refreshControl
        myTable.refreshControl = rfc
        rfc.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        myArray.sort(by: compareFunction)
    }
    
    //    To add Data to The List
    func DataAdd(fistName: String, lastName: String, phoneNum: String, photo: String) {
        let contact1 = ContactDetails(fistName: fistName, lastName: lastName, phoneNum: phoneNum, photo: photo)
        myArray.append(contact1)
    }
    
    //    Sorting The Data At List
    let compareFunction = { (person1: ContactDetails, person2: ContactDetails) -> Bool in
        return person1.fistName < person2.fistName
    }
    
    @objc func refreshData(_ sender:Any){
        if data.isEmpty {
            rfc.attributedTitle = NSAttributedString("Nothing to Restore..")
        }else {
            rfc.attributedTitle = NSAttributedString("Restoring Data..")
        }
        myArray.insert(contentsOf: data, at: i)
        myTable.reloadData()
        myArray.sort(by: compareFunction)
        data.removeAll()
        rfc.endRefreshing()
    }
    
    @IBAction func editBtnClick(_ sender: Any) {
        myTable.isEditing = !myTable.isEditing
        editBtn.isHidden = true
        doneBtn.isHidden = false
    }
    
    @IBAction func doneBtnClick(_ sender: Any) {
        myTable.isEditing = !myTable.isEditing
        editBtn.isHidden = false
        doneBtn.isHidden = true
    }
    
}

//MARK: - TableView Delegate frunctions :

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLbl.text = "\(myArray [indexPath.row].lastName) \(myArray [indexPath.row].fistName)"
        cell.mnumLbl.text = myArray [indexPath.row].phoneNum
        cell.imgLbl.image = UIImage(named: myArray[indexPath.row].photo)
        cell.imgLbl.layer.cornerRadius = cell.imgLbl.frame.width / 2
        cell.imgLbl.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.append(myArray[indexPath.row])
            myArray.remove(at: indexPath.row)
            myTable.deleteRows(at: [indexPath], with: .fade)
            myTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selectedItem = myArray[sourceIndexPath.row]
        myArray.remove(at: sourceIndexPath.row)
        myArray.insert(selectedItem, at: destinationIndexPath.row)
    }
}

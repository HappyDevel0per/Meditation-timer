//
//  TimerController.swift
//  MindSpace
//
//  Created by Maximilian Rauer on 20.02.18.
//  Copyright © 2018 Maximilian Rauer. All rights reserved.
//

import UIKit

class TimerController: UITableViewController {
    
    let cellId = "cellId"
    var timer = [String]()
    var test = ["test 1 ", "test 2", "test 3"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = test[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            timer.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
//        else if editingStyle == .insert {
//            self.timer.insert("hello", at: 0)
//                self.tableView.beginUpdates()
//                self.tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .right)
//                self.tableView.endUpdates()
//            let setTimes = SetTimerController()
//            setTimes.didSelectTime()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
        tableView.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        
        navigationItem.title = "Time"
        view.backgroundColor = UIColor(displayP3Red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let image = UIImage(named: "BackToTimer")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backToMeditationController))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        let addButton = UIImage(named: "littleAddButton")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: addButton?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(addTime))
        
    }
    
    @objc func backToMeditationController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addTheTime() {
        test.append("Test \(test.count + 1)")
        let insertIndexPath = NSIndexPath(row: test.count - 1, section: 0)
        self.tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)

    }
    
    @objc func addTime() {
//        test.append("Test \(test.count + 1)")
//        let insertIndexPath = NSIndexPath(row: test.count - 1, section: 0)
//        tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)
        let setTimer = UINavigationController(rootViewController: SetTimerController())
//        present(setTimer, animated: true, completion: nil)
        self.showDetailViewController(setTimer, sender: self)
    }
}

//
//  SetTimerController.swift
//  MindSpace
//
//  Created by Maximilian Rauer on 20.02.18.
//  Copyright © 2018 Maximilian Rauer. All rights reserved.
//

import UIKit

class SetTimerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let timerContrl = TimerController()
    var times: [[String]] = []
    let hours = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    let minutes = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    var minutesLabel = "Minutes"
    var hoursLabel = "Hours"
    let pickerView = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return times[component].count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return times[component] [row]
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: times[component] [row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedHour = hours[pickerView.selectedRow(inComponent: 0)]
        let selectedMinute = minutes[pickerView.selectedRow(inComponent: 2)]
        timerContrl.timer.append(contentsOf: ["\(selectedHour) : \(selectedMinute)"])
    }
    
    @objc func didSelectTime() {
//        timerContrl.timer.insert("gdhgd", at: 0)
//        timerContrl.test.append("Test \(test.count + 1)")
//        let insertIndexPath = NSIndexPath(row: test.count - 1, section: 0)
//        timerContrl.tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)
        timerContrl.test.append("Test \(timerContrl.test.count + 1)")
        let insertIndex = NSIndexPath(row: timerContrl.test.count, section: 0)
        timerContrl.tableView.insertRows(at: [insertIndex as IndexPath], with: .automatic)
//        timerContrl.tableView.reloadData()
//        timerContrl.view.setNeedsLayout()
//        present(timerContrl, animated: true, completion: nil)
        timerContrl.addTheTime()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func testAdd() {
        timerContrl.addTheTime()
//        DispatchQueue.main.async {
//            self.timerContrl.tableView.reloadData()
//        }
        present(timerContrl, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        times = [hours, [hoursLabel], minutes, [minutesLabel]]
        if pickerView.selectedRow(inComponent: 0) == 0 {
            hoursLabel = "Hour"
        }
        if pickerView.selectedRow(inComponent: 2) == 0 {
            minutesLabel = "Minute"
        }
        
//        pickerView.selectedRow(inComponent: 0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAddTimer))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(testAdd))
        navigationItem.title = "Add Time"
        navigationItem.rightBarButtonItem?.tintColor = UIColor(displayP3Red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        navigationItem.leftBarButtonItem?.tintColor = UIColor(displayP3Red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 280)
        view.addSubview(pickerView)
        view.backgroundColor = UIColor.black
    }
    
    @objc func cancelAddTimer() {
        self.dismiss(animated: true, completion: nil)
    }
}

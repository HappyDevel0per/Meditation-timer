//
//  MeditationController.swift
//  MindSpace
//
//  Created by Maximilian Rauer on 15.02.18.
//  Copyright © 2018 Maximilian Rauer. All rights reserved.
//

import UIKit

class MeditationController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    
    let cellId = "cellId"
    let meditation = ["Sound", "Time", "Pre-Time"]
    let hello = ["hello", "blabka"]
    var textToDisplay = String()
    var timeToDisplay = String()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = false
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        view.image = UIImage(named: "MindSpaceImage.png")
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let meditationLabel: UILabel = {
        let label = UILabel()
        let preferredDescriptor = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        var font = UIFont(name: "Papyrus", size: preferredDescriptor.pointSize)
        label.font = font
        label.text = "Your Meditation"
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableViewView: UIView = {
        let tabView = UIView()
        tabView.backgroundColor = UIColor.white
        tabView.translatesAutoresizingMaskIntoConstraints = false
        return tabView
    }()
    
    let startButton: UIButton = {
        let Button = UIButton()
        Button.layer.masksToBounds = false
        Button.layer.cornerRadius = Button.frame.size.width / 2
        Button.clipsToBounds = true
        let image = UIImage(named: "GreenStart")
        Button.setBackgroundImage(image, for: .normal)
//        Button.backgroundColor = UIColor.green
        Button.translatesAutoresizingMaskIntoConstraints = false
        return Button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(displayP3Red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        
        view.addSubview(imageView)
        view.addSubview(meditationLabel)
        view.addSubview(tableViewView)
        view.addSubview(startButton)
        
        setupImageView()
        setupMeditationLabel()
        setupTableViewView()
        setupStartButton()
        
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = meditation[indexPath.row]
        if indexPath.row == 0 {
        cell.detailTextLabel?.text = textToDisplay
        }
        if indexPath.row == 1 {
            cell.detailTextLabel?.text = timeToDisplay
        }
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let soundController = UINavigationController(rootViewController: SoundController())
            present(soundController, animated: true, completion: nil)
        }
        if indexPath.row == 1 {
            let timerController = UINavigationController(rootViewController: TimerController())
            present(timerController, animated: true, completion: nil)
        }
        
    }
    
    
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupMeditationLabel() {
        meditationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        meditationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        meditationLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        meditationLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupTableViewView() {
        tableViewView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableViewView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        tableViewView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableViewView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        tableViewView.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: tableViewView.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: tableViewView.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: tableViewView.widthAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: tableViewView.topAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(displayP3Red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setupStartButton() {
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        startButton.topAnchor.constraint(equalTo: tableViewView.bottomAnchor, constant: 80).isActive = true
    }
    
}

class UserCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 56, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 56, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        
}
}


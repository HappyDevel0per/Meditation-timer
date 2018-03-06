//
//  SoundController.swift
//  MindSpace
//
//  Created by Maximilian Rauer on 17.02.18.
//  Copyright © 2018 Maximilian Rauer. All rights reserved.
//

import UIKit
import AVFoundation

class SoundController: UITableViewController {
    
    let songs = ["Zimbel 1", "Zimbel 2", "Singingbowl", "Koshi", "Tai-Chi Gong", "Tonewood"]
    let cellId = "cellId"
    var player: AVAudioPlayer = AVAudioPlayer()
    var secondPlayer: AVAudioPlayer = AVAudioPlayer()
    var thirdPlayer: AVAudioPlayer = AVAudioPlayer()
    var fourthPlayer: AVAudioPlayer = AVAudioPlayer()
    var fifthPlayer: AVAudioPlayer = AVAudioPlayer()
    var sixthPlayer: AVAudioPlayer = AVAudioPlayer()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = songs[indexPath.row]
        cell.imageView?.image = UIImage(named: "Play")
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Zimbel 1" {
            player.play()
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Zimbel 2" {
            secondPlayer.play()
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Singingbowl" {
            thirdPlayer.play()
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Koshi" {
            fourthPlayer.play()
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Tai-Chi Gong" {
            fifthPlayer.play()
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Tonewood" {
            sixthPlayer.play()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Zimbel 1" {
            player.stop()
            player.currentTime = 0
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Zimbel 2" {
            secondPlayer.stop()
            secondPlayer.currentTime = 0
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Singingbowl" {
            thirdPlayer.stop()
            thirdPlayer.currentTime = 0
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Koshi" {
            fourthPlayer.stop()
            fourthPlayer.currentTime = 0
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Tai-Chi Gong" {
            fifthPlayer.stop()
            fifthPlayer.currentTime = 0
        }
        
        if tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text == "Tonewood" {
            sixthPlayer.stop()
            sixthPlayer.currentTime = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "Sounds"
        let image = UIImage(named: "BackAccessory")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Chose", style: .plain, target: self, action: #selector(handleShowSound))
        
        let session = AVAudioSession.sharedInstance()
        
        do
        {
            try session.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch
        {
            
        }
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "Zimbel 1" , ofType: ".mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
        do
        {
            let secondAudioPath = Bundle.main.path(forResource: "Zimbel 2", ofType: ".mp3")
            try secondPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: secondAudioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
        do
        {
            let thirdAudioPath = Bundle.main.path(forResource: "Klangschale", ofType: ".mp3")
            try thirdPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: thirdAudioPath!) as URL)
            
        }
        catch
        {
            //Error
        }
        
        do
        {
            let fourthAudioPath = Bundle.main.path(forResource: "Koshi", ofType: ".mp3")
            try fourthPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: fourthAudioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
        do
        {
            let fifthAudioPath = Bundle.main.path(forResource: "Chinesischer Gong", ofType: ".mp3")
            try fifthPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: fifthAudioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
        do
        {
            let sixthAudioPath = Bundle.main.path(forResource: "Klanghoelzer", ofType: ".mp3")
            try sixthPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sixthAudioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleShowSound() {
        
        let index = tableView.indexPathForSelectedRow
        guard let selection = index?.row else {
            return
        }
        if selection == 0 {
            player.stop()
            player.currentTime = 0
        }
        
        if selection == 1 {
            secondPlayer.stop()
            secondPlayer.currentTime = 0
        }
        
        if selection == 2 {
            thirdPlayer.stop()
            thirdPlayer.currentTime = 0
        }
        
        if selection == 3 {
            fourthPlayer.stop()
            fourthPlayer.currentTime = 0
        }
        
        if selection == 4 {
            fifthPlayer.stop()
            fifthPlayer.currentTime = 0
        }
        
        if selection == 5 {
            sixthPlayer.stop()
            sixthPlayer.currentTime = 0
        }
        
        let songSelection = songs[selection]
        let medController = MeditationController()
        medController.textToDisplay = songSelection
        present(medController, animated: true, completion: nil)
    }
}

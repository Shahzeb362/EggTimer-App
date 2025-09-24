//
//  ViewController.swift
//  EggTimer
//
//  Created by Shahzeb Khan on 08/07/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // dictionary for the hardness selection of buttons
    let eggTime = ["Soft": 300, "Medium": 600, "Hard": 720]
    
    var secondPassed = 0
    // saves the value of key
    var totalTime = 0
    
    var audioPlayer: AVAudioPlayer?
    
    var timer = Timer()

    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }



       @objc func updateCounter() {
           //example functionality
           if secondPassed <= totalTime {
               let progressPercentage = Float(secondPassed) / Float(totalTime)
               progressBar.progress = progressPercentage
               print(progressPercentage)
               secondPassed += 1
               
           } else{
               timer.invalidate()
               titleLabel.text = "Done!"
               playSound()
            }
       }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer?.play()
    }
    
}



//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Float] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timerTest : Timer?
    var totalTime = 0
    var passedSecond = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleView.text = "How do you like your eggs?"
        progressBar.progress = 0
        timerTest?.invalidate()
        let hardness = sender.currentTitle
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"])
            update(secondsRemaining: eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
            update(secondsRemaining: eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"])
            update(secondsRemaining: eggTimes["Hard"]!)
        default:
            print("Have you done something new?")
        }
    }
    
    func update (secondsRemaining: Float) {
        var totalTime = secondsRemaining
        var secondsPassed = Float(0)
        timerTest = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed < totalTime {
                print ("\(secondsPassed) seconds")
                secondsPassed += 1
                print (secondsPassed / totalTime)
                self.progressBar.progress = Float(secondsPassed / totalTime)
            } else {
                Timer.invalidate()
                self.titleView.text = "Done"
                self.playSound()
                
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}

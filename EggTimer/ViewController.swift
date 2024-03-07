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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var eggsDetials: UILabel!
    let eggTimes : [String : Int] = ["Soft" : 300, "Medium" : 420, "Hard" : 720 ]
    
    var timer = Timer()
    var totaltime  = 0
    var secondPass  = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totaltime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondPass = 0
        eggsDetials.text = hardness
        

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
    }
    @objc func updateTimer(){
           if secondPass < totaltime {
               
               secondPass += 1
               progressView.progress = Float(secondPass) / Float(totaltime)
               
            }
        else{
            eggsDetials.text = "Your egg is ready"
            playSound(soundName: "alarm_sound")
        }
        
        }
    
    func playSound(soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    

}

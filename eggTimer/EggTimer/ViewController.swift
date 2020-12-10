//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright ©️ 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondTime = 0
    var player : AVAudioPlayer!
    
    @IBOutlet weak var eggLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func EggBTN(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        progressBar.progress = 0.0
        secondTime = 0
        eggLabel.text = hardness
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(eggSelector), userInfo: nil, repeats: true)
        
    }
    
    @objc func eggSelector(){
        if secondTime < totalTime {
            secondTime += 1
            progressBar.progress = Float(secondTime) / Float(totalTime)
        }else{
            timer.invalidate()
            eggLabel.text = "Sudah selesai"
        }
    }
}

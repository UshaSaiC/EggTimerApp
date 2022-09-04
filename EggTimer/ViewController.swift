//
//  ViewController.swift
//  EggTimer
//
//  Created by Usha Sai Chintha on 04/09/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var startText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    var totalTime = 0
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func harnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle
        totalTime = eggTimes[hardness!]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        startText.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressValue = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = progressValue
        }
        else {
            timer.invalidate()
            startText.text = "Done!!!"
            playSound()
        }
    }
    
    func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}


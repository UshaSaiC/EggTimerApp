//
//  ViewController.swift
//  EggTimer
//
//  Created by Usha Sai Chintha on 04/09/22.
//

import UIKit

class ViewController: UIViewController {

    var counter = 60
    var timer = Timer()
    let eggTimes = ["Soft":3, "Medium": 4, "Hard": 7]
    
    @IBOutlet weak var startText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var progressValue: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = progressValue
        
    }

    
    @IBAction func harnessSelected(_ sender: UIButton) {
        
        //everytime button is pressed, we stop the previous timers and start it afresh
        timer.invalidate()
        progressBar.progress = progressValue
        startText.text = "How do you like your eggs?"
        let hardness = sender.currentTitle
        
        counter = eggTimes[hardness!]!
        progressValue = Float(1)/Float(counter)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        print("\(counter)")
        
    }
    
    // this function is being called continuously by timer
    @objc func updateCounter() {
        if counter > 0 {
            print("\(counter) seconds")
            progressBar.progress += progressValue
            counter -= 1
        }
        else {
            timer.invalidate()
            startText.text = "Done!!!"
        }
    }
    
}


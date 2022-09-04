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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func harnessSelected(_ sender: UIButton) {
        
        //everytime button is pressed, we stop the previous timers and start it afresh
        timer.invalidate()
        let hardness = sender.currentTitle
        
        counter = eggTimes[hardness!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        print("\(counter)")
        
    }
    
    // this function is being called continuously by timer
    @objc func updateCounter() {
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        }
        else {
            timer.invalidate()
            startText.text = "Done!!!"
        }
    }
    
}


//
//  ViewController.swift
//  EggTimer
//
//  Created by Usha Sai Chintha on 04/09/22.
//

import UIKit

class ViewController: UIViewController {

    var counter = 60
    
    let eggTimes = ["Soft":300, "Medium": 420, "Hard": 720]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func harnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        print(eggTimes[hardness!]!)
        counter = eggTimes[hardness!]!
        
        //below code basically calls updateCounter function every single second based on timeInterval value
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        // when we click on multiple buttons or eggs on ui, the timer speed increases as there is only single timer running and everytime our time is getting reduced from same timer count. So 1 time pressed -> 1 second trigger, 2 times pressed -> in a second 2 times triggered etc.,
    }
    
    //selector come from objective-c. So in order for that to work, we add @objc notation
    @objc func updateCounter() {
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        }
    }
    
}


//
//  ViewController.swift
//  EggTimer
//
//  Created by Usha Sai Chintha on 04/09/22.
//

import UIKit

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func harnessSelected(_ sender: UIButton) {
        
        // hardness is of type String?, as it could be possible for button to not have title
        let hardness = sender.currentTitle
//        switch hardness{
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
        // as hardness is of optional type, initially force unwrapping it and then the overall value wrt wrt eggTimes might be coming up. Lets say hardness returns soft instead of Soft.. in order to handle such scenrios its by default returning optional values. So, we add ! (force unwrapping) wrt return value of array
        print(eggTimes[hardness!]!)
    }
    
}


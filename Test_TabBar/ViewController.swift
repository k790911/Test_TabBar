//
//  ViewController.swift
//  Test_TabBar
//
//  Created by 김재훈 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblNumber: UILabel!
    
    @IBOutlet var btnStart: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var btnReset: UIButton!
    
    var selector: Selector = #selector(updateNumber)
    var temp: Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View controller is up.")
        
        //view.backgroundColor = UIColor.yellow
        
        lblNumber.text = "0"
        
        btnStart.isEnabled = true
        btnStop.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController will disappear.")
    }

    @IBAction func btnNoStart(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: selector, userInfo: nil, repeats: true)
            btnStart.isEnabled = false
            btnStop.isEnabled = true
        }
    }
    
    @IBAction func btnNoStop(_ sender: UIButton) {
        if let t = timer {
            t.invalidate()
            timer = nil
            btnStart.isEnabled = true
            btnStop.isEnabled = false
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        temp = 0
        lblNumber.text = "0"
    }
    
    @objc func updateNumber() {
        self.lblNumber.text = String(temp)
        temp += 1
    }
    
    deinit {
        print("ViewController is gone.")
    }
}


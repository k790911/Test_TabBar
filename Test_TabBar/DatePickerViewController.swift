//
//  ViewController.swift
//  Book1_DatePicker
//
//  Created by 김재훈 on 2022/02/03.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    //let timeSelector: Selector = #selector(ViewController.updateTime)

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var dp_datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("DatePickerView controller is up.")
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DatePickerViewController.updateTime), userInfo: nil, repeats: true)
        //self.view.backgroundColor = UIColor.yellow
        dp_datePicker.backgroundColor = UIColor.green
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a hh:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: sender.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a hh:mm EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    
    deinit {
        print("DatePickerView controller is gone.")
    }
}


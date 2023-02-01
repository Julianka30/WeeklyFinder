//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Julia on 8/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    
    @IBOutlet weak var monthTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        updateInfoAboutDay()
    }
    
    func updateInfoAboutDay() {
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateformatter.string(from: date)
        let capitalizedWeekDay = weekday.capitalized
        
        resultLabel.text = capitalizedWeekDay
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


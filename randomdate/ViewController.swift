//
//  ViewController.swift
//  randomdate
//
//  Created by Elif Tultay on 27.08.2018.
//  Copyright © 2018 eliftultay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickEvent: UIPickerView!
    
    @IBOutlet weak var pickDate: UIDatePicker!
    
    var selectedAnniversary : String!
    var pickDay: Int!
    var pickMonth: Int!
    var pickYear: Int!
    var newDate: String!
    var monthL: String!
    let anniversaries = ["Engagement", "Wedding", "Year", "First Meeting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return anniversaries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return anniversaries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return selectedAnniversary = anniversaries[row]
    }

    @IBAction func pickDateMethod(_ sender: Any) {
        let components = pickDate.calendar.dateComponents([.month, .day, .year], from: pickDate.date)
        pickDay = components.day
        pickMonth = components.month
        pickYear = components.year
    }
    
    func randomDate (day: Int, month: Int, year: Int) ->String {
        
        // Randomize the month
        let month = arc4random_uniform(12) + 1
        if month == 1{
            monthL = "January"
        }else if month == 2 {
            monthL = "February"
        }else if month == 3 {
            monthL = "March"
        }else if month == 4 {
            monthL = "April"
        } else if month == 5 {
            monthL = "May"
        } else if month == 6 {
            monthL = "June"
        } else if month == 7 {
            monthL = "July"
        } else if month == 8 {
            monthL = "August"
        } else if month == 9 {
            monthL = "September"
        } else if month == 10 {
            monthL = "October"
        } else if month == 11 {
            monthL = "November"
        } else if month == 12 {
            monthL = "December"
        }
        
        // Increase year by 1
        let year = year + 1
        // Same day
        let day = day
        
        newDate = String(day) + "/" + monthL + "/" + String(year)

        return newDate
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest : ResultCard = segue.destination  as! ResultCard
        dest.textEvent = selectedAnniversary
        
        let dayDest : ResultCard = segue.destination as! ResultCard
        dayDest.textDate = randomDate(day: pickDay, month: pickMonth, year: pickYear)
    }

    
    
}


//
//  ViewController.swift
//  tipMaker
//
//  Created by Yale Thomas on 4/13/15.
//  Copyright (c) 2015 Yale Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subTotalField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageStepper: UIStepper!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var numPeopleStepper: UIStepper!
    var tipPercent : Double=0.2
    var peopleNumber : Double=1
    var pullData : Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pullData = true
    }
    
    func setDefaults() {
        pullData = false
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultFamilyNum = defaults.integerForKey("familyNum")
        var defaultTipPercent = defaults.integerForKey("tipPercent")
        if (defaultTipPercent > 0 && defaultTipPercent <= 100) {
            tipPercentageStepper.value = (defaultTipPercent as NSNumber)
            onPercentageChanged(self)
        }
        if (defaultFamilyNum > 0 && defaultFamilyNum <= 100) {
            numPeopleStepper.value = (defaultFamilyNum as NSNumber)
            onPeopleChanged(self)
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        if (pullData) {
            self.setDefaults()
        }
        var subTotal = (subTotalField.text as NSString).doubleValue
        var tip = subTotal * tipPercent / peopleNumber
        var total = (subTotal + tip) / peopleNumber
        totalAmountLabel.text = "\(total)"
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onPercentageChanged(sender: AnyObject) {
        if (pullData) {
            self.setDefaults()
        }
        tipPercentageLabel.text = "\(tipPercentageStepper.value)%"
        tipPercent = tipPercentageStepper.value / 100
        onEditingChanged(subTotalField)
    }
    
    @IBAction func onPeopleChanged(sender: AnyObject) {
        if (pullData) {
            self.setDefaults()
        }
        numPeopleLabel.text = "\(numPeopleStepper.value)"
        peopleNumber = numPeopleStepper.value
        onEditingChanged(subTotalField)
    }
    @IBAction func settingsButton(sender: AnyObject) {
        performSegueWithIdentifier("settingsSegue", sender: self)
    }

}


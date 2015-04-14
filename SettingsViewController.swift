//
//  SettingsViewController.swift
//  tipMaker
//
//  Created by Yale Thomas on 4/13/15.
//  Copyright (c) 2015 Yale Thomas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var tipStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipStepper.value = 20
        peopleStepper.value = 1
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultFamilyNum = defaults.integerForKey("familyNum")
        var defaultTipPercent = defaults.integerForKey("tipPercent")
        if (defaultTipPercent > 0 && defaultTipPercent <= 100) {
            tipStepper.value = (defaultTipPercent as NSNumber)
            onPercentageChanged(self)
        }
        if (defaultFamilyNum > 0 && defaultFamilyNum <= 100) {
            peopleStepper.value = (defaultFamilyNum as NSNumber)
            onPeopleChanged(self)
        }
    }
    
    @IBAction func onPeopleChanged(sender: AnyObject) {
        peopleLabel.text = "\(peopleStepper.value)"
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger((peopleStepper.value as NSNumber), forKey: "familyNum")
        defaults.synchronize()
    }
    
    @IBAction func onPercentageChanged(sender: AnyObject) {
        tipLabel.text = "\(tipStepper.value)%"
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger((tipStepper.value as NSNumber), forKey: "tipPercent")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

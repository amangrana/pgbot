//
//  ViewController.swift
//  pgbot
//
//  Created by Wayne Wang on 8/21/18.
//  Copyright © 2018 Wayne Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let greenColor = UIColor(red: 0.2, green: 0.9, blue: 0.5, alpha: 1)
    let grayColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha: 1)
    let blackColor = UIColor.black
    
    func buildBox(view:UIView, number:Int, input:String){
        let label = UILabel()
        let loc = UIScreen.main.bounds.height / 5 * CGFloat(number)
        label.frame = CGRect(x: 0, y: loc,
                           width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height / 5)
        print(input)
        label.text = input
        label.textColor = blackColor
        label.layer.borderWidth = 2
        label.layer.borderColor = blackColor.cgColor
        label.layer.backgroundColor = grayColor.cgColor
        view.addSubview(label)
    }
    
    func displayBot(view: UIView, title: [String], content: [String]) {
        for i in 0...4 {
            buildBox(view:view, number:i, input:title[i]+": "+content[i])
        }
    }
    override func loadView() {
        let view = UIView()
        view.backgroundColor = greenColor
        
        displayBot(view: view, title: ["First City", "Phase 1", "Phase 2", "Phase 4", "Special"],
                   content: ["Random 0", "Random 1", "Random 2", "Random 3", "Random 4"])
        
        self.view = view
        
        
    }
}


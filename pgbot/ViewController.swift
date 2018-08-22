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
        
        // Create main view
        let mainView = UIView()
        mainView.backgroundColor = greenColor
        
        // Define a boundary to display a bot
        let botBox = CGRect(x: 0, y: 0,
                            width: UIScreen.main.bounds.width,
                            height:UIScreen.main.bounds.height*0.8)
        let botView = UIView(frame:botBox)
        // Make a bot
        makeABot(view:botView)
        mainView.addSubview(botView)
        
        // Define a boundary to display a bot
        let buttonsBox = CGRect(x: 0, y: UIScreen.main.bounds.height*0.8,
                                width: UIScreen.main.bounds.width,
                                height:UIScreen.main.bounds.height*0.2)
        let buttonsView = UIView(frame:buttonsBox)
        // Add buttons
        addAButton(view:buttonsView)
        mainView.addSubview(buttonsView)
        
        self.view = mainView
    }
    
    func random(_ n:Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    func newBot() -> [String] {
        let pha1 = ["Last Choice","Random Choice","Early Choice for All","Player's Choice","Bidding Choice","Deciding Choice"]
        let pha2 = ["Using Cheapest Resources\n(Maximum Bid: Minimum Bid + 5 Elektro)","Buys the First Choice for Minimum Bid","Supplying Most Cities\n(Maximum Bid: Minimum Bid + 10 Elektro)","Highest Number\n(Maximum Bid: Minimum Bid + # of Own Cities)","Second Smallest Number\n(Maximum Bid: Minimum Bid)","All Power Plants\n(Maximum Bid: Minimum Bid + 1 Elektro)"]
        let pha3 = ["Normal Production and Less Than 5 Elektro", "All Resources","(Last)All Resources,\nOtherwise Normal Production","Normal Production","Normal Production and Least Available Resources","Odd Turn: Normal Production,\nEven Turn: All Resources"]
        let pha4 = ["Last Player Chooses\n(Cannot Build Through Possible Cities)","All Cities\n(Never More Than First Player)","Only Supplied Cities","Step 1: All Cities, Less Than 7;\nOtherwise: All Cities Never to First Player","Step 1: 1 City, Step 2: 2 Cities, Step 3: 3 Cities","All Cities"]
        let SA = ["Game Start: Gets 100 Elektro","Phase 1: Always Last in Player Order", "Phase 2: Pays Half Bid For Power Plants","Phase 4: All Cities Cost 10 Elektro","Phase 4: Always Builds First City For 0 Elektro","Phase 5: Gets Income for +1 City"]

        let ret = [pha1[random(6)],pha2[random(6)],pha3[random(6)],pha4[random(6)],SA[random(6)]]
        return ret
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    let greenColor = UIColor(red: 0.2, green: 0.9, blue: 0.5, alpha: 1)
    let grayColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha: 1)
    let blackColor = UIColor.black
    let blueColor = UIColor.blue
    
    func buildBox(view:UIView, number:Int, input:String){
        let label = UILabel()
        let loc = view.bounds.height / 5 * CGFloat(number)
        label.frame = CGRect(x: 0, y: loc,
                           width: view.bounds.width,
                           height: view.bounds.height / 5)
        print(input)
        label.text = input
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = blackColor
        label.layer.borderWidth = 2
        label.layer.borderColor = blackColor.cgColor
        label.layer.backgroundColor = grayColor.cgColor
        view.addSubview(label)
    }
    
    func displayBot(view: UIView, title: [String], content: [String]) {
        for i in 0...4 {
            buildBox(view:view, number:i, input:title[i]+":\n"+content[i])
        }
    }
    
    func makeABot(view: UIView) {
        let content = newBot()
        let title = ["First City", "Phase 1", "Phase 2", "Phase 4", "Special"]
        displayBot(view: view, title: title, content: content)
    }
    
    @IBAction func clickButton(sender: UIButton) {
        print("Current Location button clicked!")
    }
    
    func addAButton(view: UIView) {
        let button = UIButton()
        let size = min(view.bounds.width / 6, view.bounds.height)
        button.frame = CGRect(x: view.bounds.minX, y: view.bounds.minY,
                              width: size,
                              height: size)
        button.layer.borderWidth = 4
        button.layer.borderColor = blackColor.cgColor
        button.layer.backgroundColor = blueColor.cgColor
        
        //button.addTarget(self, action: Selector(), for: .touchDown)
        view.addSubview(button)
    }
}

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
    
    func buildBox(view:UIView, number:Int, input:String){
        let label = UILabel()
        let loc = UIScreen.main.bounds.height / 5 * CGFloat(number)
        label.frame = CGRect(x: 0, y: loc,
                           width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height / 5)
        //print(input)
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
            buildBox(view:view, number:i, input:title[i]+": \n"+content[i])
        }
    }
    
    func makeABot(view: UIView) {
        let content = newBot()
        let title = ["First City", "Phase 1", "Phase 2", "Phase 4", "Special"]
        displayBot(view: view, title: title, content: content)
    }
    override func loadView() {
        let view = UIView()
        view.backgroundColor = greenColor
        /*
        displayBot(view: view, title: ["First City", "Phase 1", "Phase 2", "Phase 4", "Special"],
                   content: ["Random 0", "Random 1", "Random 2", "Random 3", "Random 4"])
        */
        makeABot(view:view)
        self.view = view
        
        
    }
}

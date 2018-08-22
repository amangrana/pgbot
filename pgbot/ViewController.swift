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
        print("hello world!!!!")
        print(newBot())
    }
    
    func random(_ n:Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    func newBot() -> [String] {
        let pha1 = ["Last Choice","Random Choice","Early Choice for All","Player's Choice","Bidding Choice","Deciding Choice"]
        let pha2 = ["Using Cheapest Resources(Maximum Bid: Minimum Bid + 5 Elektro)","Buys the First Choice for Minimum Bid","Supplying Most Cities(Maximum Bid: Minimum Bid + 10 Elektro)","Highest Number(Maximum Bid: Minimum Bid + # of Own Cities)","Second Smallest Number(Maximum Bid: Minimum Bid)","All Power Plants(Maximum Bid: Minimum Bid + 1 Elektro)"]
        let pha3 = ["Normal Production and Less Than 5 Elektro", "All Resources","(Last)All Resources, Otherwise Normal Production","Normal Production","Normal Production And Least Available Resources","Odd Turn: Normal Production, Even Turn: All Resources"]
        let pha4 = ["Last Player Chooses, Cannot Build Through Possible Cities","All Cities, Never More Than First Player","Only Supplied Cities","Step 1: All Cities, Less Than 7; Otherwise: All Cities Never to First Player","Step 1: 1 City, Step 2: 2 Cities, Step 3: 3 Cities","All Cities"]
        let SA = ["Game Start: Gets 100 Elektro","Phase 1: Always Last in Player Order", "Phase 2: Pays Half Bid For Power Plants","Phase 4: All Cities Cost 10 Elektro","Phase 4: Always Builds First City For 0 Elektro","Phase 5: Gets Income for +1 City"]

        let ret = [pha1[random(6)],pha2[random(6)],pha3[random(6)],pha4[random(6)],SA[random(6)]]
        return ret
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

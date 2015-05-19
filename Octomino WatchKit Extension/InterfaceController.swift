//
//  InterfaceController.swift
//  Octomino WatchKit Extension
//
//  Created by Michael Sepcot on 5/13/15.
//  Copyright (c) 2015 Head Down Development. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func pushRandom(index: Int) {
        self.pushControllerWithName("Random", context: [ "index" : index ])
    }

    @IBAction func buttonTapX() {
        self.pushRandom(0)
    }

    @IBAction func buttonTapA() {
        self.pushRandom(1)
    }

    @IBAction func buttonTapB() {
        self.pushRandom(2)
    }

    @IBAction func buttonTapC() {
        self.pushRandom(3)
    }

    @IBAction func buttonTapD() {
        self.pushRandom(4)
    }

    @IBAction func buttonTapE() {
        self.pushRandom(5)
    }

    @IBAction func buttonTapF() {
        self.pushRandom(6)
    }

    @IBAction func buttonTapG() {
        self.pushRandom(7)
    }

    @IBAction func buttonTapH() {
        self.pushRandom(8)
    }

    @IBAction func buttonTapJ() {
        self.pushRandom(9)
    }

    @IBAction func buttonTapK() {
        self.pushRandom(10)
    }

    @IBAction func buttonTapL() {
        self.pushRandom(11)
    }

    @IBAction func buttonTapM() {
        self.pushRandom(12)
    }

    @IBAction func buttonTapN() {
        self.pushRandom(13)
    }

    @IBAction func buttonTapO() {
        self.pushRandom(14)
    }

    @IBAction func buttonTapP() {
        self.pushRandom(15)
    }

    @IBAction func buttonTapQ() {
        self.pushRandom(16)
    }

    func pushBlock(index: Int) {
        self.pushControllerWithName("Block", context: [ "index" : index ])
    }

    @IBAction func buttonTap1() {
        self.pushBlock(0)
    }

    @IBAction func buttonTap3() {
        self.pushBlock(1)
    }

    @IBAction func buttonTap4() {
        self.pushBlock(2)
    }

    @IBAction func buttonTap5() {
        self.pushBlock(3)
    }

    @IBAction func buttonTap6() {
        self.pushBlock(4)
    }

    @IBAction func buttonTap7() {
        self.pushBlock(5)
    }

    @IBAction func buttonTap8() {
        self.pushBlock(6)
    }

    @IBAction func buttonTap10() {
        self.pushBlock(7)
    }

    @IBAction func buttonTap13() {
        self.pushBlock(8)
    }

    @IBAction func buttonTap14() {
        self.pushBlock(9)
    }

    @IBAction func buttonTap16() {
        self.pushBlock(10)
    }

    @IBAction func buttonTap17() {
        self.pushBlock(11)
    }

    @IBAction func buttonTap18() {
        self.pushBlock(12)
    }

    @IBAction func buttonTap19() {
        self.pushBlock(13)
    }

    @IBAction func buttonTap21() {
        self.pushBlock(14)
    }

}

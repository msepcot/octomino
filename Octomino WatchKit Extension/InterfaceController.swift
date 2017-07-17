//
//  InterfaceController.swift
//  Octomino WatchKit Extension
//
//  Created by Michael Sepcot on 5/13/15.
//  Copyright (c) 2015 Michael Sepcot. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    func pushRandom(_ index: Int) {
        pushController(withName: "Random", context: [ "index" : index ])
    }

    @IBAction func buttonTapX() { pushRandom(0)  }
    @IBAction func buttonTapA() { pushRandom(1)  }
    @IBAction func buttonTapB() { pushRandom(2)  }
    @IBAction func buttonTapC() { pushRandom(3)  }
    @IBAction func buttonTapD() { pushRandom(4)  }
    @IBAction func buttonTapE() { pushRandom(5)  }
    @IBAction func buttonTapF() { pushRandom(6)  }
    @IBAction func buttonTapG() { pushRandom(7)  }
    @IBAction func buttonTapH() { pushRandom(8)  }
    @IBAction func buttonTapJ() { pushRandom(9)  }
    @IBAction func buttonTapK() { pushRandom(10) }
    @IBAction func buttonTapL() { pushRandom(11) }
    @IBAction func buttonTapM() { pushRandom(12) }
    @IBAction func buttonTapN() { pushRandom(13) }
    @IBAction func buttonTapO() { pushRandom(14) }
    @IBAction func buttonTapP() { pushRandom(15) }
    @IBAction func buttonTapQ() { pushRandom(16) }

    func pushBlock(_ index: Int) {
        pushController(withName: "Block", context: [ "index" : index ])
    }

    @IBAction func buttonTap1()  { pushBlock(0)  }
    @IBAction func buttonTap3()  { pushBlock(1)  }
    @IBAction func buttonTap4()  { pushBlock(2)  }
    @IBAction func buttonTap5()  { pushBlock(3)  }
    @IBAction func buttonTap6()  { pushBlock(4)  }
    @IBAction func buttonTap7()  { pushBlock(5)  }
    @IBAction func buttonTap8()  { pushBlock(6)  }
    @IBAction func buttonTap10() { pushBlock(7)  }
    @IBAction func buttonTap13() { pushBlock(8)  }
    @IBAction func buttonTap14() { pushBlock(9)  }
    @IBAction func buttonTap16() { pushBlock(10) }
    @IBAction func buttonTap17() { pushBlock(11) }
    @IBAction func buttonTap18() { pushBlock(12) }
    @IBAction func buttonTap19() { pushBlock(13) }
    @IBAction func buttonTap21() { pushBlock(14) }

}

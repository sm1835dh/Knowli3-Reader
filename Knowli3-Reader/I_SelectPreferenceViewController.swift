//
//  I_SelectPreferenceViewController.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 5..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import UIKit

class I_SelectPreferenceViewController: UIViewController {
    var level = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(level)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.dummy()
    }
    
    func dummy() {
        println("I_SelectPreferenceViewController: dummy - 수정해야 함")
        self.performSegueWithIdentifier("preferenceToMain", sender: self)
    }

    @IBAction func pressedBarBtnNext(sender : UIBarButtonItem) {
        self.performSegueWithIdentifier("preferenceToMain", sender: self)
    }
}

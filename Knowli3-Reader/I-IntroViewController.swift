//
//  I-IntroViewController.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 5..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import UIKit

class I_IntroViewController: UIViewController {

    var activityIndicatorViewStyle: UIActivityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
    
    
    struct MainStoryboard {
        struct ViewControllerIdentifiers {
            static let listViewController = "listViewController"
            static let selectLevelViewController = "selectLevelViewController"
            static let listViewNavigationController = "listViewNavigationController"
            static let emptyViewController = "emptyViewController"
        }
        
        struct TableViewCellIdentifiers {
            static let listDocumentCell = "listDocumentCell"
        }
        
        struct SegueIdentifiers {
            static let newListDocument = "newListDocument"
        }
    }
    
    
    //var activityIndicator: UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.checkStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        IntroToSelectLevel
        println("prepareForSegue")
        
    }
    
    func goNextView() {
        println("goNextView")

        let nextViewController = self.storyboard.instantiateViewControllerWithIdentifier("selectLevelViewController") as I_SelectLevelViewController
        
        self.navigationController.pushViewController(nextViewController, animated: true)
    }
    
    func checkStatus() {

//        
        self.spinner.startAnimating()
        println("checkStatus")
        for i in 1...10{
           println(i)
        }
        self.spinner.stopAnimating()
        self.goNextView()
        
    }
    
    @IBOutlet var spinner : UIActivityIndicatorView

}

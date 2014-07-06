//
//  I_SelectLevelViewController.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 5..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import UIKit

class I_SelectLevelViewController: UIViewController {
    @IBOutlet var btnLevel1 : UIButton
    @IBOutlet var btnLevel2 : UIButton
    @IBOutlet var btnLevel3 : UIButton
    
    func initControls() {
        let image = UIImage(named: "checkbox-checked") as UIImage
        btnLevel1.setImage(image, forState: UIControlState.Selected)
        btnLevel2.setImage(image, forState: UIControlState.Selected)
        btnLevel3.setImage(image, forState: UIControlState.Selected)
    }
    
    func selectBtnLevels(num: Int){
        if 1 == num {
            if btnLevel1.selected {
                btnLevel1.selected = !btnLevel1.selected
            }else {
                btnLevel1.selected = !btnLevel1.selected
                btnLevel2.selected = !btnLevel1.selected
                btnLevel3.selected = !btnLevel1.selected
            }
        }else if 2 == num {
            if btnLevel2.selected {
                btnLevel2.selected = !btnLevel2.selected
            }else {
                btnLevel2.selected = !btnLevel2.selected
                btnLevel1.selected = !btnLevel2.selected
                btnLevel3.selected = !btnLevel2.selected
            }
        }else if 3 == num {
            if btnLevel3.selected {
                btnLevel3.selected = !btnLevel3.selected
            }else {
                btnLevel3.selected = !btnLevel3.selected
                btnLevel1.selected = !btnLevel3.selected
                btnLevel2.selected = !btnLevel3.selected
            }
        }else {
            println("unexpected input - selectBtnLevels")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.checkStatus()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "levelToPreference" {
            println("I_SelectLevelViewController: prepareForSegue - 수정해야 함")
            var destViewController = segue.destinationViewController as I_SelectPreferenceViewController
            // 수정 해야 함
            destViewController.level = 1
        }
    }
    
    func goNextView() {
        println("I_SelectLevelViewController: goNextView")

        let nextViewController = self.storyboard.instantiateViewControllerWithIdentifier("selectPreferenceViewController") as I_SelectLevelViewController
        self.navigationController.pushViewController(nextViewController, animated: true)
    }
    
    func checkStatus() {
        println("I_SelectLevelViewController: checkStatus")
        self.performSegueWithIdentifier("levelToPreference", sender: self)
    }

    @IBAction func pressedBtnLevel1(sender : UIButton) { self.selectBtnLevels(1) }
    @IBAction func pressedBtnLevel2(sender : UIButton) { self.selectBtnLevels(2) }
    @IBAction func pressedBtnLevel3(sender : UIButton) { self.selectBtnLevels(3) }
    @IBAction func pressedBarBtnNext(sender : UIBarButtonItem) {
        //값 체크 및 전달
        if btnLevel1.selected || btnLevel2.selected || btnLevel3.selected {
            self.performSegueWithIdentifier("levelToPreference", sender: self)
        }else {
            //iOS8용 코드
            var alert = UIAlertController(title: "앗! 이런!", message: "1개를 선택해 주세요.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}

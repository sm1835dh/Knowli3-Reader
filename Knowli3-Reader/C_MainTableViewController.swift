//
//  C_MainTableViewController.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 5..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import UIKit

class C_MainTableViewController: UITableViewController {
    var mainList = Array<NSDictionary>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem=nil;
        self.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.fetchKimono()
        //self.updateTimeLine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        println("count: \(self.mainList.count)")
        return self.mainList.count
        //self.mainList.count
    }


    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        var cell:C_MainTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as C_MainTableViewCell
        
//        let image = UIImage(named: "checkbox-checked") as UIImage
//        cell.contentImageView.image = image
//        cell.titleLabel.text = "title"
//        cell.contentLabel.text = "content"
        
        if 0 < mainList.count {
            var data: NSDictionary = self.mainList[indexPath.row] as NSDictionary
            
            cell.titleLabel.text = data["thumbnail"] as NSString
            cell.contentLabel.text = data["nickname"] as NSString
        }
        
//        data["grade"]
//        data["idx"]
//        data["reg_date"]
//        data["thumbnail"]
//        data["uid"]
        
        return cell
    }

    func fetchKimono() {
        println("fetchKimono")
        var urlPath = "http://54.199.215.199:8000/nb"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
    }
    
    var data: NSMutableData = NSMutableData()
    var Business: NSMutableArray = NSMutableArray()
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Recieved a new request, clear out the data object
        println("connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!)")
        self.data = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        // Append the recieved chunk of data to our data object
        println("connection(connection: NSURLConnection!, didReceiveData data: NSData!)")
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        // Request complete, self.data should now hold the resulting info
        // Convert the retrieved data in to an object through JSON deserialization
        println("connectionDidFinishLoading(connection: NSURLConnection!)")
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

        self.mainList.removeAll(keepCapacity: false)
        var myResults = jsonResult["contents"] as Array<NSDictionary>
        for tmp in myResults {
            self.mainList.append(tmp)
        }
        println("self.mainList.count: \(self.mainList.count)")
        self.tableView.reloadData()
        
        /*
        //Thread 전 테스트
        println(jsonResult)
        var results = jsonResult["contents"] as Array<NSDictionary>
        
        for test in results {
            println(test["content"])
            println(test["grade"])
            println(test["idx"])
            println(test["nickname"])
            println(test["reg_date"])
            println(test["thumbnail"])
            println(test["uid"])
        }
        */
    }
    
//    let queue = NSOperationQueue()
//    func updateTimeLine(){
//        println("updateTimeLine")
//        self.queue.addOperation(NSInvocationOperation(target: self, selector: "fetchTimeLine", object: nil))
//    }
//    
//    let serverAddress = "http://54.199.215.199:8000/nb"
//    func fetchTimeLine(){
//        println("fetchTimeLine")
//        var urlPath = serverAddress
//        var url: NSURL = NSURL(string: urlPath)
//        var request: NSURLRequest = NSURLRequest(URL: url)
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ response, data, error in /* Your code */ })
//
//    }
    
        /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  JsonTableViewController.swift
//  footballApi
//
//  Created by Ernesto Yah Lopez on 20/06/2018.
//  Copyright © 2018 UGA.yah.william. All rights reserved.
//

import UIKit
var mLista = [[ String: AnyObject]]()
var myIndex = ""
var nameLigue = ""
class JsonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let url : String = "http://api.football-data.org/v1/competitions/?season=2017"
        
        let urlRequest = URL(string:url)
        var request = URLRequest(url: urlRequest!)
        request.setValue("94ceb5b1538a4946b4bee268559e0bf0", forHTTPHeaderField: "X-Auth-Token")
        URLSession.shared.dataTask(with: request, completionHandler:{
            (data,response, error) in
            if(error != nil){
                print(error.debugDescription)
            }else{
                do{
                    mLista = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        as! [[String: AnyObject]]
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mLista.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = mLista[indexPath.row]
        cell.textLabel?.text = item["caption"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = String(describing: mLista[indexPath.row]["id"])
        nameLigue = String(describing: mLista[indexPath.row]["caption"])
        performSegue(withIdentifier: "segue", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

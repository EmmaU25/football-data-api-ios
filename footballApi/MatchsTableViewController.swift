//
//  MatchsTableViewController.swift
//  footballApi
//
//  Created by Ernesto Yah Lopez on 20/06/2018.
//  Copyright © 2018 UGA.yah.william. All rights reserved.
//

import UIKit

class MatchsTableViewController: UITableViewController {
    var val = ""
    var mLista = [[ String: AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        val = indexi
        
        let url : String = "http://api.football-data.org/v1/competitions/"+val+"/fixtures?matchday=8"
        let urlRequest = URL(string:url)
        
        URLSession.shared.dataTask(with: urlRequest!, completionHandler:{
            (data,response, error) in
            if(error != nil){
                print(error.debugDescription)
            }else{
                do{
                    let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                        self.readJSONObject(object: dictionary)
                    }
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
    
    func readJSONObject(object: [String: AnyObject]) {
        let matchs = object["fixtures"] as? [[String: AnyObject]]
        self.mLista = matchs!
        print(self.mLista)
        
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
        return self.mLista.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = self.mLista[indexPath.row]
        var BH = String(describing : item["result"]!["goalsHomeTeam"])
        var newString = BH.replacingOccurrences(of: "Optional(Optional(", with: "", options: .literal, range: nil)
        newString.remove(at: newString.index(before: newString.endIndex))
        var b = newString.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        
        var SAway = String(describing: item["result"]!["goalsAwayTeam"])
        var newS = SAway.replacingOccurrences(of: "Optional(Optional(", with: "", options: .literal, range: nil)
        newS.remove(at: newString.index(before: newString.endIndex))
        var c = newS.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        cell.textLabel?.text = "\(item["homeTeamName"]!): \(b) - \(c): \(item["awayTeamName"]!)"
      
        // Configure the cell...
        return cell
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

//
//  MenuViewController.swift
//  footballApi
//
//  Created by Ernesto Yah Lopez on 20/06/2018.
//  Copyright © 2018 UGA.yah.william. All rights reserved.
//

import UIKit
var indexi: String!
class MenuViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func btnMatchs(_ sender: Any) {
        var newString = myIndex.replacingOccurrences(of: "Optional(", with: "", options: .literal, range: nil)
        newString.remove(at: newString.index(before: newString.endIndex))
        indexi = newString
        performSegue(withIdentifier: "segueMatchs", sender: self)
    }
    
    @IBAction func btnClassement(_ sender: Any) {
        var newString = myIndex.replacingOccurrences(of: "Optional(", with: "", options: .literal, range: nil)
        newString.remove(at: newString.index(before: newString.endIndex))
        indexi = newString
        performSegue(withIdentifier: "segueClassment", sender: self)
    }
    
    
    @IBAction func btnEquipes(_ sender: Any) {
        var newString = myIndex.replacingOccurrences(of: "Optional(", with: "", options: .literal, range: nil)
        newString.remove(at: newString.index(before: newString.endIndex))
        indexi = newString
        performSegue(withIdentifier: "segueEquipes", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = myIndex
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

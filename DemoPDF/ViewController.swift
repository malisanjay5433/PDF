//
//  ViewController.swift
//  DemoPDF
//
//  Created by Sanjay Mali on 02/05/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btn(sender : UIButton){
        performSegue(withIdentifier: "Web", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Web"{
            let vc = segue.destination as! WebViewController
            vc.urlString = "https://www.tutorialspoint.com/swift/swift_tutorial.pdf"
        }
    }
}


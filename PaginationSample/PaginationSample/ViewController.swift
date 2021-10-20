//
//  ViewController.swift
//  Pagination
//
//  Created by Field Employee on 10/19/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapOnNextView(_ sender: UIButton) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: "PageView") as! PainationTableViewController
        
        present(nextView, animated: true, completion: nil)
    }
}


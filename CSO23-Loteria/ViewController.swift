//
//  ViewController.swift
//  CSO23-Loteria
//
//  Created by caua on 11/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func generateGame() {
    }
}


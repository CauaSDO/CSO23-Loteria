//
//  ViewController.swift
//  CSO23-Loteria
//
//  Created by caua on 11/01/22.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int (arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
            }
        }
    return result.sorted()
}

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!

    
    @IBOutlet weak var bt1bt: UIButton!
    @IBOutlet weak var bt1lb: UILabel!
    
    @IBOutlet weak var bt2bt: UIButton!
    @IBOutlet weak var bt2lb: UILabel!
    
    @IBOutlet weak var bt3bt: UIButton!
    @IBOutlet weak var bt3lb: UILabel!
    
    @IBOutlet weak var bt4bt: UIButton!
    @IBOutlet weak var bt4lb: UILabel!
    
    @IBOutlet weak var bt5bt: UIButton!
    @IBOutlet weak var bt5lb: UILabel!
    
    @IBOutlet weak var bt6bt: UIButton!
    @IBOutlet weak var bt6lb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers(for type: GameType) {
        lbGameType.text = type.rawValue
        var game: [Int] = []
        
        switch type{
            case .megasena:
                game = 6>-<60
                bt6bt.isHidden = false
                bt6lb.isHidden = false
            case .quina:
                game = 5>-<80
                bt6bt.isHidden = true
                bt6lb.isHidden = true
        }
        
        bt1bt.setTitle("", for: .normal)
        bt1lb.text = ("\(game[0])")
        bt2bt.setTitle("", for: .normal)
        bt2lb.text = ("\(game[1])")
        bt3bt.setTitle("", for: .normal)
        bt3lb.text = ("\(game[2])")
        bt4bt.setTitle("", for: .normal)
        bt4lb.text = ("\(game[3])")
        bt5bt.setTitle("", for: .normal)
        bt5lb.text = ("\(game[4])")
        if type == .megasena {
            bt6lb.text = ("\(game[5])")
            bt6bt.setTitle("", for: .normal)
        }
        
        
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
}


//
//  ViewController.swift
//  FunFacts
//
//  Created by HsinYuLi on 2018/7/17.
//  Copyright © 2018年 laalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLable: UILabel!
    @IBOutlet weak var assignmentLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
    let factProvider = FactProvider()
    let assignmentProvider = AssignmentProvider()
    let colorProvider = BackgroundColorProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funFactLable.text = factProvider.randomFact()
        assignmentLabel.text = assignmentProvider.randomAssignment()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFact() {
        funFactLable.text = factProvider.randomFact()
        assignmentLabel.text = assignmentProvider.randomAssignment()
        let randomColor = colorProvider.randomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor
    }
    
}


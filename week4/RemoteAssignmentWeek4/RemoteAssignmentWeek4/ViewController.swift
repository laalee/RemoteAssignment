//
//  ViewController.swift
//  RemoteAssignmentWeek4
//
//  Created by HsinYuLi on 2018/7/28.
//  Copyright © 2018年 laalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var stationIDLable: UILabel!
    @IBOutlet weak var stationNameLable: UILabel!
    @IBOutlet weak var addressLable: UILabel!
    
    let client = StationsClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentStation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentStation() {
        client.getCurrentStation() { [unowned self] currentStation, error in
            if let currentStation = currentStation {
                let viewModel = CurrentStationViewModel(model: currentStation)
                self.displayStation(using: viewModel)
            }
        }
    }
    
    func displayStation(using viewModel: CurrentStationViewModel) {
        stationIDLable.text = viewModel.stationID
        stationNameLable.text = viewModel.stationNameEn
        addressLable.text = viewModel.stationAddress
    }


}


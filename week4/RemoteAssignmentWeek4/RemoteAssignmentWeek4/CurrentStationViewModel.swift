//
//  CurrentStationViewModel.swift
//  RemoteAssignmentWeek4
//
//  Created by HsinYuLi on 2018/7/29.
//  Copyright © 2018年 laalee. All rights reserved.
//

import Foundation

struct CurrentStationViewModel {
    let stationID: String
    let stationNameEn: String
    let stationAddress: String
    
    init(model: CurrentStation) {
        self.stationID = model.StationID
        self.stationNameEn = model.StationName.En
        self.stationAddress = model.StationAddress
    }
}

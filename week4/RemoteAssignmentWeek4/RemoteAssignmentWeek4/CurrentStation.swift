//
//  StationsViewModel.swift
//  RemoteAssignmentWeek4
//
//  Created by HsinYuLi on 2018/7/28.
//  Copyright © 2018年 laalee. All rights reserved.
//

import Foundation

struct CurrentStation: Codable {
    let StationID: String
    let StationAddress: String
    let StationName: StationName
    struct StationName: Codable {
        let Zh_tw: String
        let En: String
    }
    
// Unused key
//    let StationPosition: StationPosition
//    struct StationPosition: Codable {
//        let PositionLat: Double
//        let PositionLon: Double
//    }
//    let BikeAllowOnHoliday: Bool
//    let SrcUpdateTime: String
//    let UpdateTime: String
    
}

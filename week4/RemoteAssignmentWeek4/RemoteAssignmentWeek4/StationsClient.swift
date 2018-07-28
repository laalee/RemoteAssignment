//
//  StationsClient.swift
//  RemoteAssignmentWeek4
//
//  Created by HsinYuLi on 2018/7/28.
//  Copyright © 2018年 laalee. All rights reserved.
//

import Foundation

class StationsClient {
    let assignmentURL: String = "https://stations-98a59.firebaseio.com/.json"
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias CurrentStationCompletionHandler = (CurrentStation?, Error?) -> Void
    
    func getCurrentStation(completionHandler completion: @escaping CurrentStationCompletionHandler) {
        guard let url = URL(string: assignmentURL) else {
            completion(nil, StationError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StationError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let station = try self.decoder.decode(CurrentStation.self, from: data)
                            completion(station, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, StationError.invalidData)
                    }

                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}

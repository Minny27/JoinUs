//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import UIKit

final class ScheduleTableViewModel {
    var scheduleList: [ScheduleData] = []
    
    let headers = [
        "x-api-key": "0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z"
    ]
    
    func update(scheduleInfo: ScheduleTableViewModel) {
        
    }
    
    func fetchHTMLData() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://esports-api.lolesports.com/persisted/gw/getSchedule?hl=en-US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200 else {
                print(NetworkError.invalidResponse)
                
                return
            }
            
            guard let data = data, error == nil else {
                print(NetworkError.invalidData)
                
                return
            }
            
            var scheduleData: ScheduleData?
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                scheduleData = try decoder.decode(ScheduleData.self, from: data)
            } catch {
                print(NetworkError.decodingError)
            }
            
            if scheduleData != nil {
                self.scheduleList.append(scheduleData!)
            }
        }).resume()
    }
}

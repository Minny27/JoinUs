//
//  NetworkManager.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

final class NetworkManger {
    func getScheduleData(dataType: GetDataType) {
        guard let requestUrl = dataType.url else {
            print(NetworkError.invalidUrl)
            return
        }
        
        let headers = [
            "x-api-key": "0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z"
        ]
        
        let request = NSMutableURLRequest(url: requestUrl,
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
                scheduleData = try! decoder.decode(ScheduleData.self, from: data)
//                print(scheduleData?.data)
            } catch {
                print(NetworkError.decodingError)
            }
        }).resume()
    }
}

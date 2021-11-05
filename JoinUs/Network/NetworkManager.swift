//
//  NetworkManager.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

final class NetworkManger {
    func getScheduleData(dataType: RequestScheduleType, completion: @escaping (([ReceivedScheduleModel]) -> Void)) {
        guard let requestUrl = dataType.url else {
            print(NetworkError.invalidUrl)
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer TEojr_--xhR5EpW-izivsh40DJK5yYWC9ubuzF_SzuQlYwPy7Eg"
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
            
            var scheduleData: [ReceivedScheduleModel]
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                scheduleData = try! decoder.decode([ReceivedScheduleModel].self, from: data)
                completion(scheduleData)
            } catch {
                print(NetworkError.decodingError)
            }
        }).resume()
    }
}

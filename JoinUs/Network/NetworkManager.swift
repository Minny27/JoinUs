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
            "Authorization": Storage().apiKey
        ]
        
        let request = NSMutableURLRequest(url: requestUrl,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
//        var request = URLRequest(url: requestUrl)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
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
                scheduleData = try decoder.decode([ReceivedScheduleModel].self, from: data)
                completion(scheduleData)
            } catch {
                print(NetworkError.decodingError)
            }
        }).resume()
    }
}

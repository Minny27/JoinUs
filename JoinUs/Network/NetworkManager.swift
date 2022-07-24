//
//  NetworkManager.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

final class NetworkManager {
    func getTodaySchedule(
        url: URL?,
        completion: @escaping (([ReceivedScheduleModel]) -> Void)
    ) {
        guard let requestUrl = url else {
            print(NetworkError.invalidUrl)
            return
        }
        let headers = [
            "Accept": "application/json",
            "Authorization": Storage().apiKey
        ]
        let request = NSMutableURLRequest(
            url: requestUrl,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        urlSession.dataTask(
            with: request as URLRequest,
            completionHandler: { (data, response, error) -> Void in
                guard let responseStatus = response as? HTTPURLResponse,  (200..<300).contains(responseStatus.statusCode) else {
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
                    scheduleData = try decoder.decode(
                        [ReceivedScheduleModel].self,
                        from: data
                    )
                    completion(scheduleData)
                } catch {
                    print(NetworkError.decodingError)
                }
            }
        ).resume()
    }
    
    func getMonthSchedule(
        urls: [URL?],
        completion: @escaping (([ReceivedScheduleModel]) -> Void)
    ) {
        let dispatchGroup = DispatchGroup()
        var scheduleList: [ReceivedScheduleModel] = []
        
        urls.forEach { url in
            dispatchGroup.enter()
            
            guard let requestUrl = url else {
                print(NetworkError.invalidUrl)
                return
            }
            let headers = [
                "Accept": "application/json",
                "Authorization": Storage().apiKey
            ]
            let request = NSMutableURLRequest(
                url: requestUrl,
                cachePolicy: .useProtocolCachePolicy,
                timeoutInterval: 10.0
            )
            
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let urlSession = URLSession.shared
            urlSession.dataTask(
                with: request as URLRequest,
                completionHandler: { (data, response, error) -> Void in
                    guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200 else {
                        print(NetworkError.invalidResponse)
                        return
                    }
                    guard let data = data, error == nil else {
                        print(NetworkError.invalidData)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        scheduleList += try decoder.decode([ReceivedScheduleModel].self, from: data)
                    } catch {
                        print(NetworkError.decodingError)
                    }
                    dispatchGroup.leave()
                }
            ).resume()
        }
        
        dispatchGroup.notify(queue: .global()) {
            completion(scheduleList)
        }
    }
}

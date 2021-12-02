//
//  NewsTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/26.
//

import Foundation

final class NewsTableViewModel {
    let newsList: Observable<[News]> = Observable([])
    
    var countNewsList: Int {
        return newsList.value?.count ?? 0
    }
    
    func fetchNewsData() {
        CrawlManager().crawlNews() { newsList in
            self.newsList.value = newsList.compactMap {
                News(photo: $0.photo,
                     title: $0.title,
                     etc: $0.etc
                )
            }
        }
    }
    
    func newsInfo(at index: Int) -> News? {
        return newsList.value?[index]
    }
}

//
//  MonthCollectionViewModel.swift.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/14.
//

import Foundation

final class MonthCollectionViewModel {
    let monthList: [Month] = [
        Month(month: "01월"),
        Month(month: "02월"),
        Month(month: "03월"),
        Month(month: "04월"),
        Month(month: "05월"),
        Month(month: "06월"),
        Month(month: "07월"),
        Month(month: "08월"),
        Month(month: "09월"),
        Month(month: "10월"),
        Month(month: "11월"),
        Month(month: "12월"),
    ]
    
    var countMonthList: Int {
        return monthList.count
    }
    
    func monthInfo(at index: Int) -> Month {
        return monthList[index]
    }
}

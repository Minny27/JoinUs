//
//  MonthCollectionViewModel.swift.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/14.
//

import Foundation

final class MonthCollectionViewModel {
    let monthList: [Month] = [
        Month(month: "1월"),
        Month(month: "2월"),
        Month(month: "3월"),
        Month(month: "4월"),
        Month(month: "5월"),
        Month(month: "6월"),
        Month(month: "7월"),
        Month(month: "8월"),
        Month(month: "9월"),
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

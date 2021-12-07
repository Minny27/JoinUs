//
//  Strings.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/01.
//

import Foundation

enum Strings {
    static let didDismissPopUpViewNotification = "didDismissPopUpViewNotification"
    static let leagueStandingsSelector = "#mw-content-text > div.mw-parser-output > div.mw-parser-output > div.inline-content > div.standings-outer-div > div > table.wikitable2.standings > tbody > tr"
    static let newsSelector =  "body > div.wrap > div.page.page_sub > div.two_content > div.left_side > div > div > ul > li"
    static let newsPortalBaseUrl = "https://www.fomos.kr"
    static let newsPortalLolUrl = Strings.newsPortalBaseUrl + "/esports/news_list?news_cate_id=13"
}

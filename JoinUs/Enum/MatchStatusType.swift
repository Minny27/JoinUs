//
//  File.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/08.
//

import Foundation
import UIKit

enum MatchStatusType: String {
    case finished = "finished"
    case running = "running"
    case notStarted = "not_started"
    case canceled = "canceled"
    
    func convertKorean() -> String {
        switch self {
        case .finished:
            return "종료"
        case .running:
            return "LIVE"
        case .notStarted:
            return "예정"
        case .canceled:
            return "취소"
        }
    }
    
    func statusColor() -> UIColor {
        switch self {
        case .finished:
            return .systemGray
        case .running:
            return .red
        case .notStarted:
            return .systemGray
        case .canceled:
            return .systemGray
        }
    }
}

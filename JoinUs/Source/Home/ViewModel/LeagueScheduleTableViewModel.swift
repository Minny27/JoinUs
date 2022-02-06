//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import Foundation

final class LeagueScheduleTableViewModel {
    private let dateFormatter = DateFormatter()
    var todayScheduleList: Observable<[LeagueScheduleTableViewCellModel]> = Observable([])
    var monthScheduleList: Observable<[LeagueScheduleTableViewCellModel]> = Observable([])
    var dayOfMonthSchedule: [String: [LeagueScheduleTableViewCellModel]] = [:]
    var leagueType: RequestLeagueType
    var hasTodayData: Bool = true
    var hasMonthData: Bool = true
    
    var countTodayScheduleList: Int {
        return todayScheduleList.value?.count ?? 0
    }
    
    var countMonthScheduleList: Int {
        return monthScheduleList.value?.count ?? 0
    }
    
    init(leagueType: RequestLeagueType) {
        self.leagueType = leagueType
    }
    
    func todayScheduleInfo(at index: Int) -> LeagueScheduleTableViewCellModel? {
        return todayScheduleList.value?[index]
    }
    
    func monthScheduleInfo(at index: Int) -> LeagueScheduleTableViewCellModel? {
        return monthScheduleList.value?[index]
    }
    
    func fetchTodayData() {
        NetworkManger().getScheduleData(scheduleUrl: self.leagueType.todayScheduleUrl) { receivedScheduleModel in
            self.todayScheduleList.value = receivedScheduleModel.compactMap({ schedule in
                self.extractScehduleData(schedule: schedule)
            })
            
            if self.todayScheduleList.value!.count == 0 {
                self.hasTodayData = false
            }
        }
    }
    
    func fetchMonthData() {
        NetworkManger().getScheduleData(scheduleUrl: self.leagueType.totalScheduleUrl) { receivedScheduleModel in
            self.monthScheduleList.value = receivedScheduleModel.compactMap({ schedule in
                self.extractScehduleData(schedule: schedule)
            })
            
            if let monthSechduleList = self.monthScheduleList.value {
                monthSechduleList.sorted { ($1.date, $0.time) < ($0.date, $1.time) }.forEach {
                    if self.dayOfMonthSchedule[$0.date] == nil {
                        self.dayOfMonthSchedule[$0.date] = [$0]
                    }
                        
                    else {
                        self.dayOfMonthSchedule[$0.date]!.append($0)
                    }
                }
            }
            
            if self.monthScheduleList.value!.count == 0 {
                self.hasMonthData = false
            }
        }
    }
    
    func extractScehduleData(schedule: ReceivedScheduleModel) -> LeagueScheduleTableViewCellModel {
        let leagueImage = schedule.league.imageUrl
        let league = schedule.league.name
        let date = self.dateFormatter.dateToString(
            date: schedule.scheduledAt,
            dateFormat: .date
        )
        let time = self.dateFormatter.dateToString(
            date: schedule.scheduledAt,
            dateFormat: .time
        ).replacingOccurrences(of: "-", with: ":")
        let status = schedule.status
        let versus = schedule.status == "not_started" ? "vs" :":"
        let homeTeamId = schedule.opponents[0].opponent.id
        let homeTeam = getTeam(totalName: schedule.name).homeTeam
        let homeTeamImageUrl = URL(string: schedule.opponents[0].opponent.imageUrl)!
        let awayTeamId = schedule.opponents[1].opponent.id
        let awayTeam = getTeam(totalName: schedule.name).awayTeam
        let awayTeamImageUrl = URL(string: schedule.opponents[1].opponent.imageUrl)!
        var homeTeamWinCount = 0
        var awayTeamWinCount = 0
        let winnerId = schedule.winnerId
        
        // status: - finished, running, not_started
        if status != "not_started" {
            for index in 0..<schedule.games.count {
                if schedule.opponents[0].opponent.id == schedule.games[index].winner.id {
                    homeTeamWinCount += 1
                }
                
                else if schedule.opponents[1].opponent.id == schedule.games[index].winner.id {
                    awayTeamWinCount += 1
                }
            }
        }
        
        let scheduleTableViewCellModel = LeagueScheduleTableViewCellModel(
            leagueImage: leagueImage,
            league: league,
            date: date,
            time: time,
            status: status,
            versus: versus,
            homeTeamId: homeTeamId,
            homeTeam: homeTeam,
            homeTeamImageUrl: homeTeamImageUrl,
            awayTeamId: awayTeamId,
            awayTeam: awayTeam,
            awayTeamImageUrl: awayTeamImageUrl,
            homeTeamWinCount: homeTeamWinCount,
            awayTeamWinCount: awayTeamWinCount,
            winnerId: winnerId
        )
        
        return scheduleTableViewCellModel
    }
    
    func getTeam(totalName: String) -> (homeTeam: String, awayTeam: String) {
        let nameArray1 = totalName.components(separatedBy: ":")
        let nameArray2 = nameArray1[nameArray1.count - 1].components(separatedBy: "vs")
        let homeTeam = nameArray2[0].replacingOccurrences(of: " ", with: "")
        let awayTeam = nameArray2[1].replacingOccurrences(of: " ", with: "")
        
        return (homeTeam, awayTeam)
    }
}

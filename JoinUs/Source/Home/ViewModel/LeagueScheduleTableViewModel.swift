//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import Foundation

final class LeagueScheduleTableViewModel {
    private let dateFormatter = DateFormatter()
    private let thisYear = DateFormatter().dateToString(date: Date(), dateFormat: .year)
    private var urls: [URL] = []
    private var monthlySetOfDate: [Set<String>] = Array(repeating: Set<String>(), count: 13)
    private var leagueType: RequestLeagueType
    
    var todayScheduleList: Observable<[LeagueScheduleTableViewCellModel]> = Observable([])
    var monthlyScheduleList: Observable<[[LeagueScheduleTableViewCellModel]]> = Observable(Array(repeating: [LeagueScheduleTableViewCellModel](), count: 13))
    var hasTodayData: Bool = true
    var hasMonthData: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true]
    
    var countTodayScheduleList: Int {
        return todayScheduleList.value?.count ?? 0
    }
    
    init(leagueType: RequestLeagueType) {
        self.leagueType = leagueType
    }
    
    func countMonthlyScheduleList(month: Int) -> Int {
        return monthlyScheduleList.value?[month].count ?? 0 + monthlySetOfDate[month].count
    }
    
    func todayScheduleInfo(at index: Int) -> LeagueScheduleTableViewCellModel? {
        return todayScheduleList.value?[index]
    }
    
    func monthScheduleInfo(month: Int, index: Int) -> LeagueScheduleTableViewCellModel? {
        return monthlyScheduleList.value?[month][index]
    }
    
    func fetchTodayData() {
        NetworkManager().getTodaySchedule(url: leagueType.todayScheduleUrl) { receivedScheduleModel in
            self.todayScheduleList.value = receivedScheduleModel.compactMap({ schedule in
                self.extractScehduleData(schedule: schedule)
            })
            
            if self.todayScheduleList.value!.count == 0 {
                self.hasTodayData = false
            }
        }
    }
    
    func fetchMonthData() {
        setUrls()
        NetworkManager().getMonthSchedule(urls: urls) { receivedScheduleModel in
            for schedule in receivedScheduleModel.sorted(by: {
                $0.originalScheduledAt < $1.originalScheduledAt }) {
                
                let schedule = self.extractScehduleData(schedule: schedule)
                
                if self.thisYear != schedule.year {
                    continue
                }
                
                let month = Int(schedule.month)!
                
                if !self.monthlySetOfDate[month].contains(schedule.date) {
                    self.monthlySetOfDate[month].insert(schedule.date)
                    self.monthlyScheduleList.value?[month].append(schedule)
                    self.monthlyScheduleList.value?[month].append(schedule)
                }
                
                else {
                    self.monthlyScheduleList.value?[month].append(schedule)
                }
            }
            
            for month in 1..<13 {
                if self.monthlyScheduleList.value![month].count <= 0 {
                    self.hasMonthData[month] = false
                }
            }
        }
    }
    
    func extractScehduleData(schedule: ReceivedScheduleModel) -> LeagueScheduleTableViewCellModel {
        let leagueImage = schedule.league.imageUrl
        let league = schedule.league.name
        let year = dateFormatter.dateToString(
            date: schedule.originalScheduledAt,
            dateFormat: .year
        )
        let month = dateFormatter.dateToString(
            date: schedule.originalScheduledAt,
            dateFormat: .month
        )
        let date = dateFormatter.dateToString(
            date: schedule.originalScheduledAt,
            dateFormat: .date
        )
        let time = dateFormatter.dateToString(
            date: schedule.originalScheduledAt,
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
            year: year,
            month: month,
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
    
    func setUrls() {
        // page 1
        RequestLeagueType.pageNumber = "1"
        urls.append(leagueType.totalScheduleUrl!)
        
        // page 2
        RequestLeagueType.pageNumber = "2"
        urls.append(leagueType.totalScheduleUrl!)
    }
}

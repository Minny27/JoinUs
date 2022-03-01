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
                
                if let schedule = self.extractScehduleData(schedule: schedule) {
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
            }
            
            for month in 1..<13 {
                if self.monthlyScheduleList.value![month].count <= 0 {
                    self.hasMonthData[month] = false
                }
            }
        }
    }
    
    func extractScehduleData(schedule: ReceivedScheduleModel) -> LeagueScheduleTableViewCellModel? {
        guard let leagueImage = schedule.league?.imageUrl else { return nil }
        guard let league = schedule.league?.name else { return nil }
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
        guard let status = schedule.status else { return nil }
        let versus = status == "not_started" ? "vs" :":"
        guard let opponents = schedule.opponents else { return nil }; if opponents.count < 2 { return nil }
        let homeTeamId = opponents[0].opponent.id
        guard let homeTeam = getTeam(totalName: schedule.name)?.homeTeam else { return nil }
        guard let homeTeamImageUrlString = schedule.opponents?[0].opponent.imageUrl else { return nil }
        guard let homeTeamImageUrl = URL(string: homeTeamImageUrlString) else { return nil }
        let awayTeamId = opponents[1].opponent.id
        guard let awayTeam = getTeam(totalName: schedule.name)?.awayTeam else { return nil }
        guard let awayTeamImageUrlString = schedule.opponents?[1].opponent.imageUrl else { return nil }
        guard let awayTeamImageUrl = URL(string: awayTeamImageUrlString) else { return nil }
        let winnerId = schedule.winnerId
        var homeTeamWinCount = 0
        var awayTeamWinCount = 0
        
        // status: - finished, running, not_started
        if status != "not_started" {
            for index in 0..<schedule.games.count {
                if let winner = schedule.games[index].winner {
                    if let winnerId = winner.id {
                        if homeTeamId == winnerId {
                            homeTeamWinCount += 1
                        }
                        
                        else if awayTeamId == winnerId {
                            awayTeamWinCount += 1
                        }
                    }
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
    
    func getTeam(totalName: String?) -> (homeTeam: String, awayTeam: String)? {
        guard let totalName = totalName else { return nil }
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

//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import Foundation

final class LeagueScheduleTableViewModel {
    private let dateFormatter = DateFormatter()
    private let pageNumberList: [String] = ["1", "2"]
    private var leagueType: RequestLeagueType
    private var numberOfMonthlyMatches: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    private var setOfDate: [String: Set<String>] = [
        "01": Set<String>(), "02": Set<String>(), "03": Set<String>(), "04": Set<String>(),
        "05": Set<String>(), "06": Set<String>(), "07": Set<String>(), "08": Set<String>(),
        "09": Set<String>(), "10": Set<String>(), "11": Set<String>(), "12": Set<String>()
    ]
    
    var todayScheduleList: Observable<[LeagueScheduleTableViewCellModel]> = Observable([])
    var monthScheduleList: Observable<[LeagueScheduleTableViewCellModel]> = Observable([])
    var monthlySchedule: Observable<[String: [LeagueScheduleTableViewCellModel]]> = Observable([
        "01": [LeagueScheduleTableViewCellModel](), "02": [LeagueScheduleTableViewCellModel](),
        "03": [LeagueScheduleTableViewCellModel](), "04": [LeagueScheduleTableViewCellModel](),
        "05": [LeagueScheduleTableViewCellModel](), "06": [LeagueScheduleTableViewCellModel](),
        "07": [LeagueScheduleTableViewCellModel](), "08": [LeagueScheduleTableViewCellModel](),
        "09": [LeagueScheduleTableViewCellModel](), "10": [LeagueScheduleTableViewCellModel](),
        "11": [LeagueScheduleTableViewCellModel](), "12": [LeagueScheduleTableViewCellModel]()
    ])
    var hasTodayData: Bool = true
    var hasMonthData: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true]
    
    var countTodayScheduleList: Int {
        return todayScheduleList.value?.count ?? 0
    }
    
    init(leagueType: RequestLeagueType) {
        self.leagueType = leagueType
    }
    
    func countMonthlyScheduleList(month: String) -> Int {
        return monthlySchedule.value?[month]!.count ?? 0 + numberOfMonthlyMatches[Int(month)!]
    }
    
    func todayScheduleInfo(at index: Int) -> LeagueScheduleTableViewCellModel? {
        return todayScheduleList.value?[index]
    }
    
    func monthScheduleInfo(month: String, index: Int) -> LeagueScheduleTableViewCellModel? {
        return monthlySchedule.value?[month]![index]
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
        let todayYear = dateFormatter.dateToString(date: Date(), dateFormat: .year)
        
        self.pageNumberList.forEach { pageNumber in
            RequestLeagueType.pageNumber = pageNumber
            NetworkManger().getScheduleData(scheduleUrl: self.leagueType.totalScheduleUrl) { receivedScheduleModel in
                self.monthScheduleList.value = receivedScheduleModel.compactMap({ schedule in
                    self.extractScehduleData(schedule: schedule)
                }).sorted(by: { ($0.date, $0.time) < ($1.date, $1.time) })
                
                for schedule in self.monthScheduleList.value! {
                    if todayYear != schedule.year {
                        break
                    }
                    
                    // 경기가 있는 월에 경기수 증가 시키기
                    let month = Int(schedule.month)!
                    self.numberOfMonthlyMatches[month] += 1
                    
                    // 월별 경기 넣기
                    if self.setOfDate[schedule.month]!.contains(schedule.date) {
                        self.monthlySchedule.value![schedule.month]!.append(schedule)
                    }
                    
                    else {
                        self.setOfDate[schedule.month]!.insert(schedule.date)
                        self.monthlySchedule.value![schedule.month]!.append(schedule)
                        self.monthlySchedule.value![schedule.month]!.append(schedule)
                    }
                }
                
//                print(self.numberOfMonthlyMatches)
//                print(self.monthlySchedule.value!["02"])
                // 월마다 데이터가 없으면 해당 월 false
                self.monthlySchedule.value?.forEach({ key, value in
                    if self.monthlySchedule.value![key]!.count <= 0 {
                        self.hasMonthData[Int(key)!] = false
                        print("\(key): \(self.hasMonthData[Int(key)!])")
                    }
                })
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
}

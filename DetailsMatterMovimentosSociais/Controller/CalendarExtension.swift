//
//  CalendarExtension.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

extension DescricaoMovimentoViewController {
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {

        guard
            let numberOfDaysInMonth = calendar.range(
                of: .day,
                in: .month,
                for: baseDate)?.count,
            let firstDayOfMonth = calendar.date(
                from: calendar.dateComponents([.year, .month], from: baseDate))
        else {
         
            throw CalendarDataError.metadataGeneration
        }
        
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday)
    }
    
    func generateDaysInMonth(for baseDate: Date) -> [Day] {
      // 2
      guard let metadata = try? monthMetadata(for: baseDate) else {
        preconditionFailure("An error occurred when generating the metadata for \(baseDate)")
      }

      let numberOfDaysInMonth = metadata.numberOfDays
      let offsetInInitialRow = metadata.firstDayWeekday
      let firstDayOfMonth = metadata.firstDay

      // 3
      var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow))
        .map { day in
          // 4
          let isWithinDisplayedMonth = day >= offsetInInitialRow
          // 5
          let dayOffset =
            isWithinDisplayedMonth ?
            day - offsetInInitialRow :
            -(offsetInInitialRow - day)

          // 6
          return generateDay(
            offsetBy: dayOffset,
            for: firstDayOfMonth,
            isWithinDisplayedMonth: isWithinDisplayedMonth)
        }

      days += generateStartOfNextMonth(using: firstDayOfMonth)

      return days
    }

    // 7
    func generateDay(
      offsetBy dayOffset: Int,
      for baseDate: Date,
      isWithinDisplayedMonth: Bool
    ) -> Day {
      let date = calendar.date(
        byAdding: .day,
        value: dayOffset,
        to: baseDate)
        ?? baseDate

      return Day(
        date: date,
        number: dateFormatter.string(from: date),
        hasEvent: datas.contains(date) ? true : false,
        isWithinDisplayedMonth: isWithinDisplayedMonth
      )
    }

    // 1
    func generateStartOfNextMonth(
      using firstDayOfDisplayedMonth: Date
      ) -> [Day] {
      // 2
      guard
        let lastDayInMonth = calendar.date(
          byAdding: DateComponents(month: 1, day: -1),
          to: firstDayOfDisplayedMonth)
        else {
          return []
      }

      // 3
      let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth)
      guard additionalDays > 0 else {
        return []
      }

      // 4
      let days: [Day] = (1...additionalDays)
        .map {
          generateDay(
          offsetBy: $0,
          for: lastDayInMonth,
          isWithinDisplayedMonth: false)
        }

      return days
    }

    enum CalendarDataError: Error {
        case metadataGeneration
    }
    
}

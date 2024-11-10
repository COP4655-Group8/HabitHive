//
//  HabitResponse.swift
//  HabitHive
//
//  Created by Anthony Irizarry on 11/10/24.
//

import Foundation

struct HabitResponse: Codable, Hashable {
    var responseData: ResponseData
    
    struct ResponseData: Codable, Identifiable, Hashable {
        var id: UUID {
            UUID()
        }
        var description: String
        var frequency: String
    }
}

extension HabitResponse {
    static let mockedHabits: [HabitResponse.ResponseData] = [
        "Make my bed in the morning",
        "Full body stretches"
    ].enumerated().map { index, description in
        HabitResponse.ResponseData(description: description, frequency: "Sample frequency")
    }
}

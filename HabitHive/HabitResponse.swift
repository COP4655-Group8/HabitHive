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

//--------------------------
// Mock habits for testing
extension HabitResponse {
    
    static let mockedHabits: [HabitResponse.ResponseData] = [
        HabitResponse.ResponseData(description: "Make my bed in the morning", frequency: "Daily"),
        HabitResponse.ResponseData(description: "Full body stretches", frequency: "Every morning"),
        HabitResponse.ResponseData(description: "Drink 8 glasses of water", frequency: "Daily"),
        HabitResponse.ResponseData(description: "Read for 20 minutes", frequency: "Daily"),
        HabitResponse.ResponseData(description: "Exercise", frequency: "Monday, Wednesday, Friday"),
        HabitResponse.ResponseData(description: "Practice meditation", frequency: "Sunday evening")
    ]
}

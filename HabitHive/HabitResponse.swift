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
        var id: String // Now using String to store Firestore document ID
        var description: String
        var frequency: String
    }
}



//
//  Model.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI

//Model for Card
struct PitchData: Identifiable {
    let id = UUID().uuidString
    var companyName: String
    var pitchProblem: String
    var pitchSolution: String
    var pitchInvest:Int
    
}


//Model for Chart

struct Deal: Identifiable {
    let id = UUID()
    let totalInvest: Double
    let roi: Double
}


//
//  Model.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI


struct PitchData: Identifiable {
    let id = UUID().uuidString
    var companyName: String
    var pitchProblem: String
    var pitchSolution: String
    var pitchInvest:Int
    
}

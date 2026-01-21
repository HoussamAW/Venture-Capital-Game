//
//  ViewModel.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI
import Observation

@Observable
final class VCViewModel {
    var index = 0
    var totalInvest = 0
    var isEnd = false
    var offset: CGSize = .zero
    var showGame = false
    var restartGame = false
    var startup = [
        PitchData(companyName: "ClinicalFlow",
                  pitchProblem:  "Clinics are overwhelmed, staff is expensive.",
                  pitchSolution: "We automate patient intake and billing for small clinics in under 10 minutes.",
                  pitchInvest: 500),
        PitchData(companyName: "ShelfSense",
                  pitchProblem: "convenience stores, small chains.",
                  pitchSolution: "AI that predicts retail stockouts 7 days early using POS + local demand signals",
                  pitchInvest: 750),
        PitchData(companyName: "DevProof",
                  pitchProblem: "hiring teams pay per candidate",
                  pitchSolution: "We verify developers’ skills with real repo-based tests instead of fake coding screens",
                  pitchInvest: 1)
    ]
}

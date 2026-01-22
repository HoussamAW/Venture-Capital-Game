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
    var restartGame = false
    var offset: CGSize = .zero
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
    
    func endGame() {
        //        index = (index + 1) % vm.startup.count
        if index < startup.count - 1 {
            index += 1
        } else {
            isEnd = true
        }
    }
    
    func invest() {
        let invest = startup[index]
        totalInvest += invest.pitchInvest
    }

    func swipe() {
        let swipeThreshold: CGFloat = 140
        if offset.width > swipeThreshold {
            offset = CGSize(width: 1000, height: 0)
       
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 200_000_000)
                invest()
                endGame()
                offset = .zero
            }
            
        } else if offset.width < -swipeThreshold {
            offset = CGSize(width: -1000, height: 0)
            
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 200_000_000)
                endGame()
                offset = .zero
            }
            
        } else {
            offset = .zero
        }
    }
}

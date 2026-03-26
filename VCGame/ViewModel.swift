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
    let swipeThreshold: CGFloat = 140
    var backgroundColor : Color {
        if offset.width > 0 {
            return .green
        } else if offset.width < 0 {
            return .red
        }
        return .clear
    }
    var startup = [
        PitchData(
            companyName: "MedBrief",
            pitchProblem: "Doctors lose time writing clinical notes and patient summaries after every consultation.",
            pitchSolution: "An AI copilot that turns doctor-patient conversations into structured notes, visit summaries, and billing-ready documentation in under 30 seconds.",
            pitchInvest: 750
        ),
        PitchData(
            companyName: "DockMind",
            pitchProblem: "Small import/export businesses waste hours chasing shipping documents, customs forms, and supplier emails.",
            pitchSolution: "A workflow platform that automatically collects, verifies, and organizes shipping documents from emails, PDFs, and portals in one shared dashboard.",
            pitchInvest: 600
        ),
        PitchData(
            companyName: "GridPulse",
            pitchProblem: "Commercial buildings pay high energy bills because HVAC systems react too late to real occupancy and weather changes.",
            pitchSolution: "Software that predicts building energy demand in real time and automatically adjusts HVAC settings to cut costs without reducing comfort.",
            pitchInvest: 1200
        ),
        PitchData(
            companyName: "ClaimPilot",
            pitchProblem: "Insurance brokers spend too much time manually reviewing claims, missing documents, and policy details.",
            pitchSolution: "An AI claims assistant that reads incoming files, flags missing information, and drafts next-step recommendations for human brokers.",
            pitchInvest: 900
        ),
        PitchData(
            companyName: "FieldFix",
            pitchProblem: "Construction teams still manage site issues with scattered WhatsApp messages, phone photos, and spreadsheets.",
            pitchSolution: "A mobile-first platform that turns site photos and voice notes into trackable tasks, incident reports, and daily progress logs.",
            pitchInvest: 800
        ),
        PitchData(
            companyName: "HireLoop",
            pitchProblem: "Growing startups lose top candidates because scheduling, feedback, and interview follow-up are painfully slow.",
            pitchSolution: "Recruiting software that automates interview coordination, collects scorecards instantly, and alerts teams when a candidate is about to drop off.",
            pitchInvest: 700
        ),
        PitchData(
            companyName: "ShelfSignal",
            pitchProblem: "Independent grocery stores run out of popular products because they cannot forecast demand accurately.",
            pitchSolution: "A lightweight forecasting tool that combines sales history, weather, and local events to predict stockouts before they happen.",
            pitchInvest: 650
        ),
        PitchData(
            companyName: "DevLedger",
            pitchProblem: "Finance teams at software companies struggle to understand engineering spend across projects, contractors, and cloud usage.",
            pitchSolution: "A finance analytics tool that maps payroll, vendor invoices, and infrastructure costs directly to engineering projects and product teams.",
            pitchInvest: 1100
        )
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


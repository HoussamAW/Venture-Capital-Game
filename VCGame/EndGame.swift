//
//  EndGame.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI
import Charts

struct EndGame: View {
    let vm: VCViewModel
    var deals: [Deal] {
        [Deal(totalInvest: Double(vm.totalInvest), roi: Double(vm.totalInvest))]
    }
    var body: some View {
        Chart3D(deals) { d in
            PointMark(
                x: .value("Total Invest", d.totalInvest),
                y: .value("ROI", d.roi))
        }
        .chartXAxisLabel("Total Invest")
        .chartYAxisLabel("ROI")
    }
}
#Preview {
    let VM = VCViewModel()
    EndGame(vm:VM)
}

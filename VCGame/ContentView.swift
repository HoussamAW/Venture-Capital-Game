//
//  ContentView.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var vm = VCViewModel()
    var body: some View {
        if vm.isEnd == true {
            EndGame(vm: vm)
        } else {
            ZStack(spacing: 40) {
                let pitch = vm.startup[vm.index]
             
//                HStack(spacing: 20) {
//                    Spacer()
//                    Image(systemName: "xmark.circle.fill")
//                        .padding(20)
//                        .background(Color.red.opacity(0.5))
//                        .cornerRadius(20)
//                        .glassBackgroundEffect()
//                        .background(Circle())
//                        .offset(x: -180)
//
//                    Spacer()
//
//
//                    Image(systemName: "dollarsign.circle.fill")
//                            .padding(20)
//                            .background(Color.green.opacity(0.4))
//                            .cornerRadius(20)
//                            .glassBackgroundEffect()
//                            .offset(x: 180)
//
//
//                    Spacer()
//
//                }
        
                VStack {
                    Text(pitch.companyName)
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(10)
                        .padding(.bottom,20)
                    
                    Text("Problem: \(pitch.pitchProblem)")
                        .padding()
                    Text(pitch.pitchSolution)
                        .padding()
                    Text("Ask: $\(pitch.pitchInvest)M for 7%")
                        .padding()
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                .frame(width: 400, height: 500)
                .background(vm.backgroundColor.opacity(0.2))
                .glassBackgroundEffect()
                .offset(x: vm.offset.width, y: vm.offset.height)
                .offset(z: -850)
                .offset(y: -2000)
                .rotationEffect(.degrees(Double(vm.offset.width / 20)))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            vm.offset = value.translation
                        }
                        .onEnded { _ in
                            vm.swipe()
                        }
                )
                .animation(.spring(response: 0.35, dampingFraction: 0.75), value: vm.offset)
                 

                Spacer()
            }
        }
    }
    
    private struct EndGame: View {
        let vm: VCViewModel
        var metrics: [PitchMetric] {
            [
                PitchMetric(title: "Invested", value: Double(vm.totalInvest)),
                PitchMetric(title: "ROI", value: Double(vm.roi)),
                PitchMetric(title: "Rounds", value: Double(vm.index + 1))
            ]
        }
        var body: some View {
            if vm.restartGame {
                ContentView()
            } else  {
                VStack(spacing: 24) {
                    Text("Fund Summary")
                        .font(.title.bold())

                    Chart(metrics) { metric in
                        BarMark(
                            x: .value("Metric", metric.title),
                            y: .value("Value", metric.value)
                        )
                        .annotation(position: .top) {
                            Text("\(Int(metric.value))")
                                .font(.caption)
                        }
                    }
                    .frame(width: 600, height: 420)
                    .padding()
                    .glassBackgroundEffect()

                    Button {
                        vm.restartGame = true
                    } label: {
                        Text("Start game again")
                            .padding()
                            .background(Color.brown.opacity(0.5))
                            .glassBackgroundEffect()
                            .padding()
                    }
                    .buttonStyle(.plain)
                }
                .offset(x: vm.offset.width, y: vm.offset.height)
                .offset(z: -850)
                .offset(y: -2000)
                
            }
        }
    }
}


#Preview(windowStyle: .plain) {
    ContentView()
}

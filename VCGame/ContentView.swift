//
//  ContentView.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI


struct ContentView: View {
    @State private var vm = VCViewModel()
    var body: some View {
        if vm.isEnd == true {
            EndGame(vm: vm)
        } else {
            VStack(spacing: 40) {
                let pitch = vm.startup[vm.index]
                Spacer()
                HStack(spacing: 20) {
//                    Image(systemName: "xmark.circle.fill")
//                        .padding(20)
//                        .background(Color.red.opacity(0.5))
//                        .cornerRadius(20)
//                        .glassBackgroundEffect()
//                        .background(Circle())
//                        .offset(x:-80)
                    VStack {
                        Text(pitch.companyName)
                            .font(.title)
                            .foregroundStyle(.brown)
                            .bold()
                            .padding(10)
                            .glassBackgroundEffect()
                            .padding(.bottom,20)
                        Text("Problem: \(pitch.pitchProblem)")
                        Text(pitch.pitchSolution)
                        Text("Ask: $\(pitch.pitchInvest)M for 7%")
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    } .padding()
                        .frame(width:400,height: 500)
                        .glassBackgroundEffect()
                        .offset(x: vm.offset.width, y: vm.offset.height)
                        .rotationEffect(.degrees(Double(vm.offset.width / 20)))
                        .gesture(DragGesture().onChanged { value in
                            vm.offset = value.translation
                            
                        }
                            .onEnded { _ in
                                swipe()
                                
                            }
                        )
                        .animation(.spring(response: 0.35, dampingFraction: 0.75), value: vm.offset)
                    
//                    Image(systemName: "dollarsign.circle.fill")
//                            .padding(20)
//                            .background(Color.green.opacity(0.4))
//                            .cornerRadius(20)
//                            .glassBackgroundEffect()
//                            .offset(x:100)

                      
                }

                Spacer()
            }
            .padding(.top,70)
        }
    }
  
    private func endGame() {
        //        index = (index + 1) % vm.startup.count
        if vm.index < vm.startup.count - 1 {
            vm.index += 1
        } else {
            vm.isEnd = true
        }
    }
    
    private func invest() {
        let invest = vm.startup[vm.index]
        vm.totalInvest += invest.pitchInvest
    }
    
    private func swipe() {
        let swipeThreshold: CGFloat = 140
        if vm.offset.width > swipeThreshold {
            vm.offset = CGSize(width: 1000, height: 0)
       
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 200_000_000)
                invest()
                endGame()
                vm.offset = .zero
            }
            
        } else if vm.offset.width < -swipeThreshold {
            vm.offset = CGSize(width: -1000, height: 0)
            
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 200_000_000)
                endGame()
                vm.offset = .zero
            }
            
        } else {
            vm.offset = .zero
        }
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}

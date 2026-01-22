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
                                vm.swipe()
                                
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

}

#Preview(windowStyle: .plain) {
    ContentView()
}

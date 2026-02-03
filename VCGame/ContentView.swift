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
                    Text(pitch.pitchSolution)
                    Text("Ask: $\(pitch.pitchInvest)M for 7%")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                    .frame(width:400,height: 500)
                    .background(vm.backgroundColor.opacity(0.2))
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

                Spacer()
            }
            .padding(.top,70)
          
        }
    }

}

#Preview(windowStyle: .plain) {
    ContentView()
}


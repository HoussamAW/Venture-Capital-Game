//
//  EndGame.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI

struct EndGame: View {
    @Binding var vm: VCViewModel
    var body: some View {
        if vm.restartGame {
            ContentView()
        } else  {
            VStack {
                Text("Result")
                    .font(.title2)
                    .bold()
                    .padding()
                
                HStack(spacing:50) {
                    VStack {
                        Text("Total \nInvesting:")
                        Text("\(vm.totalInvest)")
                    }
                    
                    VStack {
                        Text("ROI:")
                        Text("\(vm.totalInvest)")
                    }
                    
                }.padding()
            }.padding()
                .glassBackgroundEffect()
            
            
            Button {
                vm.restartGame = true
            }label: {
               Text("Start game again")
                .padding()
                .background(Color.brown.opacity(0.5))
                .glassBackgroundEffect()
                .padding()
            } .buttonStyle(.plain)
                   
        }
    }
}

#Preview {
    let dummyVM = VCViewModel()
    EndGame(vm: .constant(dummyVM))
}

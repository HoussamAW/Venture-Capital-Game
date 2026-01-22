//
//  HomeView.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI

struct HomeView: View {
    let vm: VCViewModel
    var body: some View {
        if vm.isEnd {
            ContentView()
        } else {
            VStack {
                Text("Z Combinator Game")
                    .font(Font.title.bold())
                    .padding()
                    .glassBackgroundEffect()
                    .padding()
       
                Text("Welcome to Z Combinator: the Demo Day VC simulator.\n\nFounders pitch in seconds. You decide in one click: Invest or Pass.\n\nYour portfolio lives or dies through hype, pivots, and crashes.\n\nEndgame: ROI score + your verdict, from Unicorn Hunter to Bag Holder.")
                    .padding(5)
                    .multilineTextAlignment(.center)
                    .frame(width: 320,height: 310)
                    .padding()
                    .glassBackgroundEffect()
                    .padding(.top,20)
                    
          
            }
            .padding()

            Button ("Start Game") {
                vm.isEnd = true
            }.buttonStyle(.plain)
                .padding()
                .background(Color.brown.opacity(0.5))
                .glassBackgroundEffect()
                .padding()
        }
        
        
        
    }
}

#Preview {
    let VM = VCViewModel()
    HomeView(vm:VM)
 
}

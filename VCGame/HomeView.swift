//
//  HomeView.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI

struct HomeView: View {
    let vm: VCViewModel
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    var body: some View {
        if vm.isEnd {
            Text("Opening game experience...")
                   .task {
                       await openImmersiveSpace(id: "contentView")
                   }
        } else {
            VStack {
                Text("Z Combinator Game")
                    .font(Font.title.bold())
                    .padding()
                    .glassBackgroundEffect()
                    .padding()
       
                Text("Welcome to Z Combinator:\nYou’re on the front row of Demo Day.\n\nPitch after pitch, you bet on the future in a single swipe.\n\nSome founders make it big. Others don’t. Your choice: Invest or Pass.\n\nSome founders moon. Others burn.\nYour choices write the story of your fund and your ending: ROI + a brutal label.")
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
                Task {
                    await openImmersiveSpace(id: "contentView")
                }
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

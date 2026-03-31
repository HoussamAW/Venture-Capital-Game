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
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack {
            VStack {
                Text("Z Combinator Game")
                    .font(.title.bold())
                    .padding()
                    .glassBackgroundEffect()
                    .padding()

                Text("Welcome to Z Combinator:\nYou’re on the front row of Demo Day.\n\nPitch after pitch, you bet on the future in a single swipe.\n\nSome founders make it big. Others don’t. Your choice: Invest or Pass.\n\nSome founders moon. Others burn.\nYour choices write the story of your fund and your ending: ROI + a brutal label.")
                    .padding(5)
                    .multilineTextAlignment(.center)
                    .frame(width: 320, height: 310)
                    .padding()
                    .glassBackgroundEffect()
                    .padding(.top, 20)
            }
            .padding()

            Button("Start Game") {
                Task {
                    vm.isEnd = true
                    await openImmersiveSpace(id: "ContentView")
                    dismissWindow(id: "HomeView")
                }
            }
            .buttonStyle(.plain)
            .padding()
            .background(Color.brown.opacity(0.5))
            .glassBackgroundEffect()
            .padding()
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase != .active {
                Task {
                    await dismissImmersiveSpace()
                    vm.isEnd = false
                }
            }
        }
    }
}

#Preview {
    let vm = VCViewModel()
    HomeView(vm: vm)
}

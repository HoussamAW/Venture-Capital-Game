//
//  VCGameApp.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI

@main
struct VCGameApp: App {
    @State private var vm = VCViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(vm: $vm)
        }.windowStyle(.plain)
    }
}


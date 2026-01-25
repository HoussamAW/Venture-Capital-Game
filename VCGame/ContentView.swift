//
//  ContentView.swift
//  VCGame
//
//  Created by Houssam Dine Abdoul Wahab on 19/01/26.
//

import SwiftUI
import RealityKit


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


//import SwiftUI
//import RealityKit
//
//
//struct ContentView: View {
//    @State private var vm = VCViewModel()
//    var body: some View {
//        if vm.isEnd == true {
//            EndGame(vm: vm)
//        } else {
//            RealityView { content in
//                do {
//                    // 1) Load your room
//                    let room = try await Entity(named: "OfficeRoom")
//
//                    // 2) RealityKit uses meters. Auto-scale the room to a reasonable real-world width.
//                    //    Adjust `targetWidthMeters` if you want a bigger/smaller room.
//                    let bounds = room.visualBounds(relativeTo: nil)
//                    let targetWidthMeters: Float = 4.0
//                    let safeWidth = max(bounds.extents.x, 0.001)
//                    let s = targetWidthMeters / safeWidth
//                    room.scale = [s, s, s]
//
//                    // 3) Place the room so the floor sits at y = 0 and the center is in front of the user.
//                    //    (Origin is roughly at the user's position in front of the window/space.)
//                    room.position = [
//                        -bounds.center.x * s,
//                        -bounds.min.y * s,
//                        -2.0
//                    ]
//
//                    // 4) Add a light to avoid the “flat” look (depth comes from lighting + shadows).
//                    let sun = DirectionalLight()
//                    sun.light.intensity = 2500
//                    sun.light.shadow = .init()
//                    sun.position = [2.0, 3.0, 1.5]
//                    sun.look(at: .zero, from: sun.position, relativeTo: nil)
//
//                    content.add(sun)
//                    content.add(room)
//                } catch {
//                    print(error)
//                }
//            }
//            
//            
//            
////            ZStack(spacing: 40) {
////                let pitch = vm.startup[vm.index]
////
//////                HStack(spacing: 20) {
//////                    Spacer()
//////                    Image(systemName: "xmark.circle.fill")
//////                        .padding(20)
//////                        .background(Color.red.opacity(0.5))
//////                        .cornerRadius(20)
//////                        .glassBackgroundEffect()
//////                        .background(Circle())
//////                        .offset(x: -180)
//////
//////                    Spacer()
//////
//////
//////                    Image(systemName: "dollarsign.circle.fill")
//////                            .padding(20)
//////                            .background(Color.green.opacity(0.4))
//////                            .cornerRadius(20)
//////                            .glassBackgroundEffect()
//////                            .offset(x: 180)
//////
//////
//////                    Spacer()
//////
//////                }
////
////                VStack {
////                    Text(pitch.companyName)
////                        .font(.title)
////                        .foregroundStyle(.white)
////                        .bold()
////                        .padding(10)
////                        .padding(.bottom,20)
////
////                    Text("Problem: \(pitch.pitchProblem)")
////                    Text(pitch.pitchSolution)
////                    Text("Ask: $\(pitch.pitchInvest)M for 7%")
////                        .multilineTextAlignment(.center)
////                        .padding()
////
////                }
////                    .frame(width:400,height: 500)
////                    .background(vm.backgroundColor.opacity(0.2))
////                    .glassBackgroundEffect()
////                    .offset(x: vm.offset.width, y: vm.offset.height)
////                    .rotationEffect(.degrees(Double(vm.offset.width / 20)))
////                    .gesture(DragGesture().onChanged { value in
////                        vm.offset = value.translation
////                    }
////                        .onEnded { _ in
////                            vm.swipe()
////                        }
////                    )
////                    .animation(.spring(response: 0.35, dampingFraction: 0.75), value: vm.offset)
////
////                Spacer()
////            }
////            .padding(.top,70)
//        }
//    }
//
//}
//
//#Preview(windowStyle: .volumetric) {
//    ContentView()
//}

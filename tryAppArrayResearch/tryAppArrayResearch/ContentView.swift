//
//  ContentView.swift
//  tryAppArrayResearch
//
//  Created by 佐藤俊輔 on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var hoge = false
    
    var body: some View {
        VStack {
            Button {
                hoge = true
            } label: {
                Text("Open")
            }
        }
        .padding()
        .fullScreenCover(isPresented: $hoge) {
            HelloSpeakBuddyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HelloSpeakBuddyView()
    }
}

struct HelloSpeakBuddyView: View {
    
    @State var height: CGFloat = 0
    
    var body: some View {
        ZStack {
            // 背景色
            LinearGradient(
                gradient: Gradient(
                    colors: [.purple.opacity(0.4), .white]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            
            VStack(spacing: 16) {
                Text("Hello\nSpeakBUDDY")
                    .font(Font.system(size: 46, weight: .bold))
                
                HStack(alignment: .bottom, spacing: 24) {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.blue)
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                        .frame(width:48, height: 20)
                    
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.blue)
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                        .frame(width:48, height: 40)
                    
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.blue)
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                        .frame(width:48, height: 90)
                    
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.blue)
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                        .frame(width:48, height: height)
                        .onAppear {
                            withAnimation(.linear(duration: 0.8)) {
                                height = 160
                            }
                        }
                }
                
                VStack(spacing: 8) {
                    Text("スピークバディで")
                        .font(Font.system(size: 24, weight: .bold))
                    Text("レベルアップ")
                        .font(Font.system(size: 32, weight: .black))
                        .foregroundStyle(
                                LinearGradient(
                                    colors: [.blue.opacity(0.4), .blue],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                }
                
                Button {
                    print("tapped")
                } label: {
                    Text("プランに登録する")
                }

            }
            .padding()
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

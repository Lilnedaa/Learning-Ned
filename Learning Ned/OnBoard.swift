//
//  OnBoard.swift
//  Learning Ned
//
//  Created by Nedaa on 28/04/1447 AH.
//
import SwiftUI

struct OnBoard: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 24) {
                ZStack {
                    Circle()
                        .fill(Color.orange.opacity(0.12))
                        .frame(width: 109, height: 109)
                        .overlay(Circle().stroke(.orange.opacity(0.30), lineWidth: 1))
                    //jjjjjjjjjjjjjjj
                    Image(systemName: "flame.fill")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.orange)
                }

                VStack(spacing: 8) {
                    Text("Hello Learner")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)

                    Text("This app will help you learn everyday.")
                        .foregroundStyle(.secondary)
                }

                Button("Start learning") {
                    // Handle navigation or state changes here
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    OnBoard()
}

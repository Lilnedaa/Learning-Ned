//
//  OnBoard.swift
//  Learning Ned
//
//  Created by Nedaa on 28/04/1447 AH.
//
import SwiftUI

struct OnBoard: View {
    @State private var topic: String = "Swift" // اجعلها "Swift" إذا تبغى النص يكون ظاهر فعليًا داخل الحقل

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
                    Image(systemName: "flame.fill")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.orange)
                }

                VStack(spacing: 8) {

                    Text("Hello Learner")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)

                    Text("This app will help you learn everyday.")
                        .foregroundStyle(Color(red: 153/255, green: 153/255, blue: 153/255))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 17))
                        .padding(.bottom, 19)

                    VStack(spacing: 15) {
                        Text("I want to learn")
                            .font(.system(size: 22))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // TextField مع placeholder "Swift"
                        TextField("Swift", text: $topic)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 12)
                            .background(
                                Color.white.opacity(0.06),
                                in: RoundedRectangle(cornerRadius: 12)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.white.opacity(0.1), lineWidth: 1)
                            )
                            .foregroundStyle(.gray)
                        padding(.bottom, 19)
                    }
//                    VStack(spacing: 15) {
//                        Text("I want to learn")
//                            .font(.system(size: 22))
//                            .foregroundStyle(.white)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        
//                        
//                        
//                    }
                    
                    
                    
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

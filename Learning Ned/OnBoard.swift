//
//  OnBoard.swift
//  Learning Ned
//
//  Created by Nedaa on 28/04/1447 AH.
//
import SwiftUI

struct OnBoard: View {
    @State private var topic: String = "Swift"
    @State private var sl: String = "Week" // لتحديد الزر المختار

    var md = ["Week", "Month", "Year"]

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

                    Text("This app will help you learn everyday!")
                        .foregroundStyle(Color(red: 153/255, green: 153/255, blue: 153/255))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 17))
                        .padding(.bottom, 19)

                    VStack(spacing: 15) {
                        Text("I want to learn")
                            .font(.system(size: 22))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)

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
                          //  .padding(.bottom, 2027)
                        Spacer()

                    }

                    VStack(spacing: 15) {
                        Text("I want to learn it in a")
                            .font(.system(size: 22))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: 16) {
                            ForEach(md, id: \.self) { period in
                                Button(action: {
                                    sl = period
                                }) {
                                    Text(sl)
                                        .font(.system(size: 22, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(width: 110, height: 54)
                                        .background(
                                            sl == period
                                            ? Color(red: 173/255, green: 67/255, blue: 0/255)
                                            : Color.white.opacity(0.08)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 27)
                                                .stroke(
                                                    sl == period
                                                    ? Color(red: 255/255, green: 140/255, blue: 0/255)
                                                    : Color.white.opacity(0.10),
                                                    lineWidth: 1
                                                )
                                        )
                                        .cornerRadius(27)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 19)
                }
                Spacer()


                Button("Start learning") {

                }
                .font(.system(size: 22, weight: .regular))
                .foregroundColor(.white)
                .frame(height: 54)
                .frame(maxWidth: .infinity)
                .background(
                    Color(red: 173/255, green: 67/255, blue: 0/255)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 27)
                        .stroke(Color(red: 255/255, green: 140/255, blue: 0/255), lineWidth: 1)
                )
                .cornerRadius(27)
                .padding(.horizontal, 12)
                .padding(.top, 12)
            }
            .padding()
        }
    }
}

#Preview {
    OnBoard()
}

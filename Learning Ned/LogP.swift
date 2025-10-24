
import SwiftUI
import SwiftUI

struct LogP: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    HStack {
                                       Text("Activity")
                                           .font(.system(size: 32, weight: .bold))
                                           .foregroundColor(.white)
                                       Spacer()
                                       HStack(spacing: 12) {
                                           Circle()
                                               .fill(Color(.systemGray4).opacity(0.22))
                                               .frame(width: 36, height: 36)
                                               .overlay(
                                                   Image(systemName: "calendar")
                                                       .foregroundColor(.white)
                                                       .font(.system(size: 18))
                                               )
                                           Circle()
                                               .fill(Color(.systemGray4).opacity(0.22))
                                               .frame(width: 36, height: 36)
                                               .overlay(
                                                   Image(systemName: "clock.arrow.circlepath")
                                                       .foregroundColor(.white)
                                                       .font(.system(size: 18))
                                               )
                                       }
                                   }
                                   .padding(.horizontal, 24)
                                   .padding(.top, 32)
                    // MARK: Week Calendar Card
                    WeekCalendarCard(
                        monthTitle: "October 2025",
                        week: sampleWeek,
                        selectedIndex: 4 // اليوم الحالي مثلاً
                    )
                    
                    Text("Learning Swift")
                        .font(.title3).bold()
                        .foregroundStyle(.white.opacity(0.9))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    // MARK: Stats Pills
                    HStack(spacing: 12) {
                        StatPill(
                            icon: "flame.fill",
                            title: "Days Learned",
                            value: 3,
                            bg: Color(hex: 0x3a2b1f),
                            fg: Color(hex: 0xFF9230)
                        )
                        StatPill(
                            icon: "cube.fill",
                            title: "Days Freezed",
                            value: 1,
                            bg: Color(hex: 0x1f2e33),
                            fg: Color(hex: 0x3CD3FE)
                        )
                    }
                    .padding(.bottom,50)
                    .padding(.horizontal, 16)

                    // MARK: Big Circle Button (Design only)
                    CircleButton(
                        title: "Log as                                     Learned",
                        fg: Color(hex: 0xffd3b0),
                        ring: Color(hex: 0x2b1c14),
                        fill: Color(hex: 0x9b4d24)
                    )
                    .padding(.top, 8)

                    // MARK: Secondary Button
                    Button(action: {}) {
                        Text("Log as Freezed")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 70, style: .continuous)
                                    .fill(Color(hex:0x1f2f35).opacity(0.9))
                                
                                   .glassEffect()
                            )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 24)

                    // Small footer text (optional)
                    Text("1 out of 2 Freezes used")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                }
            }
//            .background(Color.black) // نمط داكن كالمرجع
//            .navigationTitle("Activity")
//            .navigationBarTitleDisplayMode(.large)
//            .toolbar {
//                ToolbarItemGroup(placement: .topBarTrailing) {
//                    Button("", systemImage: "calendar") {}
//                        .tint(.white.opacity(0.85))
//                    Button("", systemImage: "clock.arrow.circlepath") {}
//                        .tint(.white.opacity(0.85))
//              //  }
           // }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

// MARK: - Components

struct WeekCalendarCard: View {
    let monthTitle: String
    let week: [DayItem]
    let selectedIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header: Month + arrows
            HStack {
                Text(monthTitle)
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.white.opacity(0.7))
            }

            // Week row: weekday + day numbers
            HStack(spacing: 8) {
                ForEach(week.indices, id: \.self) { i in
                    let item = week[i]
                    VStack(spacing: 6) {
                        Text(item.weekday.uppercased())
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.6))
                        Text("\(item.day)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill( i == selectedIndex
                                           ? Color(hex: 0xFF9230)
                                           : (item.isLogged ? Color(hex: 0x6b4a2d) : Color.clear))
                            )
                            .overlay(
                                Circle()
                                    .strokeBorder(
                                        i == selectedIndex ? Color(hex: 0xf6cf9b) : Color.white.opacity(0.08),
                                        lineWidth: i == selectedIndex ? 2 : 1
                                    )
                            )
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            // Title under the calendar (activity name)
//            Text("Learning Swift")
//                .font(.subheadline).bold()
//                .foregroundStyle(.white.opacity(0.9))
//                .padding(.top, 6)
        }
        
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(hex: 0x141414))
                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 8)
        )
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }
    
}


struct StatPill: View {
    let icon: String
    let title: String
    let value: Int
    let bg: Color
    let fg: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .imageScale(.large)
                .font(.headline)
            VStack(alignment: .leading, spacing: 2) {
                Text("\(value)")
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(title)
                    .font(.caption)
                    .opacity(0.85)
                    .foregroundStyle(.white)
            }
        }
        .foregroundStyle(fg)
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 70, style: .continuous)
                .fill(bg.opacity(0.9))
        )
        
    }
    
}

struct CircleButton: View {
    let title: String
    let fg: Color
    let ring: Color
    let fill: Color

    var body: some View {
        Button(action: {}) {
            ZStack {
                
//                Text(title)
//                    .font(.title2.weight(.bold))
//                    .multilineTextAlignment(.center)
//                    .foregroundStyle(.white)
                Circle()
                    .fill(fill)
                    .frame(width: 274, height: 274)
                    .glassEffect()
//                Circle()
//                    .strokeBorder(ring.opacity(0.8), lineWidth: 18)
//                    .blur(radius: 12)
//                    .frame(width: 260, height: 260)

                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    
            }
            .shadow(color: .black.opacity(0.6), radius: 18, x: 0, y: 10)
        }
        .buttonStyle(.plain)
Spacer()

    }
}

// MARK: - Models & Sample Data

struct DayItem: Hashable {
    let weekday: String // "SUN".."SAT"
    let day: Int
    var isLogged: Bool = false
}

let sampleWeek: [DayItem] = [
    DayItem(weekday: "SUN", day: 20, isLogged: true),
    DayItem(weekday: "MON", day: 21, isLogged: true),
    DayItem(weekday: "TUE", day: 22, isLogged: true),
    DayItem(weekday: "WED", day: 23, isLogged: false),
    DayItem(weekday: "THU", day: 24, isLogged: false),
    DayItem(weekday: "FRI", day: 25, isLogged: false),
    DayItem(weekday: "SAT", day: 26, isLogged: false),
]

// MARK: - Helpers

extension Color {
    /// إنشاء لون من hex مثل 0x1F2E33
    init(hex: UInt, alpha: Double = 1.0) {
        let r = Double((hex >> 16) & 0xFF) / 255.0
        let g = Double((hex >> 8) & 0xFF) / 255.0
        let b = Double(hex & 0xFF) / 255.0
        self = Color(.sRGB, red: r, green: g, blue: b, opacity: alpha)
    }}
//}



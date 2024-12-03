//
//  ContentView.swift
//  first-ios-project
//
//  Created by Hamad on 03/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLightMode = true

    var body: some View {
        ZStack(alignment: .top) {
            BackgroundView(isLightMode: $isLightMode)
            VStack {
                Text("Karachi, Pakistan")
                    .font(.system(size: 30, weight: .medium, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: isLightMode ? "cloud.sun.fill" : "moon.stars.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isLightMode ? 180 : 120, height: 180)

                    Text("30°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack(spacing: 15) {
                    WeatherDayView(day: "SUN",
                                   image: "cloud.sun.fill",
                                   temprature: 16)

                    WeatherDayView(day: "MON",
                                   image: "sun.max.fill",
                                   temprature: 26)

                    WeatherDayView(day: "TUE",
                                   image: "cloud.sun.fill",
                                   temprature: 26)

                    WeatherDayView(day: "WED",
                                   image: "wind.snow",
                                   temprature: 10)

                    WeatherDayView(day: "THU",
                                   image: "sunset.fill",
                                   temprature: 26)

                    WeatherDayView(day: "FRI",
                                   image: "cloud.sun.fill",
                                   temprature: 14)

                    WeatherDayView(day: "SAT",
                                   image: "snow",
                                   temprature: -10)
                }
                Spacer()
                Button {
                    isLightMode.toggle()
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 22, weight: .bold))
                        .frame(width: 300, height: 50)
                        .background(.white)
                        .cornerRadius(6)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    let day: String
    let image: String
    let temprature: Int

    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(String(temprature))
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isLightMode: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isLightMode ? .blue : .black, isLightMode ? Color("lightBlue") : .gray]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

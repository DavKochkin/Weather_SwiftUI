//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by David Kochkin on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, LA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack() {
                    WeatherDayView()
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeak: [String] = ["TUE", "WED", "THU", "FRI", "SAT"]
    var imageName: [String] = ["cloud.sun.fill", "cloud.fog.fill", "sun.max.fill", "wind.snow", "sunset.fill"]
    var temperature: [Int] = [76, 65, 80, 54, 67]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<dayOfWeak.count, id: \.self) { index in
                VStack(spacing: 14) {
                    Text(dayOfWeak[index])
                        .font(.system(size: 18,weight: .medium))
                        .foregroundColor(.white)
                    
                    Image(systemName: imageName[index])
                        .symbolRenderingMode(.multicolor)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Text("\(temperature[index])°")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 60)
    }
}



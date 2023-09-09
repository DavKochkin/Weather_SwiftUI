//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by David Kochkin on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 60)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeak: "TUE",
                                       imageName: "cloud.sun.fill",
                                       temperature: 76)
                        WeatherDayView(dayOfWeak: "WED",
                                       imageName: "cloud.fog.fill",
                                       temperature: 65)
                        WeatherDayView(dayOfWeak: "THU",
                                       imageName: "sun.max.fill",
                                       temperature: 80)
                        WeatherDayView(dayOfWeak: "FRI",
                                       imageName: "wind.snow",
                                       temperature: 54)
                        WeatherDayView(dayOfWeak: "SAT",
                                       imageName: "sunset.fill",
                                       temperature: 67)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time ")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
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
    
    var dayOfWeak: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeak)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

//
//  SuperheroDetail.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 19/10/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id: String
    
    @State private var superhero: ApiNetwork.SuperheroCompleted? = nil
    @State private var loading = true
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple.opacity(0.6), .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    
                    if loading {
                        ProgressView().tint(.white)
                    } else if let superhero = superhero {
                        
                        WebImage(url: URL(string: superhero.image.url))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                            .cornerRadius(24)
                            .shadow(radius: 10)
                            .padding(.top, 50)
                        
                        Text(superhero.name)
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        VStack(spacing: 14) {
                            HStack {
                                StatLabel(title: "Gender", value: superhero.appearance.gender)
                                Spacer()
                                StatLabel(title: "Race", value: superhero.appearance.race.isEmpty ? "Unknown" : superhero.appearance.race)
                            }
                            HStack {
                                StatLabel(title: "Height", value: superhero.appearance.height[1])
                                Spacer()
                                StatLabel(title: "Weight", value: superhero.appearance.weight[1])
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.2)))
                        .padding(.horizontal)
                        
                        SuperheroStats(stats: superhero.powerstats)
                            .padding(.top, 8)
                        
                        Spacer(minLength: 40)
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    superhero = nil
                }
                loading = false
            }
        }
    }
}
struct StatLabel: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white.opacity(0.7))
            Text(value)
                .font(.title3.bold())
                .foregroundColor(.white)
        }
    }
}

struct SuperheroStats: View {
    let stats: ApiNetwork.Powerstats
    
    var statData: [(String, Int, Color)] {
        [
            ("Combat", Int(stats.combat) ?? 0, .red),
            ("Durability", Int(stats.durability) ?? 0, .orange),
            ("Intelligence", Int(stats.intelligence) ?? 0, .blue),
            ("Power", Int(stats.power) ?? 0, .purple),
            ("Speed", Int(stats.speed) ?? 0, .green),
            ("Strength", Int(stats.strength) ?? 0, .yellow)
        ]
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Power Stats")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.bottom, 8)
            
            Chart(statData, id: \.0) { stat in
                BarMark(
                    x: .value("Value", stat.1),
                    y: .value("Stat", stat.0)
                )
                .foregroundStyle(stat.2)
                .annotation(position: .trailing) {
                    Text("\(stat.1)")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(height: 300)
            .chartYAxis {
                AxisMarks(preset: .aligned, values: statData.map { $0.0 }) { value in
                    AxisValueLabel {
                    }
                }
            }
            .chartXAxis(.hidden)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.2)))
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                ForEach(statData, id: \.0) { stat in
                    HStack {
                        Circle()
                            .fill(stat.2)
                            .frame(width: 16, height: 16)
                        Text(stat.0)
                            .foregroundColor(.white)
                            .font(.subheadline.bold())
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    SuperheroDetail(id: "1")
}

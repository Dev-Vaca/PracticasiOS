//
//  IMCView.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 30/09/25.
//

import SwiftUI

struct IMCView: View {
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 18
    @State var weight: Int = 60
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        VStack{
            HStack{
                ToggleButton(title: "Hombre", imageName: "figure.stand", index: 0, selectedGender: $gender)
                ToggleButton(title: "Mujer", imageName: "figure.stand.dress", index: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterData(text: "Edad", selectedData: $age)
                CounterData(text: "Peso", selectedData: $weight)
            }
            IMCCalculateButton(userHeight: height, userWeight: Double(weight))
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundIMC)
            .navigationTitle("IMC CALCULATOR").navigationBarTitleDisplayMode(.inline)
    }
}

struct ToggleButton: View {
    let title: String
    let imageName: String
    let index: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if(index == selectedGender) {
            Color.componentSelect
        } else {
            Color.componentUnselect
        }
        
        Button(action: {
            selectedGender = index
        }){
            VStack{
                Image(systemName: imageName).resizable().scaledToFit().frame(height: 100).foregroundColor(.white)
                InformationText(text: title)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack  {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.componentUnselect)
    }
}

struct CounterData: View {
    let text: String
    @Binding var selectedData: Int
    
    var body: some View {
        VStack {
            TitleText(text: text)
            InformationText(text: "\(selectedData)")
            HStack {
                Button(action: {
                    if(selectedData != 0) {
                        selectedData -= 1
                    }
                }) {
                    Image(systemName: "minus").foregroundColor(.white).frame(width: 70, height: 70).background(.purple).cornerRadius(50)

                }
                Button(action: {
                    selectedData += 1
                }) {
                    Image(systemName: "plus").foregroundColor(.white).frame(width: 70, height: 70).background(.purple).cornerRadius(50)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.componentUnselect)
    }
}

struct IMCCalculateButton: View {
    let userHeight: Double
    let userWeight: Double
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {IMCResult(userHeight: userHeight, userWeight: userWeight)}){
                Text("CALCULAR").font(.title).bold().foregroundColor(.white).frame(maxWidth: .infinity, maxHeight: 100).background(.componentUnselect)
            }
        }
    }
}

#Preview {
    IMCView()
}

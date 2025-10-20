//
//  IMCResult.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 01/10/25.
//

import SwiftUI

struct IMCResult: View {
    let userHeight: Double
    let userWeight: Double
    var body: some View {
        VStack {
            Text("Tu resultado").font(.title).bold().foregroundColor(.white)
            let result = CalculateIMC(weigth: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundIMC)
    }
}

func CalculateIMC(weigth: Double, height: Double) -> Double{
    let result = weigth / pow((height/100), 2)
    return result
}

func getImcResult(result: Double) -> (String, Color) {
    var title: String
    var color: Color
    
    switch result {
    case 0.00 ..< 20:
        title = "Peso Bajo"
        color = .yellow
    case 20.00 ..< 25:
        title = "Peso Normal"
        color = .green
    case 25.00 ..< 30:
        title = "Sobrepeso"
        color = .orange
    case 30.00 ... 100:
        title = "Obesidad"
        color = .red
    default:
        title = "ERROR"
        color = .red
    }
    
    return (title, color)
}

struct InformationView: View {
    let result: Double
    var body: some View {
        
        let information = getImcResult(result: result)
        
        VStack {
            Text("\(information.0)").foregroundColor(information.1).font(.title).bold()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Text("")
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.componentUnselect).cornerRadius(16).padding()
    }
}

#Preview {
    IMCResult(userHeight: 80, userWeight: 190)
}

//
//  ContentView.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 25/09/25.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            
            Rectangle().foregroundColor(.orange).frame(height: 100)
            
            HStack {
                Circle().foregroundColor(.green)
                Rectangle().foregroundColor(.black).frame(width: 100)
                Circle().foregroundColor(.indigo)
            }.frame(height: 300)
            
            Rectangle().foregroundColor(.orange).frame(height: 100)
            
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
        }
        .background(.red)
    }
}

#Preview {
    Exercise1()
}

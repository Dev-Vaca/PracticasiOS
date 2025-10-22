//
//  CustomDialog.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 21/10/25.
//

import SwiftUI

struct CustomDialog<Content:View>: View {
    
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    var body: some View {
        ZStack {
            Rectangle().fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        if onDismissOutside {
                            closeDialog()
                        }
                    }
                }
            
            content.frame(width: UIScreen.main.bounds.size.width-100, height: 300)
                .padding()
                .background(.white)
                .cornerRadius(16)
                .overlay(alignment: .topTrailing) {
                    Button(action: { withAnimation { closeDialog() } }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundColor(.gray).padding(16)
                }
        }.ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
    }
}

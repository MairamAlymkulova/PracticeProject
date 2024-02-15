//
//  SignInButtonView.swift
//  PracticeProject
//
//  Created by A Mairam on 15/2/24.
//

import SwiftUI

struct SignInButtonView: View {
    @Binding var isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        VStack{
            
            Button(action: action, label: {
                
                Text("Sign in")
                    .font(.title3)
                    .foregroundStyle(.white)
            })
            .padding()
            .frame(width: 200)
            .background(isEnabled ? .black : .gray)
            .cornerRadius(15)
            .disabled(!isEnabled)
            
        }
    }
    
}

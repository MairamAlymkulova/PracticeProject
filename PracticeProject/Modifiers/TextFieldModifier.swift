//
//  TextFieldModifier.swift
//  PracticeProject
//
//  Created by A Mairam on 15/2/24.
//

import SwiftUI

struct TextFieldViewModifier: ViewModifier {
    let borderColor: Color
    func body(content: Content) -> some View {
        content
        
            .padding()
            .foregroundColor(borderColor)
            .frame(maxWidth: .infinity)
            .autocorrectionDisabled()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1.0)
                
            }
        
        
    }
    
    
}


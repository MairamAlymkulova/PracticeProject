//
//  PasswordTextFieldView.swift
//  PracticeProject
//
//  Created by A Mairam on 15/2/24.
//

import SwiftUI

struct PasswordTextFieldView: View {
    let titleKey: String
    @Binding var text: String
    @Binding var isError: Bool
    
    var body: some View {
        
        SecureField(titleKey, text: $text)
            .modifier(TextFieldViewModifier(borderColor: isError ? Color.red : Color.black))
            .foregroundColor(isError ? Color.red : Color.black)

    }
}

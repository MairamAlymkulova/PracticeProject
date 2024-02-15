//
//  TextFieldView.swift
//  PracticeProject
//
//  Created by A Mairam on 15/2/24.
//

import SwiftUI

struct EmailTextFieldView: View {
    let titleKey: String
    @Binding var text: String
    @Binding var isError: Bool
    
    var body: some View {
        VStack {
            TextField(titleKey, text: $text)
                .modifier(TextFieldViewModifier(borderColor: isError ? Color.red: Color.black))
                .foregroundColor(isError ? Color.red : Color.black)
        }
    }
}


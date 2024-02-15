//
//  ContentView.swift
//  PracticeProject
//
//  Created by A Mairam on 14/2/24.
//

import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var emailText: String = ""
    @Published var password: String = ""
    @Published var allosSignIn: Bool = false
    @Published var isError: Bool = false
    
    func checkButtonState() {
        let emailIsValid = emailValidation()
        let passwordIsValid = passwordValidation()
        allosSignIn = emailIsValid && passwordIsValid
        isError = !allosSignIn
    }
    
    func emailValidation() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return emailText.isEmpty ? true : (regex.firstMatch(in: emailText, options: [], range: NSRange(location: 0, length: emailText.utf16.count)) != nil)
    }
    
    func passwordValidation () -> Bool {
        return password.count >= 8
    }
}


struct AuthView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Sign In")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            EmailTextFieldView(titleKey: "Email", text: $viewModel.emailText, isError: $viewModel.isError)
            PasswordTextFieldView(titleKey: "Password", text: $viewModel.password, isError: $viewModel.isError)
                .padding(.bottom)
            
            SignInButtonView(isEnabled: $viewModel.allosSignIn) {
                viewModel.isError = true
            }
        }
        .onChange(of: viewModel.emailText, { _, _ in
            viewModel.checkButtonState()
        })
        .onChange(of: viewModel.password, { _, _ in
            viewModel.checkButtonState()
        })
        .padding()
        
    }
}

//#Preview {
//    ContentView()
//}

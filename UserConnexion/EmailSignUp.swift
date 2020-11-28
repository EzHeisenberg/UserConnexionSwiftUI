//
//  EmailSignUp.swift
//  UserConnexion
//
//  Created by Ez Heisenberg on 24/11/2020.
//

import SwiftUI
import Firebase

struct EmailSignUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var user: User?
    @State private var showMain: Bool = false
    
    @State private var loading: Bool = false
    
    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""
     
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                TextField("Email", text: $email)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Mot de passe", text: $password)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(loading ? true: false)
                    .textContentType(.password)
                
                SecureField("Confirmation mot de passe", text: $confirmPassword)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(loading ? true: false)
                    .textContentType(.password)
                
                Button(action: {
                    if self.password == self.confirmPassword {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if error != nil{
                                alertMessage = error!.localizedDescription
                                isAlertPresented = true
                            }else{
                                
                            }
                        }
                    }
                }, label: {
                    Text("Nouvelle inscription").font(.title3).foregroundColor(.white).padding().background(
                        RoundedRectangle(cornerRadius: 13, style: .circular).foregroundColor(.blue)
                    )
                })
                
                Spacer()
            }.padding(20)
            .navigationTitle("Inscription")
            .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text(alertMessage))
            })
        }
    }
}

struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUp()
    }
}

//
//  EmailSignIn.swift
//  UserConnexion
//
//  Created by Ez Heisenberg on 24/11/2020.
//

import SwiftUI
import Firebase

struct EmailSignIn: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var user: User?
    @State private var showMain: Bool = false
    
    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""

    
    var body: some View {
      
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
                .textContentType(.password)
                .disableAutocorrection(true)
            
            
            Button(action: {
                Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, err) in
                    if err != nil{
                        alertMessage = err!.localizedDescription
                        isAlertPresented = true
                    }else{
                        if let user = authDataResult?.user{
                            self.user = user
                            self.showMain = true
                        }
                    }
                }
                
                
            }, label: {
                Text("Se connecter").font(.title3).foregroundColor(.white).padding().background(
                    RoundedRectangle(cornerRadius: 13, style: .circular).foregroundColor(.blue)
                )
            })
            .fullScreenCover(isPresented: $showMain, content: {
                Text("connecté")
            })
            
            Spacer()
            
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Text("Mot de passe oublié")
                })
        
        }.padding(20)
        .navigationTitle("Connexion")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertMessage))
        })
    }
}

struct EmailSignIn_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignIn()
    }
}

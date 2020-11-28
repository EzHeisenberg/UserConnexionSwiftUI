 //
//  ContentView.swift
//  UserConnexion
//
//  Created by Ez Heisenberg on 24/11/2020.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var items = [Any]()
    @State private var shateSheet = false
    @State private var selectedObject: Any?
    
    var body: some View {
        NavigationView{
            
            ZStack{
                VStack(spacing: 20) {
                    NavigationLink(destination: EmailSignIn(), label: {
                        Text("Connexion").foregroundColor(.white).frame(width: 300, height: 50).background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.blue)
                        )
                    })
                    NavigationLink(destination: EmailSignUp(), label: {
                        Text("Inscription").foregroundColor(.white).frame(width: 300, height: 50).background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.black)
                        )
                    })
                }
            }
            .navigationTitle("MyList")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

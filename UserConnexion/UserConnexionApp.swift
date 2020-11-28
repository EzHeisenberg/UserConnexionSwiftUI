//
//  UserConnexionApp.swift
//  UserConnexion
//
//  Created by Ez Heisenberg on 24/11/2020.
//

import SwiftUI
import UIKit
//devoir importer firebase ici avec le cycle d'app swift
import Firebase

@main
struct UserConnexionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
        var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//cree une class appdelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
      }
}

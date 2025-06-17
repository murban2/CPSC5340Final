//
//  AuthAppApp.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()
    return true
  }
}


@main
struct AuthAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authVM.isLoggedIn {
                ContentView(authVM: authVM)
            } else {
                LoginView(authVM: authVM)
            }
        }
    }
}

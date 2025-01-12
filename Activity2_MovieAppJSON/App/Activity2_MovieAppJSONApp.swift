//
//  Activity2_MovieAppJSONApp.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-10.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var viewModel = AuthViewModel()
    

  var body: some Scene {
    WindowGroup {
      NavigationView {
         // MovieListView()
          ContentView()
              .environmentObject(viewModel)
      }
    }
  }
}

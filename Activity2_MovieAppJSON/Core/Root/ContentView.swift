//
//  ContentView.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
//                ProfileView()
                MovieListView()
            }
            else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}

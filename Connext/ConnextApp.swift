//
//  ConnextApp.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

@main
struct ConnextApp: App {
    @State private var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView() // your current main screen
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

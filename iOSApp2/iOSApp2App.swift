//
//  iOSApp2App.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-07.
//

import SwiftUI

/// The main entry point of the Toronto Scavenger Hunt app.
/// Creates a shared HuntManager instance and injects it into the environment
/// so all child views can access and mutate the hunt state.
@main
struct iOSApp2App: App {
    @State private var huntManager = HuntManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(huntManager)
        }
    }
}

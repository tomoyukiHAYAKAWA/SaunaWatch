//
//  SaunaWatchApp.swift
//  SaunaWatch WatchKit Extension
//
//  Created by Tomoyuki Hayakawa on 2022/02/24.
//

import SwiftUI

@main
struct SaunaWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

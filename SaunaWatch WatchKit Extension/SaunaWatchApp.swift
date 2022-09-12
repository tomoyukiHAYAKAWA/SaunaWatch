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
                MainView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

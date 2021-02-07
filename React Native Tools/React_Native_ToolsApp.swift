//
//  React_Native_ToolsApp.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

@main
struct React_Native_ToolsApp: App {
	var app: ReactNativeAppTools = ReactNativeAppTools()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.frame(minWidth: 1240, minHeight: 820, alignment: .center)
				.environmentObject(app)
				.environment(\.colorScheme, .dark)
        }
    }
}

//
//  React_Native_ToolsApp.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

@main
struct React_Native_ToolsApp: App {
	var app: App = App()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.frame(width: 1240, height: 820, alignment: .center)
				.environmentObject(app)
        }
    }
}

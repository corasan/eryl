//
//  ContentView.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var app: ReactNativeAppTools
	@State var showFirst = true
	
    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				List {
					NavigationLink(destination: ReactNativeLogs(), isActive: $showFirst) {
						Text("React Native Logs")
							.font(.title)
					}
					NavigationLink(destination: Text("Destination 2")) {
						Text("CodePush Logs")
							.font(.title)
					}
				}
				
				VStack(alignment: .leading) {
					ActionButton(label: app.isRunning ? "Stop" : "Start", icon: "\(app.isRunning ? "stop" : "play").fill", action: app.isRunning ? app.stop : app.start)
//					ActionButton(label: "CodePush", icon: "arrow.clockwise.icloud.fill")
					ActionButton(label: "Run Simulator", icon: "iphone.badge.play", action: app.runOnSimulator)
					ActionButton(label: "Run Device", icon: "iphone")
				}
				.padding(.top, 50)
				.padding(.horizontal, 25)
				Spacer()
			}
			.padding(.vertical, 40)
			.frame(width: 280)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.frame(width: 1240, height: 820, alignment: .center)
			.environmentObject(ReactNativeAppTools())
    }
}

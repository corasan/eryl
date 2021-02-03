//
//  ContentView.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var stocket: Stocket

    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				VStack {
					NavigationLink(
						destination: Text("Destination")) {
						Text("React Native Logs")
					}
					.buttonStyle(CustomButtonStyle())
					NavigationLink(
						destination: Text("Destination2")) {
						Text("CodePush Logs")
					}
					.buttonStyle(CustomButtonStyle())
				}
				
				VStack(alignment: .leading) {
					ActionButton(label: stocket.isRunning ? "Stop" : "Start", icon: "\(stocket.isRunning ? "stop" : "play").fill", action: stocket.isRunning ? stocket.stop : stocket.start)
					ActionButton(label: "CodePush", icon: "arrow.clockwise.icloud.fill")
					ActionButton(label: "Run Simulator", icon: "iphone")
					ActionButton(label: "Run Device", icon: "iphone.badge.play")
				}
				.padding(.top, 50)
				Spacer()
			}
			.padding(.vertical, 40)
			.padding(.horizontal, 25)
			.frame(width: 280)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.frame(width: 1240, height: 820, alignment: .center)
    }
}

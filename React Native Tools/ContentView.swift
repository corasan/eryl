//
//  ContentView.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				Text("React Native Logs")
					.font(.title)
					.fontWeight(.bold)
					.padding(.vertical, 20)
				Text("CodePush log")
					.font(.title)
					.fontWeight(.bold)
					.padding(.vertical, 20)
				
				VStack(alignment: .leading) {
					ActionButton(label: "Start", icon: "play.fill")
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

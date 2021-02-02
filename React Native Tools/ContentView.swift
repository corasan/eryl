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
				Text("Logs")
					.font(.title)
					.fontWeight(.bold)
					.padding(.vertical, 10)
				Text("CodePush logs")
					.font(.title)
					.fontWeight(.bold)
					.padding(.vertical, 10)
				
				VStack(alignment: .leading) {
					Text("Start")
						.font(.title)
						.fontWeight(.bold)
						.padding(.vertical, 10)
					Text("CodePush")
						.font(.title)
						.fontWeight(.bold)
						.padding(.vertical, 10)
					Text("Run App")
						.font(.title)
						.fontWeight(.bold)
						.padding(.vertical, 10)
				}
				.padding(.top, 50)
				Spacer()
			}
			.padding(.vertical, 40)
			.frame(width: 240)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.frame(width: 1240, height: 820, alignment: .center)
    }
}

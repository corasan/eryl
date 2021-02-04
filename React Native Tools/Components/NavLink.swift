//
//  NavLink.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import SwiftUI

struct NavLink: View {
	var destination: AnyView
	var label: String
	
	init(_ label: String, destination: AnyView) {
		self.destination = destination
		self.label = label
	}
	
    var body: some View {
		VStack {
			NavigationLink(destination: self.destination) {
				Text(self.label)
			}
			.buttonStyle(CustomNavLink())
			
			Divider()
		}
    }
}

struct CustomNavLink: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.font(.title)
			.padding(.vertical, 12)
			.padding(.horizontal, 20)
			.frame(maxWidth: .infinity)
			.scaleEffect(configuration.isPressed ? 0.99: 1)
		
	}
}


struct NavLink_Previews: PreviewProvider {
    static var previews: some View {
		NavLink("Link", destination: AnyView(Text("Destination")))
    }
}

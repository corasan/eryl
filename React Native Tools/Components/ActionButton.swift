//
//  ActionButton.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import SwiftUI

struct ActionButton: View {
	var label: String
	var icon: String
	var action: (() -> Void)?

	init(label: String, icon: String, action: (() -> Void)? = nil) {
		self.label = label
		self.action = action
		self.icon = icon
	}

	func doSomething() {
		print("hello")
	}

    var body: some View {
		Button(action: {
			if(self.action != nil) {
				self.action!()
			} else {
				doSomething()
			}
		}, label: {
			HStack {
				Text(self.label)
				Spacer()
				Text(.init(systemName: self.icon))
			}
		})
		.buttonStyle(CustomButtonStyle())
		.padding(.vertical, 10)
    }
}

struct CustomButtonStyle: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.font(.title)
			.padding(.vertical, 12)
			.padding(.horizontal, 20)
			.frame(maxWidth: 240)
			.background(
				ZStack {
					RoundedRectangle(cornerRadius: 8, style: .continuous)
						.shadow(color: .gray, radius: configuration.isPressed ? 1: 6, x: configuration.isPressed ? 1: 1, y: configuration.isPressed ? 1: 1)
						.blendMode(.overlay)
				}
			)
			.scaleEffect(configuration.isPressed ? 0.99: 1)
		
	}
}

struct ActionButton_Previews: PreviewProvider {
	static func some() {
		print("some")
	}

    static var previews: some View {
		ActionButton(label: "Label", icon: "house", action: some)
    }
}

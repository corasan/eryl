//
//  TerminalText.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import SwiftUI

struct TerminalText: View {
	var text: String
	
	init(_ text: String) {
		self.text = text
	}
	
	func copy(_ text: String) {
		let pb = NSPasteboard.general
		pb.clearContents()
		let regex = try! NSRegularExpression(pattern: "\\[(.*?)\\]", options: NSRegularExpression.Options.caseInsensitive)
		let range = NSMakeRange(0, text.count)
		let newStr = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "")
		pb.setString(newStr, forType: .string)
	}
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(self.text)
				.font(Font.custom("MeloLGS NF", size: 16))
				.fontWeight(.medium)
			Divider()
		}
		.padding(.top, 12)
		.frame(minWidth: .infinity)
		.contextMenu(ContextMenu(menuItems: {
			Button("Copy Log") {
				copy(text)
			}
		}))
    }
}

struct TerminalText_Previews: PreviewProvider {
    static var previews: some View {
		TerminalText("LOGS")
    }
}

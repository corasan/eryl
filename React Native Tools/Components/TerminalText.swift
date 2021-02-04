//
//  TerminalText.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import SwiftUI

struct TerminalText: View {
	var text: String
	
	init(text: String) {
		self.text = text
	}
    var body: some View {
		Text(self.text)
			.font(Font.custom("MeloLGS NF", size: 16))
			.fontWeight(.medium)
    }
}

struct TerminalText_Previews: PreviewProvider {
    static var previews: some View {
		TerminalText(text: "")
    }
}

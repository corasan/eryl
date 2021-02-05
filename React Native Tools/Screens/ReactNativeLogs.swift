//
//  ReactNativeLogs.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import SwiftUI

extension NSTextView {
	open override var frame: CGRect {
		didSet {
			backgroundColor = .clear
			drawsBackground = true
		}
	}
}

struct ReactNativeLogs: View {
	@EnvironmentObject var app: ReactNativeAppTools
	
    var body: some View {
		ScrollView {
			HStack {
				VStack(alignment: .leading) {
					TextEditor(text: $app.output)
						.font(Font.custom("MeloLGS NF", size: 16))
						.background(Color("terminalBg"))
						.disabled(true)
						.disableAutocorrection(true)
						.multilineTextAlignment(.leading)
						.allowsTightening(false)
					Spacer()
				}
				.background(Color("terminalBg"))
				Spacer()
			}
		}
		.padding(.horizontal, 20)
		.padding(.top, 10)
		.padding(.bottom, 5)
		.background(Color("terminalBg"))
	}
}

struct ReactNativeLogs_Previews: PreviewProvider {
    static var previews: some View {
        ReactNativeLogs()
			.environmentObject(ReactNativeAppTools())
    }
}

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
	var exampleList = ["LOG", "BUNDLE"]
	
    var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				ForEach(app.outputArr, id: \.self) { str in
					TerminalText(str)
				}
				HStack {
					Spacer()
					Spacer()
				}
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

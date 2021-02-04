//
//  ReactNativeLogs.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import SwiftUI

struct ReactNativeLogs: View {
	@EnvironmentObject var app: ReactNativeAppTools
	
    var body: some View {
		ScrollView {
			HStack {
				VStack(alignment: .leading) {
					ForEach(Array(app.output.enumerated()), id: \.offset) { (i, el) in
						TerminalText(text: el)
					}
				}
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

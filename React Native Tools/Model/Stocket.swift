//
//  Stocket.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import Foundation

class Stocket: ObservableObject {
	@Published var isRunning: Bool = false
	@Published var server: Process?
	private var path = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	
	init() {
		self.server = nil
	}

	func start() {
		let dispatchQue = DispatchQueue(label: "Start React Native Server", qos: .background)
		dispatchQue.async {
			self.startServer()
		}
	}
	
	private func startServer() {
		self.server = Process()
		let pipe = Pipe()
		self.server!.standardOutput = pipe
		self.server!.environment = ["PATH": path]
		self.server!.currentDirectoryPath = "/Users/henry/Projects/ReactNative/stocket"
		self.server!.arguments = ["-c", "yarn start"]
		self.server!.launchPath = "/bin/zsh"
		self.server!.launch()

		let data = pipe.fileHandleForReading.readDataToEndOfFile()
		let output = String(data: data, encoding: .utf8)!
		
		print(output)
	}
}

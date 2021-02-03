//
//  Stocket.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/2/21.
//

import Foundation

class Stocket: ObservableObject {
	@Published var isRunning: Bool = false
	var server: Process?
	var pipe: Pipe?
	var output = ""
	private var path = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	private var dispatchGroup: DispatchGroup
	
	init() {
		self.server = nil
		self.pipe = nil
		self.dispatchGroup = DispatchGroup()
	}

	func start() {		
		DispatchQueue.main.async {
			self.dispatchGroup.enter()
			DispatchQueue(label: "React Native Server", qos: .background).async {
				self.startServer()
				self.dispatchGroup.leave()
			}
			self.isRunning = true
			
			self.dispatchGroup.enter()
			DispatchQueue(label: "React Native Server", qos: .background).async {
				self.startServerOutputPipe()
			}
		}
	}
	
	func stop() {
		self.server!.terminate()
		self.server = nil
		self.pipe = nil
		DispatchQueue.main.async { self.isRunning = false }
	}
	
	private func startServer() {
		self.server = Process()
		self.server!.environment = ["PATH": path]
		self.server!.currentDirectoryPath = "/Users/henry/Projects/ReactNative/stocket"
		self.server!.arguments = ["-c", "yarn start"]
		self.server!.launchPath = "/bin/zsh"
		self.server!.launch()
	}
	
	private func startServerOutputPipe() {
		self.pipe = Pipe()
		self.server!.standardOutput = self.pipe
		let data = self.pipe!.fileHandleForReading.readDataToEndOfFile()
		self.output = String(data: data, encoding: .utf8)!
		print(self.output)
	}
}

//
//  Stocket.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import Foundation

class App: ObservableObject {
	@Published var isRunning: Bool = false
	var server: Process?
	var pipe: Pipe?
	var output = ""
	private var path = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	private var dispatchGroup: DispatchGroup
	private var projectPath = "/Users/henry/Projects/ReactNative/stocket"
	
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
				if (self.server != nil) {
					self.dispatchGroup.leave()
				}
			}
			self.isRunning = true
			
			self.dispatchGroup.enter()
			DispatchQueue(label: "Server Output", qos: .background).async {
				self.dispatchGroup.wait()
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
	
	func runOnSimulator() {
		let process = createProcess("yarn ios")
		process.launch()
	}
	
	private func createProcess(_ command: String) -> Process {
		let process = Process()
		process.environment = ["PATH": path]
		process.currentDirectoryPath = self.projectPath
		process.launchPath = "/bin/zsh"
		process.arguments = ["-c", command]
		return process
	}
	
	private func startServer() {
		self.server = createProcess("yarn start")
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

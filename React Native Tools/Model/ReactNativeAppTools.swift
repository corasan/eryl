//
//  Stocket.swift
//  React Native Tools
//
//  Created by Henry Paulino on 2/3/21.
//

import Foundation
import SwiftUI

class ReactNativeAppTools: ObservableObject {
	@Published var isRunning: Bool = false
	var server: Process?
	var pipe: Pipe?
	@Published var outputArr = [String]()
	@Published var output = ""
	private var path = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	private var dispatchGroup: DispatchGroup
	private var projectPath = "/Users/henry/Projects/ReactNative/stocket"
	
	init() {
		self.server = nil
		self.pipe = nil
		self.dispatchGroup = DispatchGroup()
		
		NotificationCenter.default.addObserver(forName: NSApplication.willTerminateNotification, object: nil, queue: .main) { _ in
			if(self.isRunning) {
				self.server!.terminate()
			}
		}
	}
	
	func start() {
		DispatchQueue.main.async {
			let group1 = DispatchGroup()
			group1.enter()
			DispatchQueue(label: "React Native Server", qos: .background).async {
				if (self.server == nil) {
					self.startServer()
					group1.leave()
				}
			}
			self.isRunning = true
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
		self.pipe = Pipe()
		self.server!.standardOutput = self.pipe
		let data = self.pipe!.fileHandleForReading
		data.readabilityHandler = self.handleOutput
		self.server!.launch()
	}
	
	private func handleOutput(pipe: FileHandle) {
		let line = String(data: pipe.availableData, encoding: .utf8)
		DispatchQueue.main.async {
			let startedServerStr = "React Native Server Started"
			if (!self.outputArr.contains(startedServerStr)) {
				self.outputArr.append(startedServerStr)
			}
			if (line!.contains("WARN") || line!.contains("LOG") || line!.contains("BUNDLE")) {
				self.outputArr.append(line!)
				self.output = self.outputArr.joined(separator: "")
			}
		}
	}
}

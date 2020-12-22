//
//  AppDelegate.swift
//  MacStats
//
//  Created by Steven Marrocco on 2020-12-21.
//

import Cocoa
import SwiftUI
import Foundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBarItem: NSStatusItem!
    var cpuUsage: CpuUsage!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.cpuUsage = CpuUsage()
    
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            button.title = String(self.cpuUsage.updateInfo()) + "%"
            
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            button.title = String(self.cpuUsage.updateInfo()) + "%"
            }
        }
    }
}


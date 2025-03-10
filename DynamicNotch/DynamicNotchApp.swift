//
//  DynamicNotchApp.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/3/25.
//

import SwiftUI

@main
struct DynamicNotchApp: App {
    
    var body: some Scene {
        MenuBarExtra("DynamicNoych", systemImage: "person.fill")
        {
            SettingsLink(label: {
                Text("Setting")
            })
            .keyboardShortcut(".", modifiers: .command)
            
            Button(action: {
                NSApp.terminate(nil) //종료하는 것
            }, label: {
                Text("Quit")
            })
            .keyboardShortcut("Q", modifiers: .command)
        }
        
        
        Settings {
            SettingView()
        }
    }
}

//
//  ETRobocon2023App.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/07/01.
//

import SwiftUI

@main
struct ETRobocon2023App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SelectedCommandViewModel())
        }
    }
}

//
//  landmarksApp.swift
//  landmarks
//
//  Created by yakir on 2022/6/12.
//

import SwiftUI

@main
struct landmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

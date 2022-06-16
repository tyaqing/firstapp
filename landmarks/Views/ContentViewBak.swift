//
//  ContentView.swift
//  landmarks
//
//  Created by yakir on 2022/6/12.
//

import SwiftUI

struct ContentViewBak: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentViewBak_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 mini"], id: \.self) { deviceName in
            ContentViewBak()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            
        }
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by Kishan on 01/01/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .yellow

        UINavigationBar.appearance().backgroundColor = .systemBackground // backgorund color with gradient
        UINavigationBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().tintColor = .systemBackground
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        UINavigationBar.appearance().isTranslucent = true

        
    }
    
    @State var selectedIndex = 0
    @State var shouldShowModel = false
    var home_tab_RootView = HomeView()
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer().fullScreenCover(isPresented: $shouldShowModel) {
                VStack {
                    Text("Model screen")
                    Button {
                        shouldShowModel = false
                    } label: {
                        Text("Dismiss")
                    }
                    
                }
            }
            
            switch selectedIndex {
            case 0:
                home_tab_RootView
            case 1:
                NavigationView {
                    Text("Hi1").navigationTitle("Second Tab").navigationBarTitleDisplayMode(.inline)
                }
            case 2:
                Text("Hi2").navigationTitle("First")
            case 3:
                ScrollView {
                    ForEach(0..<100) { i in
                        Text("\(i)")
                    }
                }
            case 4:
                NavigationView {
                    Text("Hi4").navigationTitle("First")
                }
            default :
                Text("Hi 1")
            }
            
            CustomTabView(selectedIndex: selectedIndex) { index in
                if index == 2 {
                    shouldShowModel = true
                    return
                }
                selectedIndex = index
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

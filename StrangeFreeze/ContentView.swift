//
//  ContentView.swift
//  StrangeFreeze
//
//  Created by Gong Zhang on 2024/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Page1()
                } label: {
                    Text("Go to Page 1")
                }
            }
        }
    }
}

struct Page1: View {
    @Environment(\.dismiss) private var dismiss
    @State private var string: String = ""
    
    var body: some View {
        List {
            NavigationLink {
                List {
                    Page2(string: $string)
                        .simpleValue(4)
                }
            } label: {
                // 👀 The app will freeze if this cell is tapped, and the SwiftUI
                // will go into an infinite loop.
                //
                // 1. see "RootCause.swift" file
                //
                // 2. I know the problem can also be worked around by changing the way
                //    we define the views here, but I want to reveal the root cause instead.
                //
                // 3. the problem is reproducible on iOS 17-18.1 (at least)
                Text("Tap this button will freeze the app")
            }
        }
        .navigationTitle("Page 1")
    }
}

struct Page2: View {
    @Binding var string: String?
    
    init(string: Binding<String>) {
        self._string = Binding(string)
    }
    
    var body: some View {
        Text("Page 2")
    }
}

extension EnvironmentValues {
    @Entry var simpleValue: Int = 3
}

extension View {
    func simpleValue(_ value: Int) -> some View {
        self.environment(\.simpleValue, value)
    }
}

#Preview {
    ContentView()
}

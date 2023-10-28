//
//  ContentView.swift
//  BillCalculation
//
//  Created by Omid Shojaeian Zanjani on 28/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TenantsOverview()
                .tabItem {
                    VStack{
                        Image(systemName: "circle")
                            Text("Tenants")
                    }
                }
            BillsOverview()
                .tabItem {
                    VStack{
                        Image(systemName: "circle")
                            Text("Bills")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

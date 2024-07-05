//
//  ContentView.swift
//  hackathon
//
//  Created by vano Kvakhadze on 05.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
           MentrosView()
        }
        .environmentObject(viewModel)
        
    }
}

#Preview {
    ContentView()
}

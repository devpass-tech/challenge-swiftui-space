//
//  LaunchView.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Button("Show Complete Details View") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        CompleteDetailsView()
                    }
        }
    }
}

//MARK: - PreviewProvider
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

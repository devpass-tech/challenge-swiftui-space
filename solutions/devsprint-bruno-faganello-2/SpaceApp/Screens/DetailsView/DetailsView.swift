//
//  DetailsView.swift
//  SpaceApp
//
//  Created by Bruno Silva on 27/04/22.
//

import SwiftUI

struct DetailsView: View {
    
    var body: some View {
        
        // MARK: - ZStack
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            // MARK: - VStack
            VStack(spacing: 10) {
                Text("Details")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading)
                
                Text("SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contact, this mission...")
                    .font(.headline)
                    .padding(.leading)
                    .foregroundColor(.gray)
                    .lineLimit(3)
                
                Button {
                    print("Some informations..")
                } label: {
                    Text("See more")
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}

// MARK: - Preview
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

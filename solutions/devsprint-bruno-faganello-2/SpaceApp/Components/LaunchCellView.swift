//
//  LaunchCellView.swift
//  SpaceApp
//
//  Created by Guilherme Strutzki on 26/04/22.
//

import SwiftUI

struct LaunchCellViewConfiguration {
    let id: String
    let name: String
    let date: String
    let status: String
    let imageUrl: String
}

struct LaunchCellView: View {
    var configuration: LaunchCellViewConfiguration
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(hex: "#1C1C1E"))
                .padding(10)
                .frame(width: 400, height: 200)
            
            HStack(spacing: 16) {
                AsyncImage(
                    url: URL(string: configuration.imageUrl),
                  content: { image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }, placeholder: {
                  Color.gray
                })
                  .frame(width: 125, height: 125)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(configuration.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(configuration.date)
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text(configuration.status)
                        .font(.title3)
                        .foregroundColor(.gray)

                }
                
                
                Text("#\(configuration.id)")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .offset(x: 0, y: -60)
            }
            
            
        }
    }
}

struct LaunchCellView_Previews: PreviewProvider {
    static var previews: some View {
        let mockedImageUrl = "https://images2.imgbox.com/40/e3/GypSkayF_o.png"
        
        LaunchCellView(configuration: LaunchCellViewConfiguration(id: "3",
                                                                  name: "Starlink 4-2",
                                                                  date: "July 03, 2020",
                                                                  status: "Success",
                                                                  imageUrl: mockedImageUrl))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.black))
            .ignoresSafeArea()
    }
}

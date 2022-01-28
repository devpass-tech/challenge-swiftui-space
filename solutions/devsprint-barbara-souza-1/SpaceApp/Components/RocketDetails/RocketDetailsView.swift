//
//  RocketDetailsView.swift
//  SpaceApp
//
//  Created by Mobile2you on 27/01/22.
//

import SwiftUI

struct RocketDetailsView: View {
    
    let viewModel: RocketDetailsViewModel
    
    init(
        viewModel: RocketDetailsViewModel = RocketDetailsViewModel()
    ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                rocketName
                
                rocketImage
                
                rocketManufacturer
                
                rocketPayloaDescription
                
                Spacer()
            }
            .padding(30)
        }
    }
    
    var rocketName: some View {
        Text(viewModel.rocketName)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var rocketImage: some View {
        AsyncImage(url: URL(string: viewModel.rocketImageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            case .failure:
                Text(viewModel.patchImageFailureWarning)
                    .foregroundColor(.red)
            @unknown default:
                Text(viewModel.patchImageUnknownError)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var rocketManufacturer: some View {
        Text(viewModel.rocketManufacturer)
            .font(.system(size: 22, weight: .semibold))
    }
    
    var rocketPayloaDescription: some View {
        Text(viewModel.rocketPayloadDescription)
          .foregroundColor(.descriptionColorGray)
          .font(.system(size: 22))
          .lineSpacing(2)
    }
}

struct RocketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailsView()
            .preferredColorScheme(.dark)
    }
}

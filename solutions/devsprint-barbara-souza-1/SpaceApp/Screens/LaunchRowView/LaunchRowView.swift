//
//  LaunchRowView.swift
//  SpaceApp
//
//  Created by Diego Llopis on 24/01/22.
//

import SwiftUI

struct LaunchRowView: View {
    
    //MARK: - Constants
    let notFoundInfo = "Info not found"
    let backgroundCellHeight: CGFloat = 160
    let patchImageDimension: CGFloat = 130
    let backgroundColor = Color(.sRGB, red: 28/255, green: 28/255, blue: 30/255, opacity: 1)
    
    //MARK: - Variables
    var viewModel: LaunchRowViewModel?
    
    //MARK: - Init
    init(
        viewModel: LaunchRowViewModel = LaunchRowViewModel()
    ) {
        self.viewModel = viewModel
    }
    
    //MARK: - Main View
    var body: some View {
        ZStack {
            cellBackgroundColor
                
            HStack(spacing: 20) {
                launchMissionPatchView
                    
                launchInfoView
                
                launchNumberView
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: backgroundCellHeight)
        .padding(.horizontal, 20)
    }
    
    //MARK: - Subviews
    var cellBackgroundColor: some View {
        backgroundColor
            .cornerRadius(10)
    }
    
    var launchMissionPatchView: some View {
        AsyncImage(url: URL(string: viewModel?.launchPatchURL ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Text("Failed fetching image. Make sure to check your data connection and try again.")
                    .foregroundColor(.red)
            @unknown default:
                Text("Unknown error. Try again.")
                    .foregroundColor(.red)
            }
        }
        .frame(width: patchImageDimension, height: patchImageDimension)
    }
    
    var launchInfoView: some View {
        VStack (alignment: .leading, spacing: 10){
            Text(viewModel?.launchName ?? notFoundInfo)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .semibold))
            Text(viewModel?.launchDate ?? notFoundInfo)
            Text(viewModel?.launchStatus ?? notFoundInfo)
        }
        .foregroundColor(.gray)
        .font(.system(size: 20, weight: .semibold))
    }
    
    var launchNumberView: some View {
        Text(viewModel?.launchNumber ?? notFoundInfo)
            .foregroundColor(.gray)
            .font(.system(size: 20, weight: .semibold))
            .padding(.top, -65)
    }
}

//MARK: - Previews
struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView()
            .preferredColorScheme(.dark)
    }
}

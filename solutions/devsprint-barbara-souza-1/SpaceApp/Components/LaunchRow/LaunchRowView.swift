//
//  LaunchRowView.swift
//  SpaceApp
//
//  Created by Mobile2you on 27/01/22.
//

import SwiftUI

struct LaunchRowView: View {
    
    //MARK: - Constants
    let backgroundCellHeight: CGFloat = 160
    let patchImageDimension: CGFloat = 130
    
    //MARK: - Variables
    var viewModel: LaunchRowViewModel
    
    //MARK: - Init
    init(viewModel: LaunchRowViewModel = LaunchRowViewModel()) {
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
    }
    
    //MARK: - Subviews
    var cellBackgroundColor: some View {
        Color.appGray
            .cornerRadius(10)
    }
    
    var launchMissionPatchView: some View {
        AsyncImage(url: URL(string: viewModel.launchPatchURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Text(viewModel.patchImageFailureWarning)
                    .foregroundColor(.red)
            @unknown default:
                Text(viewModel.patchImageUnknownError)
            }
        }
        .frame(width: patchImageDimension, height: patchImageDimension)
    }
    
    var launchInfoView: some View {
            VStack (alignment: .leading, spacing: 10){
                Text(viewModel.launchName)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                Text(viewModel.launchDate)
                Text(viewModel.launchStatus)
            }
            .foregroundColor(.gray)
            .font(.system(size: 20, weight: .semibold))
        }

        var launchNumberView: some View {
            Text(viewModel.launchNumber)
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

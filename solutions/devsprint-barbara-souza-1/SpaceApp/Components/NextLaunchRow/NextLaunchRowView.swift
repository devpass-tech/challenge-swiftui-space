//
//  NextLaunchRowView.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 24/01/22.
//

import SwiftUI

struct NextLaunchRowView: View {
    // MARK: Properties
    var viewModel: NextLaunchRowViewModelRepresentable
    var imageSize: CGFloat = 130
    var backgroundColor: Color = .appGray

    // MARK: Initializer
    init(viewModel: NextLaunchRowViewModelRepresentable = NextLaunchRowViewModel()) {
         self.viewModel = viewModel
    }

    // MARK: Main View
    var body: some View {
        ZStack {
            backgroundColor
            VStack(alignment: .leading, spacing: 20) {
                topView
                detailsView
            }
            .padding()
        }
        .cornerRadius(15)
        .frame(height: 260)
    }

    // MARK: Subviews
    var topView: some View {
        HStack(spacing: 10) {
            AsyncImage(url: viewModel.imageUrl) { phase in
                switch phase {
                case .empty:
                    Image(viewModel.imageRocket)
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                    
                case let .success(image):
                    image
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                
                case .failure:
                    Image(viewModel.imageRocket)
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                
                @unknown default:
                    Image(viewModel.imageRocket)
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.name)
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                Text(viewModel.flightNumber)
                    .foregroundColor(.gray)
                    .font(.system(size: 22, weight: .regular))
                Text(viewModel.launchDate)
                    .foregroundColor(.gray)
                    .font(.system(size: 20, weight: .semibold))
            }
        }
    }

    var detailsView: some View {
        Text(viewModel.details)
            .lineLimit(3)
            .foregroundColor(.gray)
            .font(.system(size: 20, weight: .regular))
    }
}

struct NextLaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchRowView()
            .padding()
            .preferredColorScheme(.dark)
    }
}

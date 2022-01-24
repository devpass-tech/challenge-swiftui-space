//
//  NextLaunchRowView.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 24/01/22.
//

import SwiftUI

struct NextLaunchRowView: View {
    // MARK: Properties
    var viewModel = NextLaunchRowViewModel()
    var imageSize: CGFloat = 130
    var backgroundColor = Color(.sRGB, red: 28/255, green: 28/255, blue: 30/255, opacity: 1)

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
        .frame(width: .infinity, height: 260)
    }

    // MARK: Subviews
    var topView: some View {
        HStack(spacing: 10) {
            Image(viewModel.imageRocket)
                .resizable()
                .frame(width: imageSize, height: imageSize)
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
    }
}

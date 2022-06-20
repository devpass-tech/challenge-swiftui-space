//
//  LaunchCellView.swift
//  SpaceApp
//
//  Created by Murillo R. Araújo on 14/06/22.
//

import SwiftUI

struct LaunchCellView: View {

    let viewModel: LaunchCellViewModel

    var body: some View {
        HStack(spacing: 0) {
            Image(viewModel.image)
                .resizable()
                .frame(width: 125, height: 125)
                .padding(16)

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primaryLB)

                Text(viewModel.date)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.secondaryLB)

                Text(viewModel.status)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.secondaryLB)
            }

            Spacer()

            VStack {
                Text(viewModel.number)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding(16)
        }
        .frame(height: 157)
        .background(Color.secondaryBG)
        .cornerRadius(10)
    }
}

struct LaunchCellView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LaunchCellViewModel(
            image: "falcon",
            name: "FalconSat",
            date: "July 03, 2022",
            status: "Success",
            number: "#91"
        )

        LaunchCellView(viewModel: model)
            .padding(.horizontal, 16)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 200))
    }
}

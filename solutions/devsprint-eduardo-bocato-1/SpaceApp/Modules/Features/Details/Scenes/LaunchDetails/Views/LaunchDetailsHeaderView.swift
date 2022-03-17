//
//  LaunchDetailsHeaderView.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 15/03/22.
//

import SwiftUI

struct LaunchDetailsHeaderView: View {
    struct Model {
        let image: Image
        let title: String
        let subTitle: String
        let dateDescription: String
    }

    let launchDetailsModel: Model

    var body: some View {
        VStack(
            alignment: .center
        ) {
            Image("badge")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(.dsCornerRadius(.xxSmall))

            Text(launchDetailsModel.title)
                .dsTypography(.headline)
                .foregroundColor(.white)

            Text(launchDetailsModel.subTitle)
                .dsTypography(.body)
                .lineLimit(3)
                .foregroundColor(.gray)

            Text(launchDetailsModel.dateDescription)
                .dsTypography(.body)
                .lineLimit(3)
                .foregroundColor(.gray)

            Spacer()
        }
        .frame(height: 220)
    }
}

#if DEBUG
extension LaunchDetailsHeaderView.Model {
    static func fixture (
        image: Image = Image("development_badge"),
        title: String = "CRS-20",
        subTitle: String = "Success",
        dateDescription: String = "Mar 15, 2022"
    ) -> Self {
        .init(
            image: image,
            title: title,
            subTitle: subTitle,
            dateDescription: dateDescription
        )
    }
}
#endif

#if DEBUG
struct LaunchDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsHeaderView(launchDetailsModel: .fixture())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        LaunchDetailsHeaderView(launchDetailsModel: .fixture())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
#endif

//
//  LaunchDetailsHeaderView.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 15/03/22.
//

import SwiftUI

struct LaunchDetailsHeaderView: View {
    struct Model {
        let image: UIImage
        let title: String
        let subTitle: String
        let dateDescription: String
    }

    let model: Model

    var body: some View {
        VStack(
            alignment: .center
        ) {
            Image(uiImage: model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(.dsCornerRadius(.xxSmall))

            Text(model.title)
                .dsTypography(.headline)
                .foregroundColor(.white)

            Text(model.subTitle)
                .dsTypography(.descriptionLabel)
                .foregroundColor(.gray)

            Text(model.dateDescription)
                .dsTypography(.descriptionLabel)
                .foregroundColor(.gray)

            Spacer()
        }
        .frame(height: 220)
    }
}

#if DEBUG
extension LaunchDetailsHeaderView.Model {
    static func fixture (
        image: UIImage = UIImage(named: "badge")!,
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
        LaunchDetailsHeaderView(model: .fixture())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        LaunchDetailsHeaderView(model: .fixture())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
#endif

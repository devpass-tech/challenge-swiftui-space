//
//  LaunchCard.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 15/03/2022.
//

import SwiftUI

struct LaunchCard: View {
    struct Model {
        let imageURL: String
        let date: String
        let name: String
        let number: Int
        let state: Bool
    }
    
    let model: Model
    
    var body: some View {
        HStack(
            alignment: .top
        ){
            Spacer()
            VStack(
                alignment: .leading,
                spacing: .dsSpacing(.tiny)
            ) {
                Text(model.name)
                    .dsTypography(.headline)
                Text(model.date)
                Text(model.state ? "Success" : "Failure")
            }
            Spacer()
            Text("#\(model.number)")
            Spacer()
        }
    }
}

#if DEBUG
extension LaunchCard.Model {
    static func fixture (
        imageURL: String = "",
        date: String = "July 03, 2020",
        name: String = "CRS-20",
        number: Int = 91,
        state: Bool = true
    ) -> Self {
        .init(
            imageURL: imageURL,
            date: date,
            name: name,
            number: number,
            state: state
        )
    }
}
#endif

#if DEBUG
struct LaunchCard_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCard(model: .fixture())
            .preferredColorScheme(.light)
        LaunchCard(model: .fixture())
            .preferredColorScheme(.dark)
    }
}
#endif

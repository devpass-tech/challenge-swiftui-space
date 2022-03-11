//
//  ErrorView.swift
//  SpaceApp
//
//  Created by Elena Diniz on 3/10/22.
//

import SwiftUI

struct ErrorView: View {
    private let title: String
    private let subtitle: String
    private let dismissAction: (() -> Void)?
    
    init(title: String,
         subtitle: String,
         dismissAction: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.dismissAction = dismissAction
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
            
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            Button(action: {
                guard let dismissAction = dismissAction else {
                    return
                }
                dismissAction()
            },
                   label: {
                Text("OK")
                    .bold()
                    .frame(width: 200, height: 48)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(5)
            })
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: "Title",
                  subtitle: "Put your substitle here!",
                  dismissAction: {})
    }
}

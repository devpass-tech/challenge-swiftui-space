//
//  NavigationSceneView.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 10/03/22.
//

import SwiftUI

public struct NavigationSceneView<Content: View>: View {

    private let title: LocalizedStringKey
    private let content: () -> Content

    public init(title: LocalizedStringKey, content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    public var body: some View {
        NavigationView {
             content()
            .navigationTitle(title)
        }.navigationViewStyle(.stack)
    }
}

public struct NavigationSceneView_Previews: PreviewProvider {
    public static var previews: some View {
        NavigationSceneView(title: SpaceApp.Common.appTitle, content: {
            Text(SpaceApp.Common.appTitle)
        })
    }
}

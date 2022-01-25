//
//  DetailView.swift
//  SpaceApp
//
//  Created by cassia franco on 25/01/22.
//

import SwiftUI

struct DetailsView: View {
    
    var viewModel = DetailViewModel()
    init(viewModel: DetailViewModel = DetailViewModel()) {
        self.viewModel = viewModel
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.gray)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
            VStack(){
                TextView(text: viewModel.description )
                    .padding()
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .background(.black)
        }
    }
}
//MARK: - UIViewRepresentable methods

struct TextView: UIViewRepresentable {
    
    var text: String
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textColor = .gray
        textView.textAlignment = .justified
        textView.backgroundColor = UIColor.black
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

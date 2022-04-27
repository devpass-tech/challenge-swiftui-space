//
//  SpCustomBtn.swift
//  SpaceApp
//
//  Created by Tatiana Rico on 26/04/22.
//

import SwiftUI

struct SpCustomBtn: View {
    var colorText: Color?
    var colorBtn: Color?
    var action: () -> Void
    
    init(colorText: Color = .black, colorBtn: Color = .blue, action: @escaping () -> Void) {
        self.colorText = colorText
        self.colorBtn = colorBtn
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                     action()
                    }) {
                        Text("Press Me")
                    }
                    .foregroundColor(colorText)
                    .frame(width: 350, height: 40.0, alignment: .center)
                    .padding(.all, 20)
                    .background(colorBtn)
                    .cornerRadius(16)
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpCustomBtn {
            print("Button Tapped")
        }
    }
}

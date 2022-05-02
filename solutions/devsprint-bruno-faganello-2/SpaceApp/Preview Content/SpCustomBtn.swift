//
//  SpCustomBtn.swift
//  SpaceApp
//
//  Created by Tatiana Rico on 02/05/22.
//

import Foundation
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
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
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

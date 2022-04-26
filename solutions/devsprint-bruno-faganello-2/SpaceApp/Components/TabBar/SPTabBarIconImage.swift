//
//  SPTabBarIconImage.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

fileprivate typealias Constants = SPConstants.SPTabBarIconImage

struct SPTabBarIconImage: View {
    
    //MARK: - Propertie
    @Binding var currentPageSelected: SPTabBarPages
    
    let page: SPTabBarPages
    let heighIcon: CGFloat
    let widthIcon: CGFloat
    
    private var isCurrentPage: Bool { page == currentPageSelected }
    
    //MARK: - Body
    var body: some View {
        VStack {
            page.icon.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: widthIcon, height: heighIcon)
                .padding(.top, Constants.imagePaddginTop)
            
            page.tabBarName.SP.asText
                .font(.footnote)
        }
        .foregroundColor(isCurrentPage ? .SP.blueSelected : .SP.grayUnselected)
        .padding(.horizontal, Constants.VStackHorizontalPaddin)
        .onTapGesture { currentPageSelected = page }
    }
}

//MARK: - PreviewProvider
struct SPTabBarIconImage_Previews: PreviewProvider {
    static var previews: some View {
        let currentPageSelected: Binding<SPTabBarPages> = .constant(.home)
        
        SPTabBarIconImage(
            currentPageSelected: currentPageSelected,
            page: .home,
            heighIcon: Constants.previewIconHeight,
            widthIcon: Constants.previewIconHeight
        )
        
        SPTabBarIconImage(
            currentPageSelected: currentPageSelected,
            page: .launch,
            heighIcon: Constants.previewIconHeight,
            widthIcon: Constants.previewIconHeight
        )
    }
}

import SwiftUI

struct DetailsHeaderViewConstants {
    static let imageSize: CGFloat = 125
    static let titleTextSize: CGFloat = 24
    static let subtitleTextSize: CGFloat = 20
}

struct DetailsHeaderView: View {
    // MARK: Properties
    var viewModel: DetailsHeaderViewModel
    var imageSize: CGFloat = DetailsHeaderViewConstants.imageSize
    var backgroundColor: Color = .appGray
    
    init(viewModel: DetailsHeaderViewModel = DetailsHeaderViewModel()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            backgroundColor
            VStack(alignment: .center, spacing: 20){
                imageView
                detailsView
            }
            .padding()
            .frame(height: 260)
        }
    }
    
    var imageView: some View {
        AsyncImage(url: viewModel.imageUrl) { phase in
            switch phase {
            case .empty:
                Image(viewModel.imageRocket)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                
            case let .success(image):
                image
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
            
            case .failure:
                Image(viewModel.imageRocket)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
            
            @unknown default:
                Image(viewModel.imageRocket)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
            }
        }
    }
    
    var detailsView: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(viewModel.name)
                .foregroundColor(.white)
                .font(.system(size: DetailsHeaderViewConstants.titleTextSize, weight: .semibold))
            Text(viewModel.wasSuccessful)
                .foregroundColor(.gray)
                .font(.system(size: DetailsHeaderViewConstants.subtitleTextSize, weight: .regular))
            Text(viewModel.date)
                .foregroundColor(.gray)
                .font(.system(size: DetailsHeaderViewConstants.subtitleTextSize, weight: .regular))
        }
    }
    
}

struct DetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHeaderView()
            .padding()
            .preferredColorScheme(.dark)
    }
}

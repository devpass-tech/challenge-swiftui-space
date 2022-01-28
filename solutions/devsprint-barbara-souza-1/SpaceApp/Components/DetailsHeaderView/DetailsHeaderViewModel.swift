
import Foundation

struct DetailsHeaderViewModel {
    
    var imageUrl: URL? {
        URL(string: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")!
    }
    
    var imageRocket: String {
        "image-launch"
    }
    
    var name: String {
        "Falcon Heavy"
    }

    var wasSuccessful: String = "Success"
    
    var date: String {
        "July 03, 2020"
    }
}


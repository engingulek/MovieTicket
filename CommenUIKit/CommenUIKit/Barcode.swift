import UIKit

public class BarcodeGenerator {
  public  class func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: .utf8)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            if let outputCIImage = filter.outputImage {
                let scaleX = 200 / outputCIImage.extent.width
                let scaleY = 100 / outputCIImage.extent.height
                let transformedImage = outputCIImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                return UIImage(ciImage: transformedImage)
            }
        }
        
        return nil
    }
}


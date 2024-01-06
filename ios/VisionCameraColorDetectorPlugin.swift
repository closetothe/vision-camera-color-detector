import Foundation
import UIImageColors

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
}

@objc(VisionCameraColorDetectorPlugin)
public class VisionCameraColorDetectorPlugin: FrameProcessorPlugin {
  private static let context = CIContext(options: nil)

  @objc
  public static func callback(_ frame: Frame!, withArgs args: [AnyHashable: Any]?) -> Any! {
    guard let imageBuffer = CMSampleBufferGetImageBuffer(frame.buffer) else {
      print("Failed to get CVPixelBuffer!")
      return nil
    }
    let ciImage = CIImage(cvPixelBuffer: imageBuffer)
    guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
      print("Failed to create CGImage!")
      return nil
    }
    let image = UIImage(cgImage: cgImage)
    var quality: UIImageColorsQuality = .lowest

    if args != nil && !args!.isEmpty {
      if let qualityArg = args?["quality"] as? NSString {
        switch (qualityArg) {
          case "lowest":
            quality = .lowest
          case "low":
            quality = .low
          case "high":
            quality = .high
          case "highest":
            quality = .highest
          default:
            quality = .lowest
        }
      }
    }

    guard let colors = image.getColors(quality: quality) else {
      print("Failed to detect colors")
      return nil
    }
    
    return [
        "primary": colors.primary.toHexString(),
        "secondary": colors.secondary.toHexString(),
        "background": colors.background.toHexString(),
        "detail": colors.detail.toHexString(),
    ]
  }
}

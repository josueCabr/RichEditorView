import Foundation
import UIKit

public enum RichEditorFonts {
    fileprivate static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    /// Call this function on your `@main` class or `AppDelegate` class to regist fonts supported by the editor
    public static func register() {
        registerFont(bundle: .module, fontName: "Roboto-Regular", fontExtension: "ttf")
    }
}


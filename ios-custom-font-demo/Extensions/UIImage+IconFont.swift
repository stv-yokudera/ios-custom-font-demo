//
//  UIImage+IconFont.swift
//  ios-custom-font-demo
//
//  Created by OkuderaYuki on 2017/08/09.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// IconFontからUIImageを生成する
    ///
    /// - Parameters:
    ///   - icon: IconFont名
    ///   - fontSize: 基のフォントサイズ (default: 20.0)
    ///   - rect: 生成する画像のサイズ (default: CGSize(width: 20.0, height: 20.0))
    ///   - color: 生成する画像の色 (default: .blue)
    /// - Returns: 画像
    class func iconFont(icon: IconFont,
                        fontSize: CGFloat = 20.0,
                        rect: CGSize = CGSize(width: 20.0, height: 20.0),
                        color: UIColor = .blue) -> UIImage? {
        
        guard let font = UIFont(name: FontName.icomoon, size: fontSize) else { return nil }
        UIGraphicsBeginImageContextWithOptions(rect, false, 0.0)
        let attributes = [NSForegroundColorAttributeName: color,
                          NSFontAttributeName: font]
        let attributedString = NSAttributedString(string: icon.rawValue,
                                                  attributes: attributes)
        
        let context = NSStringDrawingContext()
        let boundingRect = attributedString.boundingRect(with: CGSize(width: fontSize, height: fontSize),
                                                         options: .usesLineFragmentOrigin,
                                                         context: context)
        
        let imageRect = CGRect(x: (rect.width / 2.0) - (boundingRect.size.width / 2.0),
                               y: (rect.height / 2.0) - (boundingRect.size.height / 2.0),
                               width: rect.width,
                               height: rect.height)
        
        attributedString.draw(in: imageRect)
        let iconImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return iconImage
    }
}

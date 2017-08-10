//
//  DemoViewController.swift
//  ios-custom-font-demo
//
//  Created by OkuderaYuki on 2017/08/09.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit

final class DemoViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var imageView1: UIImageView!
    @IBOutlet private weak var imageView2: UIImageView!
    @IBOutlet private weak var imageView3: UIImageView!
    @IBOutlet private weak var imageView4: UIImageView!
    @IBOutlet private weak var button: UIButton!
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        setImage()
    }
    
    // MARK: - private
    private func setText() {
        
        // UILabelのattributedTextにcustom fontをセット
        guard let font = UIFont(name: FontName.icomoon, size: 20) else { return }
        let attributedString = NSAttributedString(string: "custom icon font: " + IconFont.tongue.rawValue,
                                                  attributes: [NSFontAttributeName: font])
        label.attributedText = attributedString
    }
    
    private func setImage() {
        
        // UIImageViewに画像をセット
        imageView1.image = UIImage.iconFont(icon: .tongue, color: .orange)
        imageView2.image = UIImage.iconFont(icon: .cool, color: .green)
        imageView3.image = UIImage.iconFont(icon: .confused, color: .red)
        imageView4.image = UIImage.iconFont(icon: .hipster, color: .blue)
        
        // UIButtonに画像をセット
        // UIButtonのイメージにセットする場合は、UIImageの色ではなくUIButtonのtintColorに依存する
        button.tintColor = .red
        let coolImage = UIImage.iconFont(icon: .cool,
                                         fontSize: 60.0,
                                         rect: CGSize(width: 60.0, height: 60.0),
                                         color: .yellow)
        
        let highlightedCoolImage = UIImage.iconFont(icon: .highlightedCool,
                                                    fontSize: 60.0,
                                                    rect: CGSize(width: 60.0, height: 60.0),
                                                    color: .yellow)
        button.setImage(coolImage, for: .normal)
        button.setImage(highlightedCoolImage, for: .highlighted)
    }
}

//
//  MediaCaptionView.swift
//  MediaBrowser
//
//  Created by Seungyoun Yi on 2017. 9. 6..
//  Copyright © 2017년 Seungyoun Yi. All rights reserved.
//
//

import UIKit

/// MediaCaptionView is based in UIToolbar
public class MediaCaptionView: UIToolbar {
    private var media: Media?
    private var label = UITextView()

    /// labelPadding
    public let labelPadding = CGFloat(10.0)

    /**
     init with Media

     - Parameter media: Media
     */
    public init(media: Media?) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320.0, height: 44.0)) // Random initial frame
        self.media = media

        setupCaption()
    }

    /**
     init with coder

     - Parameter coder: aDecoder
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCaption()
    }

    /**
     sizeThatFits

     - Parameter size: CGSize
     */
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        let maxHeight = CGFloat((UIScreen().currentMode?.size.height ?? 800) * 0.25)

        let textSize: CGSize

        if let text = label.text {
            textSize = text.boundingRect(
                with: CGSize(width: size.width - labelPadding * 2.0, height: maxHeight),
                options: .usesLineFragmentOrigin,
                attributes: [NSAttributedString.Key.font: label.font as Any],
                context: nil
            ).size
        } else {
            textSize = CGSize(width: 0, height: 0)
        }

        let safeInsets = UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        if UIDevice.current.orientation.isLandscape {
            label.textContainerInset = safeInsets
        } else {
            label.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        }

        return CGSize(width: size.width, height: textSize.height + labelPadding * 2.0)
    }

    private func setupCaption() {
        isUserInteractionEnabled = false
        tintColor = nil
        barTintColor = nil
        backgroundColor = UIColor.clear
//        isOpaque = false
//        isTranslucent = true
//        clipsToBounds = true
        barStyle = .default
        isTranslucent = true

        autoresizingMask =
            [.flexibleWidth, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]

        label = UITextView(frame: CGRect(x: labelPadding, y: 0.0, width: bounds.size.width - labelPadding * 2.0, height: bounds.size.height))

        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.isOpaque = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
//        label.lineBreakMode = .byWordWrapping
//        label.minimumScaleFactor = 0.6
//        label.adjustsFontSizeToFitWidth = true
//
//        label.numberOfLines = 0
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 17.0)

        if let p = media {
            label.text = p.caption
        }

        label.showsVerticalScrollIndicator = true
        label.isEditable = false
        label.isScrollEnabled = true
        label.scrollRangeToVisible(NSMakeRange(0, 0))
        label.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        label.textContainerInset = UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        isUserInteractionEnabled = true
        addSubview(label)
    }
}

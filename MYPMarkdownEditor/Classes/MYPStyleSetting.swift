//
//  MYPStyleSettingProtocol.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import Foundation

public var MYPStyleSettingControllerInstance = UIStoryboard(name: "MYPFormatView", bundle: MYPEditorResourcesBundle)

internal var MYPEditorResourcesBundle: Bundle? {
    // Get path for MYPMessageController bundle
    let bundlePath = Bundle(for: MYPStyleSettingController.self).path(forResource: "MYPMarkdownEditor", ofType: "bundle")
    let bundle: Bundle?
    
    // Load bundle
    if let bundlePath = bundlePath {
        bundle = Bundle(path: bundlePath)
    } else {
        bundle = nil
    }
    return bundle
}

public enum MYPMarkdownEditorFormattingStyle: Int {
    case bold = 1
    case italic
    case underline
    case strikethrough
    case fontColor
    case fontSize
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case alignCenter
    case alignLeft
    case alignRight
    case codeInline
    case codeBlock
    case quote
    case image
    case link
    case table
    case voice
}

public protocol MYPStyleSettingProtocol: class {
    func mypMarkdownEditor_didTap(styleType: MYPMarkdownEditorFormattingStyle, info: [String:Any]?)
}

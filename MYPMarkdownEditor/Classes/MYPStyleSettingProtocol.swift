//
//  MYPStyleSettingProtocol.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import Foundation

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

public protocol MYPStyleSettingProtocol {
    func mypMarkdownEditor_didTap(styleType: MYPMarkdownEditorFormattingStyle)
}

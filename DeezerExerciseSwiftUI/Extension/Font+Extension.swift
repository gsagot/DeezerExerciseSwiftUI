//
//  Font+Extension.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 11/10/2022.
//

import Foundation
import SwiftUI

// Deezer Fonts
extension Font {
    static let dzrLarge = Font.custom("MabryDeezer-Black", size: Font.TextStyle.largeTitle.size, relativeTo: .caption)
    static let dzrTitle = Font.custom("MabryDeezer-Black", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let dzrHeadline = Font.custom("MabryDeezer-Black", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let dzrFootnote = Font.custom("MabryDeezer-Black", size: Font.TextStyle.footnote.size, relativeTo: .caption)
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 42
        case .title: return 36
        case .title2: return 28
        case .title3: return 22
        case .headline, .body: return 18
        case .subheadline, .callout: return 16
        case .footnote: return 14
        case .caption: return 12
        case .caption2: return 10
        @unknown default:
            return 8
        }
    }
}

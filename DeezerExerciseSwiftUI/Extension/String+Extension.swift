//
//  String+Extension.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

extension String {
    // avoid bad url format
    func trimmedAndEscaped ()-> String {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
    // remove parentheses to avoid very long string
    func removeParentheses ()-> String {
        guard let upperIndex = (self.range(of: "(")?.lowerBound) else { return self }
           let firstPart: String = .init(self.prefix(upTo: upperIndex))
           return firstPart
    }
    
}

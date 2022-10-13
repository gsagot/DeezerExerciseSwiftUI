//
//  ServiceError.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import Foundation

enum ServiceError: Error, Equatable {
    case DataException (String)
    case QueryException (String)
    case JSONException (String)
}

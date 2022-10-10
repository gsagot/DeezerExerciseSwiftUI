//
//  ServiceError.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import Foundation

enum ServiceError: Error {
    case DataException
    case QueryException
    case JSONException
}

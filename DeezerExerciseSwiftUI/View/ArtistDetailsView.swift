//
//  ArtistDetailsView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ArtistDetailsView: View {
    let artist: DZRArtist
    var body: some View {
        Text(artist.name)
    }
}

struct ArtistDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailsView(artist: DZRArtist.mock())
    }
}

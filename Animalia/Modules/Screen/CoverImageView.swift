//
//  CoverImageView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages:[CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}

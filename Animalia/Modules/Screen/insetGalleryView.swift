//
//  insetGalleryView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct insetGalleryView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 16){
                ForEach(animal.gallery, id: \.self){item in
                    Image(item)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16) )
                    
                }
            }
            
        }
    
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return insetGalleryView(animal: animals[4])
}

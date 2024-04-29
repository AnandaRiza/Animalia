//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal:AnimalModel
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // HERO IMAGE
            Image(animal.image)
                .resizable()
                .scaledToFit()
            
            //TITLE
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.vertical, 8)
            //                .underline(color: .accent)
                .background(
                    Color.accent
                        .frame(height: 6)
                        .offset(y:24))
            
            
            //Headline
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            // Gallery
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                
                insetGalleryView(animal: animal)
                
            }
            .padding(.horizontal)
            
            //Fact
            Group{
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know")
                
                InsetFactView(animal: animal)
                
                
            }
            .padding(.horizontal)
            
            //Description
            Group{
                HeadingView(headingImage: "info.circle", headingText: "All About \(animal.name)")
                
                
                Text(animal.description)
            }
            .padding(.horizontal)
            
            //MAP
            Group{
                HeadingView(headingImage: "map", headingText: "National Parks")
                
                insetMapView()
                
                
            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    return AnimalDetailView(animal: animals[4])
}

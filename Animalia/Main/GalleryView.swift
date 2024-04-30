//
//  GalleryView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
        //simple grid definition
//    let gridLayout: [GridItem]= [
//    GridItem
//    ]
    
    // EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    // MARK: - FUNCTION GRID SWITCH
    func gridSwitch() {
        withAnimation(.easeIn){
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        }
     
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 32){
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                
                // MARK: - Slider grid switch
                Slider.init(value: $gridColumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn){
                        oldValue, newValue in gridSwitch()
                    }
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                        
                    }
                }
                
            }
            
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}

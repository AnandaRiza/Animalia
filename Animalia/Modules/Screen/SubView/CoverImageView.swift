//
//  CoverImageView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages:[CoverImageModel] = Bundle.main.decode("covers.json")
    
    @State private var showingSheet = false
    @State private var selectedCover: CoverImageModel?
    
    var body: some View {
        TabView{
            ForEach(coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                        showingSheet.toggle()
                        selectedCover = image
                    }
            }
            .sheet(isPresented: $showingSheet) {
                if let selectedCover = selectedCover {
                    OctagonImageFrame(cover: selectedCover)
                        .presentationDetents([.medium, .large])
                }
                
              
            }
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

#Preview {
    CoverImageView()
}

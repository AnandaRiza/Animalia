//
//  HeadingView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
}

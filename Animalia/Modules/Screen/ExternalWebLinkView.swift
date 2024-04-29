//
//  ExternalWebLinkView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal : AnimalModel
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    let destination = URL(string: animal.link)
                    let wikipedia = URL(string:"https://wikipedia.org")!
                    
                    
                    Image(systemName: "arrow.up.rigt.square")
                    Link(animal.name, destination: (destination ?? wikipedia))
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return ExternalWebLinkView(animal: animals[3])
}

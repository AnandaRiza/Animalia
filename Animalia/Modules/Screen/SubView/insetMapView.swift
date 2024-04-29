//
//  insetMapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI
import MapKit

struct insetMapView: View {
    // latitude 4.17727, longitude 113.99422
    @State private var cameraPosition: MapCameraPosition = {
            let centerCoordinate = CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422)
            
            let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            
            let region = MKCoordinateRegion(center: centerCoordinate, span: coordinateSpan)
            
            return MapCameraPosition.region(region)
        }()
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Map(position: $cameraPosition)
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            HStack{
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                
                Text("Locations")
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            .padding(.horizontal,14)
            .background(
                Color.black
                    .opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
            )
            .padding(12)
        }
        
        
//        Map {
//            Marker("Borneo", coordinate: .borneo)
//        }
    }
}

#Preview {
    insetMapView()
}

//
//  MapExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 20/10/25.
//

import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.2490634, longitude: -103.698191),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    ))
    
    var body: some View {
        ZStack {
            
            MapReader { proxy in
                Map(position: $position) {
                    Marker("Pollito Puerquito KFC Jorgito", coordinate: CLLocationCoordinate2D(latitude: 19.2490634, longitude: -103.698191))
                    
                    Annotation("Tacos te cojen del manojo", coordinate: CLLocationCoordinate2D(latitude: 19.2433898, longitude: -103.7026228)) {
                        Circle().frame(height: 40)
                    }
                }.mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en: \(context.region)")
                    }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local) {
                            withAnimation {
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                ))
                            }

                        }
                    }
            }
            
            VStack {
                Spacer()
                HStack {
                    Button("Ir a mi casa") {
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.2433898, longitude: -103.7026228),
                                span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                            ))
                        }
                    }.padding(16).background(.white)
                    Button("Ir a la UdC") {
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.2490634, longitude: -103.698191),
                                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                            ))
                        }
                    }.padding(16).background(.white)
                }
            }
        }
    }
}

#Preview {
    MapExample()
}

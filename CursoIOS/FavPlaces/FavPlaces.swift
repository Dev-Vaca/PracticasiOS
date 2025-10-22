//
//  FavPlaces.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 20/10/25.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.2424795, longitude: -103.7240102),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    @State var places:[Place] = []
    
    @State var showPopUp: CLLocationCoordinate2D? = nil
    
    @State var name: String = ""
    @State var fav: Bool = false
    
    @State var showSheet: Bool = false
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map { PresentationDetent.fraction($0)}
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color = if place.fav { Color.yellow } else { Color.black }
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }.mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay(alignment: .topLeading) {
                    VStack {
                        Button {
                            showSheet = true
                        } label: {
                            Label("Show List", systemImage: "list.star").foregroundColor(.black)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 8)
                        .background(.white.opacity(0.7))
                        .cornerRadius(16)
                        .padding(16)
                    }
                }
            }
            
            if showPopUp != nil {
                let view = VStack{
                    Text("Añadir localización").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8).padding(.horizontal, 16)
                    Toggle("¿Es un favorito?", isOn: $fav).padding(.horizontal, 16)
                    Spacer()
                    if !name.isEmpty {
                        Button("Guardar") {
                            savePlace(name: name, fav: fav, coordinates: showPopUp!)
                            clearForm()
                        }.padding(.bottom, 16)
                    }
                }
                
                CustomDialog(closeDialog: { showPopUp = nil }, onDismissOutside: false, content: view)
            }
            
        }.sheet(isPresented: $showSheet, content: {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places) { place in
                        let color = if place.fav {Color.yellow} else {
                            Color.black
                        }
                        
                        VStack {
                            VStack {
                                Text(place.name).font(.title3).bold()
                            }.frame(width: 200, height: 100).overlay {
                                RoundedRectangle(cornerRadius: 20).stroke(color, lineWidth: 1)
                            }.padding(.horizontal, 16)
                                .onTapGesture {
                                    animateCamera(coordinates: place.coordinates)
                                    showSheet = false
                                }
                            
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 30, height: 35)
                                .foregroundColor(.red)
                                .padding(.top, 16)
                                .onTapGesture {
                                    deletePlace(place)
                                }
                        }
                    }
                }
            }.presentationDetents(Set(height))
        }).onAppear {
            loadPlaces()
        }
    }
    
    func savePlace(name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
        savePlaces()
    }
    
    func deletePlace(_ place: Place) {
        if let index = places.firstIndex(where: { $0.id == place.id }) {
            places.remove(at: index)
            savePlaces()
        }
    }
    
    func clearForm() {
        name = ""
        fav = false
        showPopUp = nil
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D) {
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion (
                    center: coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
            )
        }
    }
}

extension FavPlaces {
    func savePlaces() {
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces() {
        if let savedPlaces = UserDefaults.standard.data(forKey: "places") {
            let decodePlaces = try? JSONDecoder().decode( [Place].self, from: savedPlaces)
            places = decodePlaces ?? []
        }
    }
}

#Preview {
    FavPlaces()
}

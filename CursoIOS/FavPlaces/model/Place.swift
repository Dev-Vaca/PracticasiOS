//
//  Place.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 20/10/25.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    var id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool = false
    
    enum CodingKeys: CodingKey {
        case id, name, fav, latitude, longitude
    }
    
    init (id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, fav: Bool) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.fav = fav
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        fav = try container.decode(Bool.self, forKey: .fav)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(name, forKey: .name)
        try container.encode(fav, forKey: .fav)
        try container.encode(id, forKey: .id)
    }
}

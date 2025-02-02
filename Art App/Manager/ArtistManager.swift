//
//  ArtistManager.swift
//  Art App
//
//  Created by Катя on 19.09.2024.
//

import Foundation


struct ArtistManager {
    
    guard let path = Bundle.main.path(forResource: "artistJson", ofType: "json") else { return }
    do { let data = try Data(contentsOf: path)
        let result = try JSONDecoder().decode([ArtistModel].self, from: data)
       } catch {
        print(error)
    }
}

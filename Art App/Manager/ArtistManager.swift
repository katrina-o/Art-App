//
//  ArtistManager.swift
//  Art App
//
//  Created by Катя on 19.09.2024.
//

import Foundation



 struct ArtistManager {

     var artist: ArtistModel = ArtistModel(artists: [])
    
     mutating func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "artistJson", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode(ArtistModel.self, from: data)
            
            self.artist = receivedData                        
            
        } catch {
            print(error)
        }
    }
   
}

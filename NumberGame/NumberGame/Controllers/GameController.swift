//
//  GameController.swift
//  NumberGame
//
//  Created by David on 4/8/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class GameController: Codable {
    
    static var scores = [Int]()
    
    //MARK: - CRUD
    
    static func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "NumberGame.json"
        let fullURL = documentDirectory.appendingPathComponent(fileName)
        return fullURL
    }
    
    static func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(scores)
            try data.write(to: fileURL() )
        } catch  {
            print("Error with \(#function) : \(error.localizedDescription) : ---> \(error)")
        }
    }
    
    static func loadFromPersistentStore() {
        let decoder =  JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let scores = try decoder.decode([Int].self, from: data)
            self.scores = scores
        } catch {
            print("Error with \(#function) : \(error.localizedDescription) : ---> \(error)")
        }
}


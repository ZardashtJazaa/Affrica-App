//
//  CodableBundleExtentions.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import Foundation

extension Bundle {
    
    func decode<T:Codable>(_ file: String) -> T {
        
        guard let url = url(forResource: file, withExtension: nil)  else {
            fatalError("Unable to Locate the \(file) in Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to Load \(file) from Bundle.")
        }
        
         let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Unable to decode \(file) from the Bundle.")
        }
            
            
        return loaded
    }
 
}

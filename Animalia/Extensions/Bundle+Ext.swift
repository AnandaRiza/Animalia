//
//  Bundle+Ext.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import Foundation


// Gunanya untuk decode data json sebagai bundle (lokal data)
// Jadi bisa di reuse anytime anywhere all at one
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        // 1. Menentukan lokasi dari file json
        guard let url = self.url(forResource: file, withExtension: nil)
        else{
            fatalError("failed to locate \(file) in bundle.")
        }
        
        // 2. Kita set data nya
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Buat decoder nya
        let decoder = JSONDecoder()
        
        // 4. Simpan sebagai property dari hasil data json yang sudah di decode
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("failed to decode \(file) from bundle.")
        }
        
        // 5. return data yang sudah di decode dan ready-to-use
        return loaded
        
    }
    
    
}

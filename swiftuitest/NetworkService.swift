//
//  NetworkService.swift
//  swiftuitest
//
//  Created by Renat on 06/06/2019.
//  Copyright © 2019 softeam. All rights reserved.
//

import UIKit

class NetworkService: NSObject {
    func getTime(completion : @escaping ((WorldTime?) -> ())) {
        
        guard let url = URL(string: "http://worldclockapi.com/api/json/utc/now") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard data != nil else {return}
            
            let worldTime = try? JSONDecoder().decode(WorldTime.self, from: data!)
            DispatchQueue.main.async {                
                completion(worldTime)
            }
        }.resume()
        
        
    }
}

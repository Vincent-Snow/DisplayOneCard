//
//  NetworkController.swift
//  DisplayOneCard
//
//  Created by mac-admin on 4/18/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: @escaping (_ success: Bool, _ data: NSData?) -> Void) {
        guard let url = URL(string: url) else {
            completion(false, nil)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                completion(false, nil)
            } else {
                completion(true, data as NSData?)
            }
        }
        task.resume()
        
    }
    
    static func serializeDataAsJson(data: NSData) -> [String:AnyObject]? {
        return (try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)) as? [String: AnyObject]
    }
    
}

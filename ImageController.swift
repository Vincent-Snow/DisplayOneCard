//
//  ImageController.swift
//  DisplayOneCard
//
//  Created by mac-admin on 4/18/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageAtURl(url: String, completion: @escaping (_ image: UIImage?) -> Void) {
        NetworkController.dataAtURL(url: url) { (success, data) in
            guard let data = data, success else {
                completion(nil)
                return
            }
            completion(UIImage(data: data as Data))
        }
            
        
        
    }
    
    
}

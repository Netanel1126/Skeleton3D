//
//  JSONReader.swift
//  Skeleton3D
//
//  Created by Netanel Yerushalmi on 01/11/2021.
//

import Foundation

class JSONReader<T>{
    
    static func readJSON(jsonName:String) -> T?{
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResult = jsonResult as? T {
                    return jsonResult
                }
            } catch {
                return nil
            }
        }
        return nil
    }
    
}

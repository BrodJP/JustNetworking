//
//  Router.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// This a protocol is used for create an abstraction between every posible chunk of routes that could exist
/// By default use the URL set on the global configuration and append the path
public protocol Router {
    
    /// This is the path of the url to append to the baseURL
    var path: String {get}
    
    
    /// By default is set by the global URL configured
    var baseURL: URL {get}
    
    
    /// By default is created with the base URL with the path appended
    var completeURL: URL {get}
}

public extension Router {
    
    var baseURL: URL {
        guard let url = GlobalConfiguration.shared.url else {
            fatalError("You must set a valid URL for the router ")
        }
        return url
    }
    
    var completeURL: URL {
        return baseURL.appendingPathComponent(path)
    }
}

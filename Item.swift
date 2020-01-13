//
//  Item.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

struct Thumbnail: Codable{
    var src:URL
}

struct Pagemap: Codable {
    var cse_thumbnail:[Thumbnail]
}

struct Item: Codable {
    var title:String
    var link:URL
    var snippet:String
    var pagemap:Pagemap
}

struct SearchObject: Codable{
    var items:[Item]
}



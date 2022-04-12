//
//  Post.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import Foundation

struct Posts: Equatable {
    let author, description, image, id: String
    var likes, views: Int
}

var dataSource: [Posts] = []

//
//  ListingResponse.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import Foundation

struct ListingResponse: Codable{
    let total_count: Int
    let results: [Listing]
}

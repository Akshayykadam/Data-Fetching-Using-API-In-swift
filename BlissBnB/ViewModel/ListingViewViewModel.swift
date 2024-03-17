//
//  ListingViewViewModel.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import Foundation

class ListingViewViewModel: ObservableObject{
    private let service = APIServices()
    @Published var listings: [Listing] = []
    
    public func FetchListings(){
        service.getListings{[weak self]result in
            switch result {
            case .success(let models):
                self?.listings = models
            case .failure:
                break
            }
        }
    }
}

//
//  APIService.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import Foundation

final class APIServices{
    init(){}
    
    struct Constants{
        static let apiUrl = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
    }
    
    public func getListings(completion: @escaping (Result<[Listing], Error>)-> Void)
    {
        guard let url = Constants.apiUrl else{
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, _, error in
            guard let data, error == nil else{
                if let error{
                    completion(.failure(error))
                }
                return
            }
            
            
            do{
                let response = try JSONDecoder().decode(ListingResponse.self, from: data)
                completion(.success(response.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

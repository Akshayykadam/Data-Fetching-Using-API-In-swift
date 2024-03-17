//
//  ListingView.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import SwiftUI

struct ListingView: View {
    @StateObject var viewModel = ListingViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.listings.isEmpty{
                    ProgressView()
                        .progressViewStyle(.automatic)
                }else{
                    List(viewModel.listings){ listing in
                        NavigationLink(destination: DetailedView(model: listing), label: {
                            ListingCardView(model: listing)
                        })
                        
                    }
                    .navigationTitle("Apartment")
                    .foregroundColor(.blue)
                }
            }
        }
        .onAppear{
            viewModel.FetchListings()
        }
    }
}

//
//  ListingCardView.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import SwiftUI

struct ListingCardView: View {
    let model:Listing
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(model.name?.capitalized ?? "Listing")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(model.description ?? "Listing")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

//
//  DetailedView.swift
//  BlissBnB
//
//  Created by Akshay Kadam on 16/03/24.
//

import SwiftUI

struct DetailedView: View {
    let model: Listing
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    
                    
                    // Picture
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).width)
                        .clipped()
                        .padding()
                    
                    //Name
                    Text(model.name ?? "Info Not Available")
                    //.font(.system(size: 25))
                        .font(.title)
                        .frame(width: proxy.frame(in: .global).width)
                        .bold()
                        .foregroundColor(.pink)
                        .padding()
                    
                    //Price
                    if let price = model.price{
                        Text("Per Night: \(price.formatted(.currency(code: "USD")))")
                            .font(.system(size: 20))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    
                    // Info
                    Text("Description:")
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    Text("\(model.description ?? "Info Not Available")")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("Summary:")
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    Text("\(model.summary ?? "Info Not Available")")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("House Rules:")
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    Text("\(model.house_rules ?? "Info Not Available")")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("Space:")
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    Text("\(model.space ?? "Info Not Available")")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    // Host Info
                    
                    HStack(spacing: 10) {
                        AsyncImage(url: URL(string: model.host_picture_url))
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(model.host_name)
                                .font(.body)
                                .bold()
                            Text("Host Since: \(model.host_since)")
                                .font(.body)
                        }
                    }
                    .padding(.horizontal)}
                .frame(width: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
        .padding([.leading, .trailing], 20)
        .background(Color.white.opacity(0.1))
        .foregroundColor(Color.black)
        
    }
}

//#Preview {
//    DetailedView(model: Listing)
//}

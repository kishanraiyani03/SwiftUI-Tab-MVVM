//
//  HomeView.swift
//  SwiftUI+Tab+MVVMDemo (iOS)
//
//  Created by Kishan on 01/01/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel:HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            viewModel.fetchAlbums()
        })
        
        return NavigationView {
            ZStack {
                ProgressView().hidden(!viewModel.isLoading)
                VStack {
                    //                    Button {
                    //                        viewModel.fetchAlbums()
                    //                    } label: {
                    //                        Text(viewModel.message)
                    //                    }
                    
                    List(viewModel.albums, id: \.id) { album in
                        HStack(alignment: VerticalAlignment.top, spacing: 0) {
                            Image("cover")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90)
                                .cornerRadius(4)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(album.title ?? "")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.7)
                                Text("Id : " + "\(album.id ?? 0)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
                            Spacer()
                        }.background(Color.white)
                            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                            .listRowSeparator(.hidden)
                            .cornerRadius(4)
                    }.background(Color.clear).navigationBarTitle(Text("Albums")).navigationBarTitleDisplayMode(.inline)
                        .listStyle(PlainListStyle())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        return opacity(shouldHide ? 0 : 1)
    }
}


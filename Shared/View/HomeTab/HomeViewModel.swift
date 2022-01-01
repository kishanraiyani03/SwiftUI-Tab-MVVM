//
//  HomeViewModel.swift
//  SwiftUI+Tab+MVVMDemo (iOS)
//
//  Created by Kishan on 01/01/22.
//

import Foundation


class HomeViewModel:ObservableObject {
    var isLoading:Bool = true
    @Published var message:String = "Fetch data"
    @Published var albums:[AlbumModel] = [] //[AlbumModel(title: "Kishan", userId: 1),AlbumModel(title: "Hina", userId: 2),AlbumModel(title: "Aradhya", userId: 3)]
    
    func fetchAlbums() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            return
        }
        
        self.isLoading = true
        self.message = "Fetching data..."
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.message = "Fetching complete"
                if error == nil {
                    do {
                        self.albums = try JSONDecoder().decode([AlbumModel].self, from: data!)
                    }
                    catch {
                        print(error)
                    }
                }
                else {
                    self.message = error?.localizedDescription ?? ""
                }
            }
        }.resume()
    }
}

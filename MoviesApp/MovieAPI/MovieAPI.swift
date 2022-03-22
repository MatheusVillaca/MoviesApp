//
//  MovieAPI.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import Foundation

final class MovieAPI {
    
//    enum JSONFile: String {
//        case list = "List", detail = "Detail"
//    }
//
//    func getFromFile<T: Decodable>(file: JSONFile) -> T? {
//        if let path = Bundle.main.path(forResource: file.rawValue, ofType: "json") {
//            do {
//                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                return try JSONDecoder().decode(T.self, from: data)
//              } catch {
//                   // handle error
//              }
//        }
//
//        return nil
//    }
//
    func getMovies(completion: @escaping ((_ movies: MovieListResponse?) -> Void)) {
        
//        let movieResponse: MovieListResponse? = getFromFile(file: .list)
//        completion(movieResponse)
//        return
        guard let urlComponents: URLComponents = URLComponents(string: "https://imdb-api.com/API/MostPopularMovies/k_99w129a7") else {
            completion (nil)
            return
        }
        guard let url: URL = urlComponents.url else {
            completion (nil)
            return
        }
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
    
    func getMoviesDetail(id: String, completion: @escaping ((_ movieDetail: MovieDetail?) -> Void)) {
//        let detailResponse: MovieDetail? = getFromFile(file: .detail)
//        completion(detailResponse)
//        return
        guard let urlComponents: URLComponents = URLComponents(string: "https://imdb-api.com/pt-br/API/Title/k_99w129a7/\(id)") else {
            completion(nil)
            return
        }
        guard let url: URL = urlComponents.url else {
            completion(nil)
            return
        }
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
    
    func getActorsDetail(id: String, completion: @escaping ((_ movieDetail: ActorListResponse?) -> Void)) {

        guard let urlComponents: URLComponents = URLComponents(string: "https://imdb-api.com/pt-br/API/Title/k_99w129a7/\(id)") else {
            completion(nil)
            return
        }
        guard let url: URL = urlComponents.url else {
            completion(nil)
            return
        }
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
}

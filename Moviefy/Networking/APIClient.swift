//
//  APIClient.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import Foundation

struct APIClient {
    static let shared = APIClient()
    let session = URLSession(configuration: .default)
    
    let parameters = [
        "sort_by": "popularity.desc",
        "api_key": "e876d92222f5e25dbca0fa994d4bafad"
    ]
    
    func getPopularMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        do{
            // Creating the request
            let request = try Request.configureRequest(from: .movies, with: parameters, and: .get, contains: nil)
            session.dataTask(with: request) { (data, response, error) in
                if let response = response as? HTTPURLResponse, let data = data {
                    
                    let result = Response.handleResponse(for: response)
                    switch result{
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))
                        
                    case.failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
}


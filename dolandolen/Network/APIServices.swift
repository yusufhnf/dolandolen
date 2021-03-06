//
//  APIServices.swift
//  dolandolen
//
//  Created by Yusuf Umar Hanafi on 14/08/21.
//

import Foundation

class APIServices {
    private let apiKey = "INSERT_API_KEY"
    private let baseURL = "https://api.rawg.io/api"
    private var dataTask: URLSessionTask?
    func fetchGamesData(completion: @escaping (Result<GameModel, Error>) -> Void) {
        let placesURL = "\(baseURL)/games?key=\(apiKey)"
        guard let url = URL(string: placesURL) else {
            return
        }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("fetchGamesData DataTask Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse else {
                print("fetchGamesData: Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("fetchGamesData: Empty Data")
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(GameModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    func fetchGamesDataSearch(search: String, completion: @escaping (Result<GameModel, Error>) -> Void) {
        let placesURL = "\(baseURL)/games?key=\(apiKey)&&search=\(search)"
        guard let url = URL(string: placesURL) else {
            return
        }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("fetchGamesData DataTask Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse else {
                print("fetchGamesData: Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("fetchGamesData: Empty Data")
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(GameModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    func fetchGamesDetail(idGame: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void) {
        let placesURL = "\(baseURL)/games/\(idGame)?key=\(apiKey)"
        guard let url = URL(string: placesURL) else {
            return
        }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("fetchGamesDetail DataTask Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse else {
                print("fetchGamesDetail: Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("fetchGamesDetail: Empty Data")
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(GameDetailModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}

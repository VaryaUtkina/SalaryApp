//
//  NetworkManager.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 13.03.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCalednar(_ link: Link, completion: @escaping(Result<Calendar, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: link.url) { data, _, error in
            guard let data else {
            print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let calendar = try decoder.decode(Calendar.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(calendar))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

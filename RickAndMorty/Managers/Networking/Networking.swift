//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation
import Combine

enum Endpoint: String {
    case character
}

class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    private var config: NetworkingConfiguration?
    
    // MARK: - Initializers
    init() {  }
    
    static func initialize(with config: NetworkingConfiguration) {
        NetworkManager.shared.config = config
    }
    
    func getData<T>(endpoint: Endpoint, name: String? = nil, type: T.Type) -> Future<ApiResponse<T>, NetworkError> {
        return Future { [weak self] promise in
            self?.performRequest(promise: promise, endpoint: endpoint, name: name, type: type)
        }
    }
    
    private func performRequest<T>(promise: @escaping (Result<ApiResponse<T>, NetworkError>) -> Void, endpoint: Endpoint, name: String?, type: T.Type) {
        guard config != nil else { return promise(.failure(NetworkError.networkNotInitialized)) }
        guard let url = createURL(endpoint: endpoint, name: name) else {
            return promise(.failure(NetworkError.invalidURL))
        }
        print("URL is \(url.absoluteString)")

        URLSession.shared.taskPublisher(for: url)
            .parse()
            .map(\.data)
            .decode(type: ApiResponse<T>.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
//            .handleResult(promise: promise)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    return
                case .failure(let error):
                    if let error = error as? NetworkError {
                        promise(.failure(error))
                    } else {
                        promise(.failure(NetworkError.unknown))
                    }
                }
            }, receiveValue: { value in
                promise(.success(value))
            })
            .store(in: &cancellables)
    }

}

extension NetworkManager {
    
    private func createURL(endpoint: Endpoint, name: String?) -> URL? {
        guard let baseURL = config?.baseURL,
                let url = URL(string: baseURL.appending(endpoint.rawValue).appending(name == nil ? "" : "/?name=\(name ?? "")"))
        else {
            return nil
        }
        return url
    }
    
}

/**.
    -Previous code ======================================================================
 
//    func getData<T>(endpoint: Endpoint, name: String? = nil, type: T.Type) -> Future<ApiResponse<T>, Error> {
//        return Future { [weak self] promise in
//            guard let self = self,
//                    let url = URL(string: self.baseURL.appending(endpoint.rawValue).appending(name == nil ? "" : "/?name=\(name ?? "")")) else {
//                return promise(.failure(NetworkError.invalidURL))
//            }
//            print("URL is \(url.absoluteString)")
//            URLSession.shared.dataTaskPublisher(for: url)
//                .parse()
//                .decode(ApiResponse<T>.self)
//                .receive(on: RunLoop.main)
//                .sink(receiveCompletion: { (completion) in
//                    if case let .failure(error) = completion {
//                        switch error {
//                        case let decodingError as DecodingError:
//                            promise(.failure(decodingError))
//                        case let apiError as NetworkError:
//                            promise(.failure(apiError))
//                        default:
//                            promise(.failure(NetworkError.unknown))
//                        }
//                    }
//                }, receiveValue: { value in
//                    promise(.success(value))
//                })
//                .store(in: &self.cancellables)
//        }
//    }
 **/


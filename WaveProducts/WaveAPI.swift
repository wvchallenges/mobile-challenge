import Foundation

final class WaveAPI {
    private let baseURL: URL
    private let accessToken: String
    private let session: URLSession

    init(baseURL: URL, accessToken: String, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.accessToken = accessToken
        self.session = session
    }

    func getProducts(businessId: String, completion: @escaping (Result<[Product]>) -> Void) {
        var request = makeBusinessRequest(businessId: businessId)
        request.url?.appendPathComponent("products", isDirectory: true)
        makeTask(request, completion: completion).resume()
    }

    private func makeTask<T: Decodable>(_ request: URLRequest, completion: @escaping (Result<T>) -> Void) -> URLSessionDataTask {
        func parse(_ data: Data) -> Result<T> {
            let decoder = JSONDecoder()
            do {
                return .success(try decoder.decode(T.self, from: data))
            } catch {
                // If parsing with expected type fails, try parsing error message.
                // If that also fails, return the error from parsing with expected type.
                let response = try? decoder.decode(WaveResponse.self, from: data)
                return .failure(response?.error ?? error)
            }
        }
        return makeDataTask(request) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(parse(data))
            }
        }
    }

    private func makeDataTask(_ request: URLRequest, completion: @escaping (Result<Data>) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: request) { data, _, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            } else {
                assertionFailure("URLSessionDataTask completed with neither data nor error")
            }
        }
    }

    private func makeBaseRequest() -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        return request
    }

    private func makeBusinessRequest(businessId: String) -> URLRequest {
        var request = makeBaseRequest()
        request.url?.appendPathComponent("businesses")
        request.url?.appendPathComponent(businessId)
        return request
    }
}

private struct WaveError: Decodable {
    let message: String
}

extension WaveError: LocalizedError {
    var errorDescription: String? {
        return message
    }
}

private struct WaveResponse: Decodable {
    let error: WaveError
}

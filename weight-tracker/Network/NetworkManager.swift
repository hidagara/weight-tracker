//
//  NetworkManager.swift
//  weight-tracker
//
//  Created by Media Guest on 06.07.2021.
//

import Foundation
import Combine

class NetworkManager: NSObject {
    
    
    private var posts: [Post] = [] {
            didSet {
                print("posts --> \(self.posts.count)")
            }
        }
    
    private var cancellable: AnyCancellable?
    private var publi: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var data: Data? = nil
    var response: URLResponse? = nil
    
    func sendRequest(httpMethod: HTTPMethod, url: String) {
        print("send request")
        let url_ = URL(string: url)!
        print(url_)
        
        let integers = (0...3)
        integers.publisher
            .sink { print("Received \($0)") }
        let session = URLSession(configuration: .ephemeral, delegate: self, delegateQueue: nil)

        publi = session.dataTaskPublisher(for: url_)
            .print("Working on \(url_)")
            .eraseToAnyPublisher()
        self.cancellable = publi?.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }, receiveValue: {
            self.data = $0.data;
            self.response = $0.response
            print(String(data: self.data!, encoding: .utf8))
        }
        )
//        let val = URLSession.shared.dataTaskPublisher(for: url_ )
//            .map {
//                print(String(data: $0.data, encoding: .utf8))
//                return String(data: $0.data, encoding: .utf8)!
//            }
////            .decode(type: String.self, decoder: JSONDecoder())
//            .catch { val -> Just<String> in
//                print("Decode error")
//                return Just("Decode error")
//            }
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//            .sink(receiveValue: { data in
//                print(data)
//            })
//        print(val)
        
        
//        let url1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        //...
//        self.cancellable = URLSession.shared.dataTaskPublisher(for: url1)
//        .map { $0.data }
//        .decode(type: [Post].self, decoder: JSONDecoder())
//        .replaceError(with: [])
//        .eraseToAnyPublisher()
//        .sink(receiveValue: { posts in
//            print(posts.count)
//        })
        //...
//        self.cancellable?.cancel()
    }
    
    
    func test() {
        //
//        print("test")
        sendRequest(httpMethod: .GET, url: "https://127.0.0.1:8080")
    }
}


enum HTTPMethod {
    case GET
    case POST
}



extension NetworkManager: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil);
            return
        }
        let isServerTrusted1 = SecTrustEvaluateWithError(serverTrust, nil)
        let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
        
        // SSL Policies for domain name check
        let policy = NSMutableArray()
        policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
        //evaluate server certifiacte
       
        //Local and Remote certificate Data
        let remoteCertificateData:NSData =  SecCertificateCopyData(certificate!)
        //let LocalCertificate = Bundle.main.path(forResource: "github.com", ofType: "cer")
        let pathToCertificate = Bundle.main.path(forResource: "Roman Guseynov", ofType: "cer")
        let localCertificateData:NSData = NSData(contentsOfFile: pathToCertificate!)!
        let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
        //Compare certificates
        if(true && remoteCertificateData.isEqual(to: localCertificateData as Data)){
            let credential:URLCredential =  URLCredential(trust:serverTrust)
            print("Certificate pinning is successfully completed")
            completionHandler(.useCredential,credential)
        } else {
            completionHandler(.cancelAuthenticationChallenge,nil)
              }
    }
}


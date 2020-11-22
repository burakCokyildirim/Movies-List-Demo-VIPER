//
//  NetworkService.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//


import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

class NetworkService {
    
    static let sharedInstance = NetworkService()
    
    fileprivate var reachabilityManager: NetworkReachabilityManager?
    var reachabilityStatus: NetworkReachabilityManager.NetworkReachabilityStatus = .unknown
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return configuration
    }()
    
    var imageDownloader: ImageDownloader = {
       var imageDownloader = ImageDownloader.default
        imageDownloader.trustedHosts = Set(["www.omdbapi.com"])
        
        return imageDownloader
    }()
    
    let sessionManager = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: MyServerTrustPolicyManager(policies: [:]))
        
    private init() {
        KingfisherManager.shared.downloader = imageDownloader
    }
    
    // MARK: - Reachability
    
    func startReachability(listener: NetworkReachabilityManager.Listener? = nil) {
        reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
        reachabilityManager?.listener = { status in
            self.reachabilityStatus = status
            
            if let listener = listener {
                listener(status)
            }
        }
        reachabilityManager?.startListening()
    }
    
    func stopReachabilityManager() {
        reachabilityManager?.stopListening()
    }
    
    // MARK: - Methods
    
    func getJSON(url: URLConvertible, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                 success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        callJSON(method: .get, url: url, parameters: parameters, headers: headers, success: success, failure: failure)
    }
    
    func postJSON(url: URLConvertible, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                  success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        callJSON(method: .post, url: url, parameters: parameters, headers: headers, success: success, failure: failure)
    }
    
    fileprivate func callJSON(method: HTTPMethod, url: URLConvertible,
                              parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                              success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {

        if !isInternetAvailable() {
            print("Response Failure Reachability: \n")
            failure(ErrorModel(genericErrorType: GenericErrorType.reachability))
        }
        
        var headerParams = [String: String]()
        
        if let headers = headers {
            headerParams = headers
        }
        
        let headerParameters = addHeaders(headers: headerParams)
        
        print("Url: \(url)\n")
        
        print("Header Parameters: \(String(describing: headerParameters))\n")
        
        sessionManager.request(url, method: method, parameters: parameters,
                               encoding: JSONEncoding.default, headers: headerParameters)
            .responseJSON(completionHandler: { response in
                
                print("Response: " + (String(bytes: response.data!, encoding: .utf8) ?? "nil"))
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    success(json)
                case .failure(let error):
                    if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        print("Response Failure Not Connected: \(urlError)\n")
                        failure(ErrorModel(genericErrorType: GenericErrorType.reachability))
                    } else {
                        self.handleHttpError(response.response, success: success, failure: failure)
                    }
                }
            })
    }
    
    // MARK: - Utils

    func isInternetAvailable() -> Bool {
        switch reachabilityStatus {
        case .notReachable:
            return false
        case .unknown:
            return true
        case .reachable(.ethernetOrWiFi):
            return true
        case .reachable(.wwan):
            return true
        }
    }
    
    func addHeaders(headers: [String: String]? = nil) -> [String: String]? {
        var headerParameters: [String: String]?
        
        if let defaultHeaders = NetworkService.defaultHeaders() {
            headerParameters = defaultHeaders
        }
        
        if let parameters = headers {
            if headerParameters == nil {
                headerParameters = [String: String]()
            }
            headerParameters?.merge(parameters, uniquingKeysWith: { $1 })
        }
        return headerParameters
    }
    
    // MARK: - Error Handling
    
    func handleError(_ json: JSON, success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        print("Response Failure Handle Error: \(json)\n")
    }
    
    func handleHttpError(_ response: HTTPURLResponse?, success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        if let statusCode = response?.statusCode {
            print("Response Failure Http Status Code: \(statusCode)\n")
            failure(ErrorModel(errorCode: "\(statusCode)", genericErrorType: GenericErrorType.somethingsWrong))
        } else {
            print("Response Failure Http Somethings Wrong: \n")
            failure(ErrorModel(genericErrorType: GenericErrorType.somethingsWrong))
        }
    }
    
    // MARK: - Parameter Utils
    
    static func defaultHeaders() -> [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

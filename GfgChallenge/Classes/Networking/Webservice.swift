//
//  Webservice.swift
//  GfgChallenge
//
//  Created by Flexnest on 25/01/22.
//

import Foundation

class Webservice {
    
    //MARK: method to invoke api.
    public class func callApi(endpoint: String, queryParams: [String: String], httpMethod: String, headers: [String: String] = [:], bodyParams: [String: Any] = [:], completion: @escaping (Data)->()) {
        var completeUrl = "\(kBaseUrl)\(endpoint)?"
        // Adding query-parameters to url.
        for (queryKey, queryValue) in queryParams {
            completeUrl += "\(queryKey)=\(queryValue)"
        }
        // prepare and send request.
        guard let url = URL(string: completeUrl) else { return }
        let request = self.generateRequest(url: url, httpMethod: httpMethod, headers: headers, bodyParams: bodyParams)
        self.sendRequest(request: request, completion: completion)
    }
    
    //MARK: method to generate URLRequest.
    private class func generateRequest(url: URL, httpMethod: String, headers: [String: String], bodyParams: [String: Any]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        // Adding headers to the request.
        for (headerKey, headerValue) in headers {
            request.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        // Adding body parameters to request.
        if !bodyParams.isEmpty {
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
            } catch let error {
                print("body could not be added to the request: \(error.localizedDescription)")
            }
        }
        
        return request
    }
    
    //MARK: method to hit request to the server.
    private class func sendRequest(request: URLRequest, completion: @escaping (Data)->()) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                completion(data)
            } else {
                print("error fetching data from server: \(error?.localizedDescription ?? "SERVER_ERROR")")
            }
        }.resume()
    }
}

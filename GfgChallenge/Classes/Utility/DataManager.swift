//
//  DataManager.swift
//  GfgChallenge
//
//  Created by Flexnest on 25/01/22.
//

import Foundation

class DataManager {
    
    //MARK: parse feed api data.
    class func getFeedApiData(completion: @escaping ([FeedItem]) -> ()) {
        let urlEndpoint = EndpointEnum.feedEndpoint.rawValue
        let queryParam = ["rss_url": "http://www.abc.net.au/news/feed/51120/rss.json"]
        Webservice.callApi(endpoint: urlEndpoint, queryParams: queryParam, httpMethod: "GET") { data in
            do{
                let response = try JSONDecoder().decode(FeedModel.self, from: data)
                DispatchQueue.main.async {
                    completion(response.items ?? [])
                }
            } catch let error {
                print("error parsing data: \(error.localizedDescription)")
            }
        }
    }
}

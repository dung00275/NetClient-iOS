//
//  NetResponse+HTTPURLResponse.swift
//  Net
//
//  Created by Alex Rupérez on 22/3/17.
//
//

import Foundation

extension NetResponse {

    public init(_ httpResponse: HTTPURLResponse, _ netTask: NetTask? = nil, _ responseObject: Any? = nil) {
        self.init(httpResponse.url, mimeType: httpResponse.mimeType, contentLength: httpResponse.expectedContentLength, textEncoding: httpResponse.textEncodingName, filename: httpResponse.suggestedFilename, statusCode: httpResponse.statusCode, headers: httpResponse.allHeaderFields, localizedDescription: HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode), netTask: netTask, responseObject: responseObject)
    }

    public var httpResponse: HTTPURLResponse? {
        guard let url = url, let statusCode = statusCode, let headers = headers as? [String : String] else {
            return nil
        }
        return HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: headers)
    }

}

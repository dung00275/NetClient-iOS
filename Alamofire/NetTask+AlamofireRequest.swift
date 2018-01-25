//
//  NetTask+AlamofireRequest.swift
//  Net
//
//  Created by Alex Rupérez on 24/4/17.
//
//

import Alamofire

extension NetTask {

    public convenience init?(_ alamofireRequest: Alamofire.Request, request: NetRequest? = nil, response: NetResponse? = nil, error: NetError? = nil) {
        guard let task = alamofireRequest.task else {
            return nil
        }
        self.init(task.taskIdentifier, request: request, response: response, taskDescription: task.taskDescription, state: NetState(rawValue: task.state.rawValue) ?? .suspended, error: error, priority: task.priority, task: alamofireRequest as? NetTaskProtocol)
    }

}

extension Alamofire.DataRequest: NetTaskProtocol {

    public var earliestBeginDate: Date? {
        get {
            return nil
        }
        set {
            assertionFailure("earliestBeginDate isn't supported by NetAlamofire, please use NetURLSession instead.")
        }
    }

}

extension Alamofire.DownloadRequest: NetTaskProtocol {

    public var earliestBeginDate: Date? {
        get {
            return nil
        }
        set {
            assertionFailure("earliestBeginDate isn't supported by NetAlamofire, please use NetURLSession instead.")
        }
    }
    
}

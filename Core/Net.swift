//
//  Net.swift
//  Net
//
//  Created by Alex Rupérez on 22/3/17.
//
//

import Foundation

public typealias InterceptorToken = UUID

public typealias StatusCode = Int

public typealias StatusCodes = Set<StatusCode>

public typealias RequestInterceptor = (NetRequest.Builder) -> NetRequest.Builder

public typealias ResponseInterceptor = (NetResponse.Builder) -> NetResponse.Builder

public protocol Net: class {

    static var shared: Net { get }

    var retryClosure: NetTask.RetryClosure? { get set }

    @discardableResult func addRequestInterceptor(_ interceptor: @escaping RequestInterceptor) -> InterceptorToken

    @discardableResult func addResponseInterceptor(_ interceptor: @escaping ResponseInterceptor) -> InterceptorToken

    @discardableResult func removeInterceptor(_ token: InterceptorToken) -> Bool

    var acceptableStatusCodes: StatusCodes { get set }

    func data(_ request: NetRequest) -> NetTask

    func download(_ resumeData: Data) -> NetTask

    func download(_ request: NetRequest) -> NetTask

    func upload(_ streamedRequest: NetRequest) -> NetTask

    func upload(_ request: NetRequest, data: Data) -> NetTask

    func upload(_ request: NetRequest, fileURL: URL) -> NetTask

    #if !os(watchOS)
    @available(iOS 9.0, macOS 10.11, *)
    func stream(_ netService: NetService) -> NetTask

    @available(iOS 9.0, macOS 10.11, *)
    func stream(_ domain: String, type: String, name: String, port: Int32?) -> NetTask

    @available(iOS 9.0, macOS 10.11, *)
    func stream(_ hostName: String, port: Int) -> NetTask
    #endif

}

extension Net {
    static var defaultAcceptableStatusCodes: StatusCodes { return Set(200..<300) }
}

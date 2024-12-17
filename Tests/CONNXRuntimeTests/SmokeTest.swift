//
//  SmokeTest.swift
//  ONNXRuntime
//
//  Created by Alexander Smarus on 18.12.2024.
//

import CONNXRuntime
import XCTest

final class SmokeTest: XCTestCase {

    func testEnvironment() throws {
        let api = OrtGetApiBase()!.pointee.GetApi(UInt32(ORT_API_VERSION))!
        var env: OpaquePointer?
        if let status = api.pointee.CreateEnv(ORT_LOGGING_LEVEL_INFO, "ONNXRuntimeTest", &env) {
            let errorCode = api.pointee.GetErrorCode(status)
            let errorMessage = String(cString: api.pointee.GetErrorMessage(status)!)
            XCTFail("CreateEnv failed with error \(errorMessage) (\(errorCode))")
            api.pointee.ReleaseStatus(status)
        }
        XCTAssertNotNil(env)
        api.pointee.ReleaseEnv(env)
    }

}

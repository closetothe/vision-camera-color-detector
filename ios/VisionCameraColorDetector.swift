//
//  VisionCameraColorDetector.swift
//  VisionCameraColorDetector
//


@objc(VisionCameraColorDetector)
class VisionCameraColorDetector: NSObject {

    @objc(noop:withResolver:withRejecter:)
    func noop(message: String, resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        print(message)
    }
}

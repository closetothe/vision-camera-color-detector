//
//  VisionCameraColorDetector.m
//  VisionCameraColorDetector
//


#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(VisionCameraColorDetector, NSObject)

RCT_EXTERN_METHOD(noop:(NSString *)message
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end

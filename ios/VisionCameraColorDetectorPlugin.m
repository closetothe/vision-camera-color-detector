#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import <VisionCamera/Frame.h>
#import "VisionCameraColorDetector-Swift.h"


@interface VisionCameraColorDetectorPlugin (FrameProcessorPluginLoader)
@end

@implementation VisionCameraColorDetectorPlugin (FrameProcessorPluginLoader)

+ (void)load
{
  [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"detectColors"
                                        withInitializer:^FrameProcessorPlugin* (NSDictionary* options) {
    return [[VisionCameraColorDetectorPlugin alloc] init];
  }];
}

@end

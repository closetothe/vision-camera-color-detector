import { VisionCameraProxy, type Frame } from 'react-native-vision-camera';

export interface ColorResult {
  primary: string;
  secondary: string;
  detail: string;
  background: string;
}

const plugin = VisionCameraProxy.initFrameProcessorPlugin('detectColors');

/**
 * Detect colors from the camera preview
 */
export function detectColors(
  frame: Frame,
  quality: 'lowest' | 'low' | 'high' | 'highest'
): ColorResult {
  'worklet';
  if (plugin == null)
    throw new Error('Failed to load Frame Processor Plugin "detectColors"!');
  return plugin.call(frame, { quality }) as any;
}

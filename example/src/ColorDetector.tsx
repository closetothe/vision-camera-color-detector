import React from 'react';
import {Dimensions, Platform, StyleSheet, Text} from 'react-native';
import {
  Camera,
  useCameraDevices,
  useFrameProcessor,
} from 'react-native-vision-camera';
import {ColorResult, detectColors} from 'vision-camera-color-detector';
// import * as REA from 'react-native-reanimated';

const ColorDetector: React.FC = () => {
  const [hasPermission, setHasPermission] = React.useState(false);
  const [frameWidth, setFrameWidth] = React.useState(720);
  const [frameHeight, setFrameHeight] = React.useState(1280);
  const devices = useCameraDevices();
  const device = devices.back;

  const frameProcessor = useFrameProcessor(frame => {
    // @ts-ignore
    'worklet';
    const results: ColorResult = detectColors(frame, {quality: 'lowest'});

    console.log('height: ' + frame.height);
    console.log('width: ' + frame.width);
    console.log(results);

    REA.runOnJS(setFrameWidth)(frame.width);
    REA.runOnJS(setFrameHeight)(frame.height);
  }, []);

  React.useEffect(() => {
    (async () => {
      const status = await Camera.requestCameraPermission();
      setHasPermission(status === 'authorized');
    })();
  }, []);

  return (
    <>
      {device != null && hasPermission && (
        <Camera
          style={StyleSheet.absoluteFill}
          device={device}
          isActive={true}
          frameProcessor={frameProcessor}
          frameProcessorFps={5}
        />
      )}
    </>
  );
};

export default ColorDetector;

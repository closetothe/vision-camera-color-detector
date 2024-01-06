# vision-camera-color-detector

React Native Vision Camera Frame Processor Plugin for detecting colors in realtime

## Versions

react-native-vision-camera version >= 3 is required

## Installation

```sh
yarn add vision-camera-color-detector
cd ios && pod install
```

Add the plugin to your `babel.config.js`:

```js
module.exports = {
   plugins: [['react-native-worklets-core/plugin']],
    // ...
```

> Note: You have to restart metro-bundler for changes in the `babel.config.js` file to take effect.

## Usage

1. Detect colors with vision camera.

   ```js
   import { detectColors } from 'vision-camera-color-detector';

   // ...
   const frameProcessor = useFrameProcessor((frame) => {
     'worklet';
     const result = detectColors(frame);
   }, []);
   ```

## Supported Platforms

- iOS

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

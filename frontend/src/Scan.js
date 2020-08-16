import React, { useState, useEffect } from 'react';
import { Text, View, StyleSheet, Button } from 'react-native';
import { BarCodeScanner } from 'expo-barcode-scanner';

export default function App() {
  const [hasPermission, setHasPermission] = useState(null);
  const [scanned, setScanned] = useState(false);

  useEffect(() => {
    (async () => {
      const { status } = await BarCodeScanner.requestPermissionsAsync();
      setHasPermission(status === 'granted');
    })();
  }, []);

  const handleBarCodeScanned = ({ type, data }) => {
    setScanned(true);
    // alert(`Bar code with type ${type} and data ${data} has been scanned!`);
    alert(`Your book with ISBN: ${data} has been scanned!`);
  };

  if (hasPermission === null) {
    return <Text>Requesting for camera permission</Text>;
  }
  if (hasPermission === false) {
    return <Text>No access to camera</Text>;
  }

  return (
    <View
      style={{
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'flex-end',
      }}>
      <BarCodeScanner
        onBarCodeScanned={scanned ? undefined : handleBarCodeScanned}
        style={StyleSheet.absoluteFillObject}
      />

      {scanned && <Button title={'Tap to Scan Again'} onPress={() => setScanned(false)} />}
    </View>
  );
}











// import React, { Component } from 'react';
// import {
//   Text,
//   View,
//   StyleSheet,
//   Alert,
//   TouchableOpacity,
//   Image
// } from 'react-native';
// // import { RNCamera } from 'react-native-camera';
// import { Camera } from 'expo-camera';
// import FontAwesome5 from 'react-native-vector-icons/FontAwesome5';



// // export default class BarcodeScan extends Component {
// //   constructor(props) {
// //     super(props);
// //     this.handleTourch = this.handleTourch.bind(this);
// //     this.state = {
// //       torchOn: false
// //     }
// //   }
// //   onBarCodeRead = (e) => {
// //     Alert.alert("Barcode value is" + e.data, "Barcode type is" + e.type);
// //   }
// //   handleTourch(value) {
// //     if (value === true) {
// //       this.setState({ torchOn: false });
// //     } else {
// //       this.setState({ torchOn: true });
// //     }
// //   }
// //   render() {
// //     return (
// //       <View style={styles.container}>
// //         <RNCamera
// //           style={styles.preview}
// //           flashMode={this.state.torchOn ? RNCamera.Constants.FlashMode.on : RNCamera.Constants.FlashMode.off}
// //           onBarCodeRead={this.onBarCodeRead}
// //           ref={cam => this.camera = cam}
// //           androidCameraPermissionOptions={{
// //             title: 'Permission to use camera',
// //             message: 'We need your permission to use your camera',
// //             buttonPositive: 'Ok',
// //             buttonNegative: 'Cancel',
// //           }}
// //         // aspect={RNCamera.Constants.Aspect.fill}
// //         >
// //           <Text style={{
// //             backgroundColor: 'white'
// //           }}>BARCODE SCANNER</Text>
// //         </RNCamera>
// //         <View style={styles.bottomOverlay}>
// //           <TouchableOpacity onPress={() => this.handleTourch(this.state.torchOn)}>
// //             {/* <Image style={styles.cameraIcon}
// //               source={this.state.torchOn === true ?
// //                 require('../../images/flasher_on.png') :
// //                 require('../../images/flasher_off.png')}
// //             /> */}
// //             {this.state.torchOn ?
// //               <FontAwesome5 name={'sun'} solid style={styles.cameraIcon} /> :
// //               <FontAwesome5 name={'sun'} regular style={styles.cameraIcon} />}
// //           </TouchableOpacity>
// //         </View>
// //       </View>
// //     )
// //   }

// // }




// export default class BarcodeScan extends Component {
//   constructor(props) {
//     super(props);
//     this.handleTourch = this.handleTourch.bind(this);
//     this.state = {
//       torchOn: false
//     }
//   }
//   onBarCodeRead = (e) => {
//     Alert.alert("Barcode value is" + e.data, "Barcode type is" + e.type);

//   }
//   handleTourch(value) {
//     if (value === true) {
//       this.setState({ torchOn: false });
//     } else {
//       this.setState({ torchOn: true });
//     }
//   }
//   render() {
//     return (
//       <View style={styles.container}>
//         <Camera
//           style={styles.preview}
//           flashMode={this.state.torchOn ? Camera.Constants.FlashMode.on : Camera.Constants.FlashMode.off}
//           onBarCodeRead={this.onBarCodeRead}
//           ref={cam => this.camera = cam}
//           androidCameraPermissionOptions={{
//             title: 'Permission to use camera',
//             message: 'We need your permission to use your camera',
//             buttonPositive: 'Ok',
//             buttonNegative: 'Cancel',
//           }}
//         // aspect={Camera.Constants.Aspect.fill}
//         >
//           <Text style={{
//             backgroundColor: 'white'
//           }}>BARCODE SCANNER</Text>
//         </Camera>
//         <View style={styles.bottomOverlay}>
//           <TouchableOpacity onPress={() => this.handleTourch(this.state.torchOn)}>
//             {/* <Image style={styles.cameraIcon}
//               source={this.state.torchOn === true ?
//                 require('../../images/flasher_on.png') :
//                 require('../../images/flasher_off.png')}
//             /> */}
//             {this.state.torchOn ?
//               <FontAwesome5 name={'sun'} solid style={styles.cameraIcon} /> :
//               <FontAwesome5 name={'sun'} regular style={styles.cameraIcon} />}
//           </TouchableOpacity>
//         </View>
//       </View>
//     )
//   }

// }





const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
  },
  preview: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center'
  },
  cameraIcon: {
    margin: 5,
    height: 40,
    width: 40
  },
  bottomOverlay: {
    position: "absolute",
    width: "100%",
    flex: 20,
    flexDirection: "row",
    justifyContent: "space-between"
  },
});
    // export default function Scan({ navigation }) {
    //   return (
    //     <View>
    //       <Button
    //         title="Go to Index"
    //         onPress={() =>
    //           navigation.navigate('Index')
    //         }
    //       />
    //       <Text>HI scan</Text>
    //     </View>
    //   )
    // }
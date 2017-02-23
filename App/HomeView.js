/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    TouchableOpacity,
    NativeEventEmitter,
    Navigator,
    ListView,
    Image,
    NativeModules,
    View
} from 'react-native';

import homeView from './HomeView';
import AMapView from './AMapView';
import DriveRouteView from './Map/Route/DriveRouteView';

let Dimensions = require('Dimensions');
let totalWidth = Dimensions.get('window').width;
let totalHeight = Dimensions.get('window').height;


var AMapSDK = NativeModules.AMapSDK;


var MapEmitterTool = NativeModules.EventEmitterTool;
const myNativeEvt = new NativeEventEmitter(ChivoxISE);  //创建自定义事件接口





export default class App extends Component {
    constructor(props) {
        super(props);
        this.state={
            position:''
        }

    }

    iseCallback(data) {
    console.log('123回调了',data);

        this.setState({
            position:'\n经度:'+data.latitude+'  纬度:'+data.longitude
        })
    }

    componentDidMount() {
        // this.listener = myNativeEvt.addListener('isPosition',
        //     (notification) => console.log('回传了', notification.longitude)
        // );  //对应了原生端的名字

        this.listener = myNativeEvt.addListener('isPosition', this.iseCallback.bind(this));  //对应了原生端的名字

    }

    componentWillUnmount() {
        this.listener && this.listener.remove();  //记得remove哦
        this.listener = null;
    }

    //定位
    onPosition() {
        MapEmitterTool.positionAction();
    }

    onNavigation() {
        // 初始化导航数据
        // 始点经纬度 startLongitude startLatitude
        // 终点经续度 endLongitude endLatitude
        let dic={'startLatitude': 20.963396, 'startLongitude': 110.08221, 'endLatitude': 21.704622, 'endLongitude': 110.910089};
        AMapSDK.AMapRouteLoadAction(dic);
    }
    onRnNavigation(){
        if (this.props.navigator) {
            this.props.navigator.push({
                name: 'DriveRouteView',
                component: DriveRouteView,
            });
        }
    }

    render() {
        return (
            <View style={styles.container}>
                <View style={styles.viewStyles}>
                    <TouchableOpacity activeOpacity={0.5}
                                      onPress={()=>this.onPosition()} style={{height: 38, width: 90,marginRight:10}}>
                        <View  >
                            < Text style={styles.instructions}>RN定位</Text>
                        </View>
                    </TouchableOpacity>

                    <Text >当前位置是:{this.state.position}</Text>
                </View>
                <View style={styles.viewStyles}>

                    <TouchableOpacity activeOpacity={0.5}
                                      onPress={()=>this.onNavigation() } style={{height: 30, width: 90}}>
                        <View >
                            < Text style={styles.instructions}>原生导航</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity activeOpacity={0.5}
                                      onPress={()=>this.onRnNavigation()} style={{height: 43, width: 120}}>
                        <View  >
                            < Text style={styles.instructions}>RN导航</Text>
                        </View>
                    </TouchableOpacity>
                </View>

                <AMapView style={{width: totalWidth, height: totalHeight - 40}}></AMapView>

            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        marginTop: 20,
        backgroundColor: '#F5FCFF',

    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    viewStyles: {
        flexDirection: 'row'
    },
    instructions: {
        width: 75,
        height: 30,
        textAlign: 'center',
        paddingTop: 10,
        marginLeft: 20,
        marginBottom: 20,
        backgroundColor: '#1234',
        flexDirection: 'column',

    },
    view: {
        width: 500,
        height: 120,
    }
});


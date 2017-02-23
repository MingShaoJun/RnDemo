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
    View,
    NativeModules,
    TouchableOpacity
} from 'react-native';

let Dimensions = require('Dimensions');
let totalWidth = Dimensions.get('window').width;
let totalHeight = Dimensions.get('window').height;

import RouteMapViewSDK from './RouteMapViewSDK';


var routePlanSDK = NativeModules.RoutePlanSDK;

export default class RnDemo extends Component {

    constructor(props) {
        super(props);
        this.state = {
            choiceSelect: [0, 0, 0, 0],
            aMapRouteLoad: {
                'startLatitude': 20.963396,
                'startLongitude': 110.08221,
                'endLatitude': 21.704622,
                'endLongitude': 110.910089
            }
        }
    }

    //选择条件
    onChoice(data) {
        var arr = this.state.choiceSelect;
        let colo = this.state.choiceSelect[data - 1] == '0' ? '1' : '0';
        if(data==2||data==3){
            if(colo == 1){
                arr[3] = '0';
            }
        }
        if(data==4){
            if(colo == 1){
                console.log('选中了改',data);

                arr[1] = '0';
                arr[2] = '0';
            }
        }

        arr[data - 1] = colo;
        this.setState({
            choiceSelect: arr,
        });
        routePlanSDK.onChoice(data);
    }

    // 规划
    onRoutePlanAction(data) {
        routePlanSDK.routePlanActionMultiple(data);
    }

    //颜色处理
    coloAction(data) {
        return this.state.choiceSelect[data] == 0 ? '#000000' : 'red'
    }

    routePlanActionMultipdd(data) {
        routePlanSDK.routePlanActionMultipdd(data.nativeEvent.layout.x, data.nativeEvent.layout.y, data.nativeEvent.layout.width
            , data.nativeEvent.layout.height);

    }

    render() {
        return (
            <View
                style={styles.container}>
                <Text>起点:纬度{this.state.aMapRouteLoad.startLatitude}
                    经度 {this.state.aMapRouteLoad.startLongitude} </Text>
                <Text>终点:纬度{this.state.aMapRouteLoad.endLatitude}
                    经度 {this.state.aMapRouteLoad.endLongitude}</Text>

                <View
                    style={{
                        flexWrap: 'wrap',
                        flexDirection: 'row',
                        alignSelf: 'center'
                    }}>
                    <TouchableOpacity
                        activeOpacity={0.9}
                        onPress={()=>this.onChoice(1)}>
                        <View  >
                            < Text
                                style={[styles.instructions, {
                                    borderColor: this.coloAction(0),
                                    color: this.coloAction(0)
                                }]}>躲避拥堵</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity
                        activeOpacity={0.9}
                        onPress={()=>this.onChoice(2)}>
                        <View  >
                            < Text
                                style={[styles.instructions, {
                                    borderColor: this.coloAction(1),
                                    color: this.coloAction(1)
                                }]}>避免收费</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity
                        activeOpacity={0.9}
                        onPress={()=>this.onChoice(3)}>
                        <View  >
                            < Text
                                style={[styles.instructions, {
                                    borderColor: this.coloAction(2),
                                    color: this.coloAction(2)
                                }]}>不走高速</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity
                        activeOpacity={0.9}
                        onPress={()=>this.onChoice(4)}>
                        <View  >
                            < Text
                                style={[styles.instructions, {
                                    borderColor: this.coloAction(3),
                                    color: this.coloAction(3)
                                }]}>高速优先</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <View
                    style={{
                        flexWrap: 'wrap',
                        marginTop: 6,
                        flexDirection: 'row',
                        alignSelf: 'center'
                    }}>

                    <TouchableOpacity
                        activeOpacity={0.5}
                        onPress={()=>this.onRoutePlanAction(0)}>
                        <View  >
                            < Text
                                style={styles.instructions}>单路径规划</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity
                        activeOpacity={0.5}
                        onPress={()=>this.onRoutePlanAction(1)}>
                        <View  >
                            < Text
                                style={styles.instructions}>多路径规划</Text>
                        </View>
                    </TouchableOpacity>

                </View>

                <RouteMapViewSDK
                    style={{
                        width: totalWidth,
                        flex: 1,
                    }}
                    onLayout={(auonView)=>this.routePlanActionMultipdd(auonView)}
                    aMapRouteLoad={this.state.aMapRouteLoad}
                ></RouteMapViewSDK>



            </View>
        );
    }
}

// startLatitude:                      React.PropTypes.number,
// startLongitude:                    PropTypes.number,
// endLatitude:                        React.PropTypes.number,
// endLongitude:

const styles = StyleSheet.create({
    container: {
        flex: 1,
        position: 'relative',
        marginTop: 20,
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        width: 80,
        height: 30,
        textAlign: 'center',
        paddingTop: 7,
        marginLeft: 6,
        flexDirection: 'column',
        borderRadius: 8,
        borderWidth: 1,


    }
});


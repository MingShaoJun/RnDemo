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
    Navigator,
    TouchableOpacity,
} from 'react-native';

import homeView from './HomeView';
import DriveRouteView from './Map/Route/DriveRouteView';

import Test from './Map/Route/Test';

export default class AwesomeProject extends Component {

    render() {
        let defaultName = 'homeView';
        let defaultComponent = homeView;

        return (
            <View style={{flex: 1}}>
                <Navigator
                    initialRoute={{name: defaultName, component: defaultComponent}}
                    configureScene={(route) => {
                        return Navigator.SceneConfigs.FloatFromRight;
                    }}
                    renderScene={(route, navigator) => {
                        let Component = route.component;
                        return <Component {...route.params} navigator={navigator}/>
                    }}>

                </Navigator>

            </View>

        );

    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});

AppRegistry.registerComponent('RnDemo', () => AwesomeProject);

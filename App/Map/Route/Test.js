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
    View
} from 'react-native';


export default class Test extends Component {

    testddd(auonView) {
        console.log('这个是', auonView.nativeEvent.layout.height);
    }

    render() {
        return (
            <View
                style={styles.container}
            >
                <Text
                    style={styles.welcome}>
                    Welcome to
                    React
                    Native!
                </Text>
                <View
                    style={styles.test}
                    onLayout={(auonView)=>this.testddd(auonView)}

                >
                    <Text>
                        这是中间
                    </Text>
                </View>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>


                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
                <Text
                    style={styles.instructions}>
                    Double tap
                    R on your
                    keyboard
                    to
                    reload,{'\n'}
                    Shake or
                    press menu
                    button for
                    dev menu
                </Text>
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
    test: {
        flex: 1,
        backgroundColor: 'red',

    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});




import React, { Component, PropTypes } from 'react';
import { requireNativeComponent } from 'react-native';


export default class MapView extends Component {



    componentDidMount() {
    }
    render() {
        return <AMapSDK {...this.props}/>;
    }
}


var AMapSDK = requireNativeComponent('AMapSDK', AMapSDK);

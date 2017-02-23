

import React, { Component, PropTypes } from 'react';
import { requireNativeComponent } from 'react-native';


export default class RoutePlanSDK extends Component {


    static propTypes = {
        // startLatitude:                      React.PropTypes.number,
        // startLongitude:                    PropTypes.number,
        // endLatitude:                        React.PropTypes.number,
        // endLongitude:                   React.PropTypes.number,

        aMapRouteLoad:                   React.PropTypes.object,
    };

    componentDidMount() {

        console.log("RouteMapViewSDK被加载了");
    }
    render() {
        return <RouteMapViewSDK {...this.props}/>;
    }
}


var RouteMapViewSDK = requireNativeComponent('RoutePlanSDK', RoutePlanSDK);

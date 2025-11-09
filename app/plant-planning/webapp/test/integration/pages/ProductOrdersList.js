sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.nestle.pp.plantplanning',
            componentId: 'ProductOrdersList',
            contextPath: '/ProductOrders'
        },
        CustomPageDefinitions
    );
});
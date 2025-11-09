sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.nestle.pp.plantplanning',
            componentId: 'OrderOperationsObjectPage',
            contextPath: '/ProductOrders/operations'
        },
        CustomPageDefinitions
    );
});
sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/nestle/pp/plantplanning/test/integration/pages/ProductOrdersList",
	"com/nestle/pp/plantplanning/test/integration/pages/ProductOrdersObjectPage",
	"com/nestle/pp/plantplanning/test/integration/pages/OrderOperationsObjectPage"
], function (JourneyRunner, ProductOrdersList, ProductOrdersObjectPage, OrderOperationsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/nestle/pp/plantplanning') + '/test/flp.html#app-preview',
        pages: {
			onTheProductOrdersList: ProductOrdersList,
			onTheProductOrdersObjectPage: ProductOrdersObjectPage,
			onTheOrderOperationsObjectPage: OrderOperationsObjectPage
        },
        async: true
    });

    return runner;
});


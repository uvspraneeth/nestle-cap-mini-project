sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/nestle/pm/plantmaintenance/test/integration/pages/MaintNotificationsList",
	"com/nestle/pm/plantmaintenance/test/integration/pages/MaintNotificationsObjectPage",
	"com/nestle/pm/plantmaintenance/test/integration/pages/NotificationItemsObjectPage"
], function (JourneyRunner, MaintNotificationsList, MaintNotificationsObjectPage, NotificationItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/nestle/pm/plantmaintenance') + '/test/flp.html#app-preview',
        pages: {
			onTheMaintNotificationsList: MaintNotificationsList,
			onTheMaintNotificationsObjectPage: MaintNotificationsObjectPage,
			onTheNotificationItemsObjectPage: NotificationItemsObjectPage
        },
        async: true
    });

    return runner;
});


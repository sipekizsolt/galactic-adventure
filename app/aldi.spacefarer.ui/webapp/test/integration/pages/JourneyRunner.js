sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aldi/spacefarer/ui/test/integration/pages/SpacefarerList",
	"aldi/spacefarer/ui/test/integration/pages/SpacefarerObjectPage"
], function (JourneyRunner, SpacefarerList, SpacefarerObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aldi/spacefarer/ui') + '/test/flp.html#app-preview',
        pages: {
			onTheSpacefarerList: SpacefarerList,
			onTheSpacefarerObjectPage: SpacefarerObjectPage
        },
        async: true
    });

    return runner;
});


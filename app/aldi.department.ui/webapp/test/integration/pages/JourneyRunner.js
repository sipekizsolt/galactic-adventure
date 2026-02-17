sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aldi/department/ui/test/integration/pages/DepartmentList",
	"aldi/department/ui/test/integration/pages/DepartmentObjectPage"
], function (JourneyRunner, DepartmentList, DepartmentObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aldi/department/ui') + '/test/flp.html#app-preview',
        pages: {
			onTheDepartmentList: DepartmentList,
			onTheDepartmentObjectPage: DepartmentObjectPage
        },
        async: true
    });

    return runner;
});


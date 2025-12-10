sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"appproductosprocode/proveedores/test/integration/pages/ProveedoresList",
	"appproductosprocode/proveedores/test/integration/pages/ProveedoresObjectPage"
], function (JourneyRunner, ProveedoresList, ProveedoresObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('appproductosprocode/proveedores') + '/test/flpSandbox.html#appproductosprocodeproveedores-tile',
        pages: {
			onTheProveedoresList: ProveedoresList,
			onTheProveedoresObjectPage: ProveedoresObjectPage
        },
        async: true
    });

    return runner;
});


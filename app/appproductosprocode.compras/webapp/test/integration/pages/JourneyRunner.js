sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"appproductosprocode/compras/test/integration/pages/ComprasList",
	"appproductosprocode/compras/test/integration/pages/ComprasObjectPage"
], function (JourneyRunner, ComprasList, ComprasObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('appproductosprocode/compras') + '/test/flpSandbox.html#appproductosprocodecompras-tile',
        pages: {
			onTheComprasList: ComprasList,
			onTheComprasObjectPage: ComprasObjectPage
        },
        async: true
    });

    return runner;
});


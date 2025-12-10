sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"appproductosprocode/productos/test/integration/pages/ProductosList",
	"appproductosprocode/productos/test/integration/pages/ProductosObjectPage"
], function (JourneyRunner, ProductosList, ProductosObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('appproductosprocode/productos') + '/test/flpSandbox.html#appproductosprocodeproductos-tile',
        pages: {
			onTheProductosList: ProductosList,
			onTheProductosObjectPage: ProductosObjectPage
        },
        async: true
    });

    return runner;
});


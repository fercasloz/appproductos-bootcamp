using { appProductosProCodeSrv } from '../srv/service.cds';

annotate appProductosProCodeSrv.Productos with @UI.HeaderInfo: { TypeName: 'Producto', TypeNamePlural: 'Productos', Title: { Value: nombre } };
annotate appProductosProCodeSrv.Productos with {
  ID @UI.Hidden @Common.Text: { $value: nombre, ![@UI.TextArrangement]: #TextOnly }
};
annotate appProductosProCodeSrv.Productos with @UI.Identification: [{ Value: nombre }];
annotate appProductosProCodeSrv.Productos with {
  proveedor @Common.ValueList: {
    CollectionPath: 'Proveedores',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: proveedor_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nombre'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contacto'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'telefono'
      },
    ],
  }
};
annotate appProductosProCodeSrv.Productos with @UI.DataPoint #cantidadEnStock: {
  Value: cantidadEnStock,
  Title: 'Cantidad en Stock',
};
annotate appProductosProCodeSrv.Productos with {
  precio @title: 'Precio';
  cantidadEnStock @title: 'Cantidad en Stock';
  descripcion @title: 'Descripción'
};

annotate appProductosProCodeSrv.Productos with {
  precio @Measures.ISOCurrency: Currency_code
};

annotate appProductosProCodeSrv.Productos with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: precio },
 { $Type: 'UI.DataField', Value: cantidadEnStock },
 { $Type: 'UI.DataField', Value: descripcion },
    { $Type: 'UI.DataField', Label: 'Proveedor', Value: proveedor_ID }
];

annotate appProductosProCodeSrv.Productos with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: precio },
 { $Type: 'UI.DataField', Value: cantidadEnStock },
 { $Type: 'UI.DataField', Value: descripcion },
    { $Type: 'UI.DataField', Label: 'Proveedor', Value: proveedor_ID }
  ]
};

annotate appProductosProCodeSrv.Productos with {
  proveedor @Common.Text: { $value: proveedor.nombre, ![@UI.TextArrangement]: #TextOnly }
};

annotate appProductosProCodeSrv.Productos with {
  proveedor @Common.Label: 'Proveedor';
  compras @Common.Label: 'Compras'
};

annotate appProductosProCodeSrv.Productos with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cantidadEnStock' }
];

annotate appProductosProCodeSrv.Productos with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appProductosProCodeSrv.Productos with @UI.SelectionFields: [
  proveedor_ID
];

annotate appProductosProCodeSrv.Proveedores with @UI.HeaderInfo: { TypeName: 'Proveedor', TypeNamePlural: 'Proveedores', Title: { Value: nombre } };
annotate appProductosProCodeSrv.Proveedores with {
  ID @UI.Hidden @Common.Text: { $value: nombre, ![@UI.TextArrangement]: #TextOnly }
};
annotate appProductosProCodeSrv.Proveedores with @UI.Identification: [{ Value: nombre }];
annotate appProductosProCodeSrv.Proveedores with {
  contacto @title: 'Contacto';
  telefono @title: 'Teléfono'
};

annotate appProductosProCodeSrv.Proveedores with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: contacto },
 { $Type: 'UI.DataField', Value: telefono }
];

annotate appProductosProCodeSrv.Proveedores with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: contacto },
 { $Type: 'UI.DataField', Value: telefono }
  ]
};

annotate appProductosProCodeSrv.Proveedores with {
  productos @Common.Label: 'Productos'
};

annotate appProductosProCodeSrv.Proveedores with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appProductosProCodeSrv.Proveedores with @UI.SelectionFields: [
  nombre
];

annotate appProductosProCodeSrv.Compras with @UI.HeaderInfo: { TypeName: 'Compra', TypeNamePlural: 'Compras' };
annotate appProductosProCodeSrv.Compras with {
  cliente @Common.ValueList: {
    CollectionPath: 'Clientes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: cliente_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nombre'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'direccion'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'puntosDeFidelidad'
      },
    ],
  }
};
annotate appProductosProCodeSrv.Compras with {
  producto @Common.ValueList: {
    CollectionPath: 'Productos',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: producto_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nombre'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'precio'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cantidadEnStock'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'descripcion'
      },
    ],
  }
};
annotate appProductosProCodeSrv.Compras with @UI.DataPoint #fecha: {
  Value: fecha,
  Title: 'Fecha',
};
annotate appProductosProCodeSrv.Compras with @UI.DataPoint #cantidad: {
  Value: cantidad,
  Title: 'Cantidad',
};
annotate appProductosProCodeSrv.Compras with {
  fecha @title: 'Fecha';
  total @title: 'Total';
  cantidad @title: 'Cantidad'
};

annotate appProductosProCodeSrv.Compras with {
  total @Measures.ISOCurrency: Currency_code
};

annotate appProductosProCodeSrv.Compras with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: fecha },
 { $Type: 'UI.DataField', Value: total },
 { $Type: 'UI.DataField', Value: cantidad },
    { $Type: 'UI.DataField', Label: 'Cliente', Value: cliente_ID },
    { $Type: 'UI.DataField', Label: 'Producto', Value: producto_ID }
];

annotate appProductosProCodeSrv.Compras with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: fecha },
 { $Type: 'UI.DataField', Value: total },
 { $Type: 'UI.DataField', Value: cantidad },
    { $Type: 'UI.DataField', Label: 'Cliente', Value: cliente_ID },
    { $Type: 'UI.DataField', Label: 'Producto', Value: producto_ID }
  ]
};

annotate appProductosProCodeSrv.Compras with {
  cliente @Common.Text: { $value: cliente.nombre, ![@UI.TextArrangement]: #TextOnly };
  producto @Common.Text: { $value: producto.nombre, ![@UI.TextArrangement]: #TextOnly }
};

annotate appProductosProCodeSrv.Compras with {
  cliente @Common.Label: 'Cliente';
  producto @Common.Label: 'Producto'
};

annotate appProductosProCodeSrv.Compras with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#fecha' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cantidad' }
];

annotate appProductosProCodeSrv.Compras with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appProductosProCodeSrv.Compras with @UI.SelectionFields: [
  cliente_ID,
  producto_ID
];

annotate appProductosProCodeSrv.Clientes with @UI.HeaderInfo: { TypeName: 'Cliente', TypeNamePlural: 'Clientes', Title: { Value: nombre } };
annotate appProductosProCodeSrv.Clientes with {
  ID @UI.Hidden @Common.Text: { $value: nombre, ![@UI.TextArrangement]: #TextOnly }
};
annotate appProductosProCodeSrv.Clientes with @UI.Identification: [{ Value: nombre }];
annotate appProductosProCodeSrv.Clientes with @UI.DataPoint #puntosDeFidelidad: {
  Value: puntosDeFidelidad,
  Title: 'Puntos de Fidelidad',
};
annotate appProductosProCodeSrv.Clientes with {
  direccion @title: 'Dirección';
  puntosDeFidelidad @title: 'Puntos de Fidelidad'
};

annotate appProductosProCodeSrv.Clientes with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: direccion },
 { $Type: 'UI.DataField', Value: puntosDeFidelidad }
];

annotate appProductosProCodeSrv.Clientes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: direccion },
 { $Type: 'UI.DataField', Value: puntosDeFidelidad }
  ]
};

annotate appProductosProCodeSrv.Clientes with {
  compras @Common.Label: 'Compras'
};

annotate appProductosProCodeSrv.Clientes with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#puntosDeFidelidad' }
];

annotate appProductosProCodeSrv.Clientes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate appProductosProCodeSrv.Clientes with @UI.SelectionFields: [
  nombre
];


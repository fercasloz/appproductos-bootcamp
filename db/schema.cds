namespace AppProductosProCode;
using { cuid, Currency } from '@sap/cds/common';

@assert.unique: { nombre: [nombre] }
entity Productos : cuid {
  nombre: String(100) @mandatory;
  precio: Decimal(10,2);
  Currency: Currency;
  cantidadEnStock: Integer;
  descripcion: String(500);
  proveedor: Association to Proveedores;
  compras: Association to many Compras on compras.producto = $self;
}

@assert.unique: { nombre: [nombre] }
entity Proveedores : cuid {
  nombre: String(100) @mandatory;
  contacto: String(100);
  telefono: String(15);
  productos: Association to many Productos on productos.proveedor = $self;
}

entity Compras : cuid {
  fecha: Date;
  total: Decimal(10,2);
  Currency: Currency;
  cantidad: Integer;
  cliente: Association to Clientes;
  producto: Association to Productos;
}

@assert.unique: { nombre: [nombre] }
entity Clientes : cuid {
  nombre: String(100) @mandatory;
  direccion: String(200);
  puntosDeFidelidad: Integer;
  compras: Association to many Compras on compras.cliente = $self;
}


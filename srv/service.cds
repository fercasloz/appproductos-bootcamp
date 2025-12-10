using { AppProductosProCode as my } from '../db/schema.cds';

@path: '/service/appProductosProCode'
@requires: 'authenticated-user'
service appProductosProCodeSrv {
  @odata.draft.enabled
  entity Productos as projection on my.Productos;
  @odata.draft.enabled
  entity Proveedores as projection on my.Proveedores;
  @odata.draft.enabled
  entity Compras as projection on my.Compras;
  @odata.draft.enabled
  entity Clientes as projection on my.Clientes;
}
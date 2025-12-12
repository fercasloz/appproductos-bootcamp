/**
 * Este manejador de eventos se ejecuta cuando se crea un nuevo proveedor en la entidad "appProductosProCodeSrv.Proveedores".
 * @On(event = { "CREATE" }, entity = "appProductosProCodeSrv.Proveedores")
 * @param {cds.Request} request - Contiene información del usuario, modelo CDS específico del inquilino, encabezados y parámetros de consulta.
 * @param {Function} next - Función de devolución de llamada al siguiente manejador.
 */

const { message } = require("@sap/cds/lib/log/cds-error");

module.exports = async function(request, next) { //función asíncrona

  // Obtener los datos del proveedor desde la solicitud.
  const{contacto, telefono} = request.data || {}; // evitamos errores si data viene sin informar

  if(contacto != null && String(contacto).trim() !== ''){ // verificamos si la informacion de contacto esta definida

    // Definir una expresión regular para verificar si el contacto es un correo electrónico válido.
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    //Normalizamos el mail convirtiendolo a cadena quitando espacios y pasandolo todo a minisculas
    const email = String(contacto).trim().toLowerCase();
  
    // Usar la expresión regular para verificar el formato del correo electrónico.
    if (!emailRegex.test(email)) {
      // Si el contacto no es un correo electrónico válido, rechazar la solicitud con un error 400.
      
      return request.reject(400, {
        code : 'INVALID_EMAIL',
        message : 'El contacto debe ser un email válido',
        target : 'contacto'
      
      });

    }
  }
  
  if(telefono != null && String(telefono).trim() !== ''){
    const tel = String(telefono).replace(/\s|-/g, '');
    const phoneRegex = /^\+52\d{10}$/; 

    if(!phoneRegex.test(tel)){
      return request.reject(400, {
          code : 'INVALID_PHONE',
          message : 'El telefono debe ser un número válido mexicano estándar',
          target : 'telefono'
            
      });
    }
  }


  // Si el contacto y el teléfono son válidos, continuar con el siguiente manejador.
  return next();

}
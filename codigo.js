// Función para mostrar la página web
function doGet() {
  return HtmlService.createHtmlOutputFromFile('index')
    .setTitle('¡Primer Añito Bajo el Mar!')
    .setXFrameOptionsMode(HtmlService.XFrameOptionsMode.ALLOWALL)
    .addMetaTag('viewport', 'width=device-width, initial-scale=1');
}

// Función para guardar los datos que vienen del formulario
function procesarFormulario(datos) {
  // 1. Conectamos con la hoja de cálculo activa
  var hoja = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

  // 2. Extraemos los datos del objeto que viene del HTML
  // Los nombres (nombre, asistencia, dieta) deben ser iguales al atributo 'name' de los <input> y <select>
  var nombre = datos.nombre;
  var asistencia = datos.asistencia;
  var dieta = datos.dieta || "Ninguna"; // Si está vacío, ponemos "Ninguna"
  var fecha = new Date(); // Registra el momento exacto de la respuesta

  // 3. Agregamos una fila al final de la hoja con los datos
  hoja.appendRow([nombre, asistencia, dieta, fecha]);

  // 4. Enviamos una respuesta de éxito al usuario
  return "¡Burbujeante! 🫧 Tu respuesta se guardó correctamente. ¡Te esperamos!";
}

// 1. Esta función lee los regalos del Sheet
function obtenerRegalosDinamicos() {
  try {
    const ss = SpreadsheetApp.getActiveSpreadsheet();
    const hoja = ss.getSheetByName("Regalos"); // ¡OJO! La pestaña debe llamarse exactamente Regalos
    const datos = hoja.getDataRange().getValues();

    datos.shift(); // Quitamos la fila 1 (encabezados)

    // Filtramos: Solo enviamos los que tienen cupo (Columna C: Limite, Columna D: Reservados)
    // Nota: Columna C es índice 2, Columna D es índice 3
    const disponibles = datos.filter(fila => {
      const limite = fila[2] || 1; // Si está vacío, asumimos 1
      const reservados = fila[3] || 0;
      return reservados < limite;
    }).map(fila => {
      return {
        nombre: fila[0],
        foto: fila[1]
      };
    });

    return disponibles;
  } catch (e) {
    return []; // Si hay error, devuelve lista vacía para que no se trabe la app
  }
}

// 2. Esta función registra la reserva (+1 en la columna D)
function registrarReserva(nombreProducto) {
  const lock = LockService.getScriptLock();

  try {
    // Intentar bloquear por solo 2 segundos (2000ms)
    // Es tiempo más que suficiente para una operación de Sheet
    lock.waitLock(2000);

    const ss = SpreadsheetApp.getActiveSpreadsheet();
    const hoja = ss.getSheetByName("Regalos");
    const datos = hoja.getDataRange().getValues();

    for (let i = 1; i < datos.length; i++) {
      if (datos[i][0] === nombreProducto) {
        const limite = Number(datos[i][2]) || 1;
        const reservadosActuales = Number(datos[i][3]) || 0;

        if (reservadosActuales < limite) {
          const celdaReservados = hoja.getRange(i + 1, 4);
          celdaReservados.setValue(reservadosActuales + 1);

          // Importante: Forzar que se guarde el dato antes de soltar el candado
          SpreadsheetApp.flush();

          lock.releaseLock();
          return "¡Reserva exitosa para: " + nombreProducto + "!";
        } else {
          lock.releaseLock();
          return "¡Llegaste justo! Ese regalo ya se completó. Por favor elige otro.";
        }
      }
    }
    lock.releaseLock();
    return "No encontramos el producto.";

  } catch (e) {
    // Si pasaron los 2 segundos y sigue bloqueado
    return "El sistema está algo ocupado. ¡Vuelve a presionar Reservar en un instante!";
  }
}
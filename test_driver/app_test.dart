// Importa la Flutter Driver API
// import 'package:crud/pages/login_admin.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('flutter dancein app test', () {
    // Primero, define los Finders. Podemos usarlos para localizar Widgets desde
    // la suite de test. Nota: los Strings proporcionados al método `byValueKey`
    // deben ser los mismos que los Strings utilizados para las Keys del paso 1.
    final buttonAdmin =  find.byValueKey("AdministradorBoton");
    final textFieldAdmin =  find.byValueKey("nombreAdmin");
    final texFieldContraAdmin =  find.byValueKey("contraAdmin");
    final buttonEntrar =  find.byValueKey("EntrarBoton");
    final buttonCrear =  find.byValueKey("crearButon");
    final buttonAcademias = find.byValueKey("EntrarAcademiasButon");
    final textFieldNombre =  find.byValueKey("nombre");
    final textFieldEstiloBaile =  find.byValueKey("estiloBaile");
    final textFieldCiudad =  find.byValueKey("ciudad");
    final textFieldTelefono =  find.byValueKey("telefono");
    final textFieldCelular =  find.byValueKey("celular");
    final textFieldCorreo =  find.byValueKey("correo");
    final textFieldDescripcio =  find.byValueKey("descripcion");
    final buttonGuardar =  find.byValueKey("guardarBoton");
    
    final buttonEventos = find.byValueKey("EntrarEventosButon");
    final textFieldNombreE = find.byValueKey("NombreEvento");
    final textFieldOrganizador = find.byValueKey("NombreOrganizadorEvento");
    final textFieldEstiloBaileE = find.byValueKey("EstiloBaileEvento");
    final textFieldCiudadE = find.byValueKey("CiudadEvento");
    final textFieldCelularE = find.byValueKey("CelularEvento");
    final textFieldFechaE = find.byValueKey("FechaEvento");
    final textFieldCorreoE = find.byValueKey("CorreoEvento");
    final textFieldDescripcionE = find.byValueKey("DescripcionEvento");
    final buttonGuardarE = find.byValueKey("GuardarEvento");
    final primerElemento = find.byValueKey("PrimerEvento");

    final buttonUsuario = find.byValueKey("UserButton");
    final buttonEventos1 = find.byValueKey("EntrarEventosButon1");
    final primerElemento1 = find.byValueKey("primerEvento1");

    final buttonCambiarContra = find.byValueKey("CambiarContra");
    final textFieldAdminContra = find.byValueKey("adminContra");
    final buttonVerificar = find.byValueKey("Verificar");
    final textFieldNuevaContra = find.byValueKey("Nuevacontra");
    final textFieldContraConfirmada = find.byValueKey("ContraConfirmada");
    final buttonGuardarContra = find.byValueKey("GuardarContra");



    FlutterDriver driver;

    // Conéctate al driver de Flutter antes de ejecutar cualquier test
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Cierra la conexión con el driver después de que se hayan completado los tests
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('click administrador button', () async {
      // Usa el método `driver.getText` para verificar que el contador comience en 0.

      // ensayo_page
      await driver.waitFor(buttonAdmin);
      await driver.tap(buttonAdmin);
      // login_admin
      await driver.waitFor(textFieldAdmin);
      await driver.tap(textFieldAdmin);
      await driver.enterText("admin");
      await driver.waitFor(texFieldContraAdmin);
      await driver.tap(texFieldContraAdmin);
      await driver.enterText("12345678");
      await driver.waitFor(buttonEntrar);
      await driver.tap(buttonEntrar);
      // choose_page
      await driver.waitFor(buttonAcademias);
      await driver.tap(buttonAcademias);
      // list_page
      await driver.waitFor(buttonCrear);
      await driver.tap(buttonCrear);
      // save_page
      await driver.waitFor(textFieldNombre);
      await driver.tap(textFieldNombre);
      await driver.enterText("Vertigo");
      await driver.waitFor(textFieldEstiloBaile);
      await driver.tap(textFieldEstiloBaile);
      await driver.enterText("urbano");
      await driver.waitFor(textFieldCiudad);
      await driver.tap(textFieldCiudad);
      await driver.enterText("Manizales");
      await driver.waitFor(textFieldTelefono);
      await driver.tap(textFieldTelefono);
      await driver.enterText("8888888");
      await driver.waitFor(textFieldCelular);
      await driver.tap(textFieldCelular);
      await driver.enterText("3104080146");
      await driver.waitFor(textFieldCorreo);
      await driver.tap(textFieldCorreo);
      await driver.enterText("gomezbeltran.manuel10@gmail.com");
      await driver.waitFor(textFieldDescripcio);
      await driver.tap(textFieldDescripcio);
      await driver.enterText("Escuela de baile con enfoque urbano, para todo tipos de edades.");
      await driver.waitFor(buttonGuardar);
      await driver.tap(buttonGuardar);
    });

    

    test('crear y modificar evento', () async {
      // Usa el método `driver.getText` para verificar que el contador comience en 0.

      // ensayo_page
      await driver.waitFor(buttonAdmin);
      await driver.tap(buttonAdmin);
      // login_admin
      await driver.waitFor(textFieldAdmin);
      await driver.tap(textFieldAdmin);
      await driver.enterText("admin");
      await driver.waitFor(texFieldContraAdmin);
      await driver.tap(texFieldContraAdmin);
      await driver.enterText("12345678");
      await driver.waitFor(buttonEntrar);
      await driver.tap(buttonEntrar);
      // choose_page
      await driver.waitFor(buttonEventos);
      await driver.tap(buttonEventos);
      // list_pageE
      await driver.waitFor(buttonCrear);
      await driver.tap(buttonCrear);
      // save_pageE
      await driver.waitFor(textFieldNombreE);
      await driver.tap(textFieldNombreE);
      await driver.enterText("Bailaton");
      await driver.waitFor(textFieldOrganizador);
      await driver.tap(textFieldOrganizador);
      await driver.enterText("Pedro");
      await driver.waitFor(textFieldEstiloBaileE);
      await driver.tap(textFieldEstiloBaileE);
      await driver.enterText("Urbano");
      await driver.waitFor(textFieldCiudadE);
      await driver.tap(textFieldCiudadE);
      await driver.enterText("Manizales");
      await driver.waitFor(textFieldCelularE);
      await driver.tap(textFieldCelularE);
      await driver.enterText("3104080146");
      await driver.waitFor(textFieldFechaE);
      await driver.tap(textFieldFechaE);
      await driver.enterText("28 de junio 2021");
      await driver.waitFor(textFieldCorreoE);
      await driver.tap(textFieldCorreoE);
      await driver.enterText("gomezbeltran.manuel10@gmail.com");
      await driver.waitFor(textFieldDescripcionE);
      await driver.tap(textFieldDescripcionE);
      await driver.enterText("Evento de participación libre");
      await driver.waitFor(buttonGuardarE);
      await driver.tap(buttonGuardarE);
      await driver.tap(find.byTooltip('Back'));
      // list_pageE
      await driver.waitFor(primerElemento);
      await driver.tap(primerElemento);
      // save_pageE
      await driver.enterText("21 de julio 2021");
      await driver.waitFor(textFieldCorreoE);
      await driver.tap(textFieldCorreoE);
      await driver.waitFor(buttonGuardarE);
      await driver.tap(buttonGuardarE);
    });
    
    test('consultar eventos y mostar info', () async {
      // Usa el método `driver.getText` para verificar que el contador comience en 0.

      // ensayo_page
      await driver.waitFor(buttonUsuario);
      await driver.tap(buttonUsuario);
      // choose_page1
      await driver.waitFor(buttonEventos1);
      await driver.tap(buttonEventos1);
      // list_pageE
      await driver.waitFor(primerElemento1);
      await driver.tap(primerElemento1);
      // view_page1
      await driver.tap(find.byTooltip('Back'));
      
    });
    
        test('recuperar contraseña', () async {
      // Usa el método `driver.getText` para verificar que el contador comience en 0.

      // ensayo_page
      await driver.waitFor(buttonAdmin);
      await driver.tap(buttonAdmin);
      // login_admin
      await driver.waitFor(buttonCambiarContra);
      await driver.tap(buttonCambiarContra);
      //password_page
      await driver.waitFor(textFieldAdminContra);
      await driver.tap(textFieldAdminContra);
      await driver.enterText("admin");
      await driver.waitFor(buttonVerificar);
      await driver.tap(buttonVerificar);
      //choosePassword_page
      await driver.waitFor(textFieldNuevaContra);
      await driver.tap(textFieldNuevaContra);
      await driver.enterText("123456789");
      await driver.waitFor(textFieldContraConfirmada);
      await driver.tap(textFieldContraConfirmada);
      await driver.enterText("123456789");
      await driver.waitFor(buttonGuardarContra);
      await driver.tap(buttonGuardarContra);
      // login_admin
      await driver.waitFor(textFieldAdmin);
      await driver.tap(textFieldAdmin);
      await driver.enterText("admin");
      await driver.waitFor(texFieldContraAdmin);
      await driver.tap(texFieldContraAdmin);
      await driver.enterText("123456789");
      await driver.waitFor(buttonEntrar);
      await driver.tap(buttonEntrar);
      // list_page
      await driver.tap(find.byTooltip('Back'));
    });
    

  });
}
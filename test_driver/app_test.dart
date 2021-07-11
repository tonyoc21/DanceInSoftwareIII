// Importa la Flutter Driver API
// import 'package:crud/pages/login_admin.dart';
import 'package:flutter/cupertino.dart';
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
    final textFieldNombre =  find.byValueKey("nombre");
    final textFieldEstiloBaile =  find.byValueKey("estiloBaile");
    final textFieldCiudad =  find.byValueKey("ciudad");
    final textFieldTelefono =  find.byValueKey("telefono");
    final textFieldCelular =  find.byValueKey("celular");
    final textFieldCorreo =  find.byValueKey("correo");
    final textFieldDescripcio =  find.byValueKey("descripcion");
    final buttonGuardar =  find.byValueKey("guardarBoton");

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
      await driver.waitFor(buttonAdmin);
      await driver.tap(buttonAdmin);
      await driver.waitFor(textFieldAdmin);
      await driver.tap(textFieldAdmin);
      await driver.enterText("admin");
      await driver.waitFor(texFieldContraAdmin);
      await driver.tap(texFieldContraAdmin);
      await driver.enterText("12345678");
      await driver.waitFor(buttonEntrar);
      await driver.tap(buttonEntrar);
      await driver.waitFor(buttonCrear);
      await driver.tap(buttonCrear);
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

    
  });
}
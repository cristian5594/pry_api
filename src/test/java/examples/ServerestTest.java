package examples;

import com.intuit.karate.junit5.Karate;

class ServerestTest {

    @Karate.Test
    Karate testLogin() {
        return Karate.run("classpath:features/login.feature");
    }

    @Karate.Test
    Karate testRegistro() {
        return Karate.run("classpath:features/registro.feature");
    }

    @Karate.Test
    Karate testProductos() {
        return Karate.run("classpath:features/productos.feature");
    }
}

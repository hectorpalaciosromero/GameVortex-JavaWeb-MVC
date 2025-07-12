<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
     <link href="regis.css" rel="stylesheet">
</head>
<body>
    <div class="envoltura">
        <h1 class="titulo">Registro de Usuario</h1>
        <form action="RegistrarUsuario" method="post">
            <!-- Campo para el ID de Usuario -->
            <div class="input-box">
                <label for="idUsuario">ID de Usuario:</label>
                <input type="text" id="idUsuario" name="idUsuario" required>
            </div>

            <div class="input-box">
                <label for="nombreUsuario">Nombre de Usuario:</label>
                <input type="text" id="nombreUsuario" name="nombreUsuario" required>
            </div>

            <div class="input-box">
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" required>
            </div>

            <div class="input-box">
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>
            </div>

            <div class="input-box">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>
            </div>

            <div class="input-box">
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
            </div>

            <div class="input-box">
                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>
            </div>

            <button type="submit" class="btn">Registrarse</button>
        </form>
    </div>
</body>
</html>

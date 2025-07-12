<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Identificación de Usuario</title>
    <link rel="stylesheet" href="../css/indet.css">
    <style>
        /* Estilo para el error que viene del SERVIDOR */
        .server-error-message {
            background-color: #ff4c4c;
            color: white;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Estilo para el campo de texto cuando es inválido (CLIENTE) */
        .input-box input.invalid {
            border-color: #ff4c4c !important;
            box-shadow: 0 0 5px rgba(255, 76, 76, 0.5);
        }

        /* Estilo para el mensaje de error del CLIENTE */
        .error-feedback {
            color: #ff9999; /* Un rojo menos intenso para diferenciarlo */
            font-size: 0.85em;
            font-weight: bold;
            text-align: left;
            min-height: 20px; /* Reserva espacio para que el formulario no "salte" */
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <div class="envoltura">
        <h1 class="titulo">Identificación de Usuario</h1>

        <%
            // ESTE BLOQUE SOLO MUESTRA EL ERROR DEL SERVIDOR
            if ("true".equals(request.getParameter("error"))) {
                out.println("<div class='server-error-message'>Usuario o contraseña incorrectos.</div>");
            }
        %>
        
        <form name="identificacion" id="loginForm" action="../JSP/verificar.jsp" method="post" novalidate>
            <div class="input-box">
                <input type="text" id="txtid" name="txtid" placeholder="IdUsuario">
                <div class="error-feedback"></div>
            </div>
            <div class="input-box">
                <input type="password" id="txtpwd" name="txtpwd" placeholder="Password">
                <div class="error-feedback"></div>
            </div>
            <button type="submit" class="btn">Enviar</button>
        </form>

        <div class="cubo-3">
            <a href="../registro.jsp" class="registro-link">Registro Nuevo</a>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const userIdInput = document.getElementById('txtid');
            const userPwdInput = document.getElementById('txtpwd');

            form.addEventListener('submit', function(event) {
                // 1. SIEMPRE detenemos el envío por defecto para validarlo nosotros.
                event.preventDefault();

                // 2. Ejecutamos nuestra lógica de validación.
                const isClientSideValid = validateClientSide();

                // 3. SOLO si nuestra validación PASA, enviamos el formulario manualmente.
                if (isClientSideValid) {
                    form.submit();
                }
            });

            function validateClientSide() {
                // Empezamos asumiendo que el formulario es válido.
                let isValid = true;
                
                // Reseteamos los errores de la validación anterior.
                resetError(userIdInput);
                resetError(userPwdInput);

                // Validación del campo de Usuario
                if (userIdInput.value.trim() === '') {
                    isValid = false;
                    showError(userIdInput, 'El Id de Usuario no puede estar vacío.');
                }

                // Validación del campo de Contraseña
                if (userPwdInput.value.trim() === '') {
                    isValid = false;
                    showError(userPwdInput, 'La contraseña no puede estar vacía.');
                }
                
                return isValid;
            }

            // Funciones de ayuda para un código más limpio
            function showError(inputElement, message) {
                inputElement.classList.add('invalid');
                const errorContainer = inputElement.nextElementSibling;
                errorContainer.textContent = message;
            }

            function resetError(inputElement) {
                inputElement.classList.remove('invalid');
                const errorContainer = inputElement.nextElementSibling;
                errorContainer.textContent = '';
            }
        });
    </script>
</body>
</html>
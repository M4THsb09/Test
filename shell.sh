<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ejecuta el script de Bash de manera segjura
    $output = shell_exec('bash test.sh 2>&1');
    
    // Devuelve la salida del script como respuesta JSON
    header('Content-Type: application/json');
    echo json_encode(['output' => $output]);
} else {
    // Redirecciona si se intenta acceder directamente a este archivo
    header('Location: index.html');
    exit();
}
?>
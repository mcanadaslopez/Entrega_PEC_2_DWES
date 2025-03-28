<?php 
	/*comprueba que el usuario haya abierto sesión o redirige*/
	require 'sesiones.php';
	require_once 'bd.php';
    require_once 'bd_pec2_1.php';
	comprobar_sesion();
	comprobar_admin();
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Pedidos</title>
</head>
<body>
<?php require 'cabecera.php'; ?>
<h1>Pedidos</h1>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
    <label for="fechaIni">Fecha inicial</label>
    <input type="date" name="fechaIni" id="fechaIni" max = <?php echo date('Y-m-d'); if (isset($_POST['fechaIni'])){echo " value = ". $_POST['fechaIni'];}else{echo " value = 2023-01-01";};?>>
    <br>
    <label for="fechaFin">Fecha final</label>
    <input type="date" name="fechaFin" id="fechaFin" max = <?php echo date('Y-m-d'); if (isset($_POST['fechaFin'])){echo " value = ". $_POST['fechaFin'];}else{echo " value = ".date('Y-m-d');};?>>
    <br>
	<input type="submit" value="Consultar">
</form>
<h3>Datos</h3>
<?php
if ($_SERVER['REQUEST_METHOD']=='POST'){
    if (!empty($_POST['fechaIni']) AND !empty($_POST['fechaFin'])){
        if(strtotime($_POST['fechaFin'])-strtotime($_POST['fechaIni'])<0){
            echo "<p>&#9888; La fecha inicial ha de ser menor que la fecha final</p>";
        } else {
            $total=cuenta_pedidos($_POST['fechaIni'],$_POST['fechaFin']);
            echo "Pedidos totales: " . $total['pedidos'] . "<br>";
            if ($total['pedidos'] > 0){
                echo "<table>"; //abrir la tabla
                echo "<tr><th>Productos</th><th>Cantidad</th></tr>";
                foreach ($total['productos'] as $producto => $cantidad){
                    echo "<tr><td>". $producto . "</td><td>". $cantidad . "</td></tr>";
                }
                echo "</table>";
            }else{
                echo "<p> &#9888; No se han encontrado pedidos en el rango seleccionado</p>";
            }
        }
    } else {
        echo "<p>&#9888; Seleccione ambas fechas </p>";
    }
}
?>
</body>

</html>
<?php 
	require 'sesiones.php';
	require_once 'bd.php';
    require_once 'bd_pec2_1.php';
	comprobar_sesion();
	comprobar_admin();
    if ($_SERVER['REQUEST_METHOD']=='POST'){
        $borrado = eliminar_producto($_POST['producto']);
    }
    ?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Cartera Productos</title>
</head>
<body>
<?php require 'cabecera.php'; ?>
<h2>Cartera Productos</h2>

<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
    <fieldset>
        <legend> Listado de Productos </legend>
        <label for="producto">Producto a eliminar</label><br>
        <select name="producto" id="producto" multiple size=10>
        <?php
        // Insertar los productos en las etiquetas option correspondientes
        ?>
        </select>
    </fieldset>
	<input type="submit" value="Eliminar">
</form>
<?php
if (isset($borrado) AND $borrado){
    echo "<p>Producto eliminado</p>";
}else{
    if (!$borrado){
        echo "<p>Error al eliminar el producto</p>";
    }
}
?>
</body>

</html>
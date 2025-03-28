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
		<meta charset = "UTF-8">
		<title>Zona administrador</title>
	</head>
	<body>
		<?php require 'cabecera.php';?>
		<h1>Zona de administración</h1>		
		<!--lista de vínculos -->
		<ol>
			<li><a href='cartera_productos.php'> Cartera de productos </a></li>
			<li><a href='productos.php?categoria=1'> Productos de la categoría <strong>comida</strong> </a></li>
			<li><a href='pedidos.php'> Consultar pedidos </a></li>
        </ol>
        <ul>
            <li><a href='datosusu.php'> Datos de restaurantes </a></li>
			<li><a href='modclave.php'> Claves de restaurantes </a></li>
			<li><a href='altas_bajas.php'> Altas y bajas de restaurantes </a></li>
        </ul>

	</body>
</html>
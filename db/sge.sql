-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-06-2019 a las 05:01:37
-- Versión del servidor: 5.7.23
-- Versión de PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sge`
--
CREATE DATABASE IF NOT EXISTS `sge` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sge`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitEventos`
--

DROP TABLE IF EXISTS `BitEventos`;
CREATE TABLE `BitEventos` (
  `eCodEvento` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL DEFAULT '1',
  `eCodUsuario` int(11) NOT NULL,
  `eCodCliente` int(11) NOT NULL,
  `fhFechaEvento` datetime NOT NULL,
  `tmHoraMontaje` time DEFAULT NULL,
  `tDireccion` text NOT NULL,
  `tObservaciones` text NOT NULL,
  `eCodTipoDocumento` int(11) NOT NULL DEFAULT '1',
  `bIVA` int(11) DEFAULT NULL,
  `fhFecha` datetime NOT NULL,
  `tOperadorEntrega` varchar(100) DEFAULT NULL,
  `tOperadorRecoleccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitTransacciones`
--

DROP TABLE IF EXISTS `BitTransacciones`;
CREATE TABLE `BitTransacciones` (
  `eCodTransaccion` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEvento` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `dMonto` double NOT NULL,
  `eCodTipoPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatCamionetas`
--

DROP TABLE IF EXISTS `CatCamionetas`;
CREATE TABLE `CatCamionetas` (
  `eCodCamioneta` int(11) NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  `tNombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatClientes`
--

DROP TABLE IF EXISTS `CatClientes`;
CREATE TABLE `CatClientes` (
  `eCodCliente` int(11) NOT NULL,
  `tTitulo` varchar(25) DEFAULT NULL,
  `tNombres` varchar(100) DEFAULT NULL,
  `tApellidos` varchar(100) DEFAULT NULL,
  `tCorreo` varchar(100) DEFAULT NULL,
  `tPassword` varchar(60) DEFAULT NULL,
  `tTelefonoFijo` varchar(15) DEFAULT NULL,
  `tTelefonoMovil` varchar(15) DEFAULT NULL,
  `fhFechaCreacion` datetime DEFAULT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `tComentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatCombos`
--

DROP TABLE IF EXISTS `CatCombos`;
CREATE TABLE `CatCombos` (
  `eCodCombo` int(11) NOT NULL,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEstatus`
--

DROP TABLE IF EXISTS `CatEstatus`;
CREATE TABLE `CatEstatus` (
  `eCodEstatus` int(11) NOT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tIcono` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatEstatus`
--

INSERT INTO `CatEstatus` (`eCodEstatus`, `tCodEstatus`, `tNombre`, `tIcono`) VALUES
(1, 'NU', 'Nuevo', 'far fa-question-circle'),
(2, 'PR', 'En proceso...', 'fas fa-cogs'),
(3, 'AC', 'Activo', 'fa fa-check'),
(4, 'CA', 'Cancelado', 'fas fa-ban'),
(5, 'RE', 'Rechazado', 'fas fa-minus-circle'),
(6, 'BL', 'Bloqueado', 'fas fa-lock'),
(7, 'EL', 'Eliminado', 'far fa-trash-alt'),
(8, 'FI', 'Finalizado', 'fas fa-check-double');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatInventario`
--

DROP TABLE IF EXISTS `CatInventario`;
CREATE TABLE `CatInventario` (
  `eCodInventario` int(11) NOT NULL,
  `tCodInventario` char(4) DEFAULT NULL,
  `eCodTipoInventario` int(11) NOT NULL,
  `tNombre` varchar(100) NOT NULL,
  `tMarca` varchar(100) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioInterno` double NOT NULL,
  `dPrecioVenta` double NOT NULL,
  `ePiezas` int(11) NOT NULL,
  `tImagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatServicios`
--

DROP TABLE IF EXISTS `CatServicios`;
CREATE TABLE `CatServicios` (
  `eCodServicio` int(11) NOT NULL,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposInventario`
--

DROP TABLE IF EXISTS `CatTiposInventario`;
CREATE TABLE `CatTiposInventario` (
  `eCodTipoInventario` int(11) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatTiposInventario`
--

INSERT INTO `CatTiposInventario` (`eCodTipoInventario`, `tNombre`) VALUES
(1, 'Equipo'),
(2, 'Mobiliario'),
(3, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposPagos`
--

DROP TABLE IF EXISTS `CatTiposPagos`;
CREATE TABLE `CatTiposPagos` (
  `eCodTipoPago` int(11) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `CatTiposPagos`
--

INSERT INTO `CatTiposPagos` (`eCodTipoPago`, `tNombre`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta'),
(3, 'Cheque'),
(4, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelEventosPaquetes`
--

DROP TABLE IF EXISTS `RelEventosPaquetes`;
CREATE TABLE `RelEventosPaquetes` (
  `eCodEvento` int(11) NOT NULL,
  `eCodServicio` int(11) NOT NULL,
  `eCantidad` int(11) NOT NULL,
  `eCodTipo` int(11) NOT NULL,
  `dMonto` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelEventosRutas`
--

DROP TABLE IF EXISTS `RelEventosRutas`;
CREATE TABLE `RelEventosRutas` (
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuarioEntrega` int(11) NOT NULL,
  `eCodUsuarioRecoleccion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelRegistrosCargasInventario`
--

DROP TABLE IF EXISTS `RelRegistrosCargasInventario`;
CREATE TABLE `RelRegistrosCargasInventario` (
  `eCodRegistro` int(11) NOT NULL,
  `eCodInventario` int(11) NOT NULL,
  `eCantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelServiciosInventario`
--

DROP TABLE IF EXISTS `RelServiciosInventario`;
CREATE TABLE `RelServiciosInventario` (
  `eCodServicio` int(11) NOT NULL,
  `eCodInventario` int(11) NOT NULL,
  `ePiezas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisBotones`
--

DROP TABLE IF EXISTS `SisBotones`;
CREATE TABLE `SisBotones` (
  `tCodBoton` varchar(2) NOT NULL,
  `tTitulo` varchar(20) DEFAULT NULL,
  `tFuncion` varchar(25) DEFAULT NULL,
  `tAccion` varchar(25) NOT NULL,
  `tIcono` varchar(45) DEFAULT NULL,
  `tId` varchar(15) NOT NULL,
  `tClase` varchar(50) NOT NULL,
  `tHTML` varchar(255) DEFAULT NULL,
  `bDeshabilitado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisBotones`
--

INSERT INTO `SisBotones` (`tCodBoton`, `tTitulo`, `tFuncion`, `tAccion`, `tIcono`, `tId`, `tClase`, `tHTML`, `bDeshabilitado`) VALUES
('CO', 'Listado', 'window.location=\'url\';', '', '<i class=\"fas fa-table\"></i>', '', 'btn btn-primary', NULL, NULL),
('EL', 'Eliminar', 'eliminar();', '', '<i class=\"far fa-trash-alt\"></i>', '', 'btn btn-danger', NULL, NULL),
('GU', 'Guardar', 'validar();', '', '<i class=\"fa fa-floppy-o\"></i>', 'btnGuardar', 'btn btn-primary', NULL, 1),
('IM', 'Imprimir', 'imprimir();', '', '<i class=\"fas fa-print\"></i>', '', 'btn btn-success', NULL, NULL),
('NU', 'Nuevo', 'window.location=\'url\';', '', '<i class=\"fa fa-plus\"></i>', 'btnNuevo', 'btn btn-primary', NULL, NULL),
('PD', 'Descargar PDF', 'window.location=\'url\';', 'generar/pdf', '<i class=\"fas fa-file-pdf\"></i>', '', 'btn btn-danger', NULL, NULL),
('RE', 'Rechazar', 'rechazar();', '', '<i class=\"far fa-trash-alt\"></i>', '', 'btn btn-danger', NULL, NULL),
('SR', 'Consultar', 'consultarFecha();', '', '<i class=\"fas fa-search\"></i>', '', 'btn btn-info', '<form id=\"Datos\" method=\"post\" action=\"<?=$_SERVER[\'REQUEST_URI\']?>\"><input type=\"text\" id=\"datepicker\"><input type=\"hidden\" name=\"fhFechaConsulta\" id=\"datepicker1\"></form>', NULL),
('VA', NULL, 'activarValidacion();', '', '<i class=\"fa fa-key\" ></i>', 'btnValidar', 'btn btn-primary', '<input type=\"password\" class=\"form-control col-md-3\" onkeyup=\"validarUsuario()\"  id=\"tPasswordOperaciones\"  style=\"display:none;\" size=\"8\">', NULL),
('XL', 'Descargar XLS', 'window.location=\'url\';', 'exportar/xls', '<i class=\"fas fa-file-excel\"></i>', '', 'btn btn-success', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisLogs`
--

DROP TABLE IF EXISTS `SisLogs`;
CREATE TABLE `SisLogs` (
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `tDescripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisPerfiles`
--

DROP TABLE IF EXISTS `SisPerfiles`;
CREATE TABLE `SisPerfiles` (
  `eCodPerfil` int(11) NOT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisPerfiles`
--

INSERT INTO `SisPerfiles` (`eCodPerfil`, `tNombre`, `tCodEstatus`) VALUES
(1, 'Administrador', 'AC'),
(2, 'Coordinador', 'AC'),
(3, 'Ventas', 'AC'),
(4, 'Pagos', 'AC'),
(5, 'Bodega', NULL),
(6, 'Entregas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisRegistrosCargas`
--

DROP TABLE IF EXISTS `SisRegistrosCargas`;
CREATE TABLE `SisRegistrosCargas` (
  `eCodRegistro` int(11) NOT NULL,
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `fhFechaCarga` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eCodCamioneta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSecciones`
--

DROP TABLE IF EXISTS `SisSecciones`;
CREATE TABLE `SisSecciones` (
  `tCodSeccion` varchar(20) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tTitulo` varchar(60) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `bFiltro` int(11) NOT NULL,
  `tIcono` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSecciones`
--

INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `tIcono`) VALUES
('cata-cam-con', 'sis-dash-con', 'Camionetas', 3, 3, 1, 'fa fa-file-text-o'),
('cata-cam-reg', 'cata-cam-con', '+ Camionetas', 3, 1, 0, 'fa fa-file-text-o'),
('cata-car-con', 'sis-dash-con', 'Eventos de Carga', 3, 3, 1, 'fa fa-file-text-o'),
('cata-cli-con', 'sis-dash-con', 'Clientes', 3, 3, 1, 'fa fa-file-text-o'),
('cata-cli-det', 'cata-cli-con', 'Detalles de Clientes', 3, 2, 0, 'fa fa-file-text-o'),
('cata-cli-reg', 'cata-cli-con', '+ Clientes', 3, 1, 0, 'fa fa-file-text-o'),
('cata-eve-con', 'sis-dash-con', 'Eventos', 3, 2, 1, 'fa fa-file-text-o'),
('cata-eve-det', 'cata-eve-con', 'Detalles de Eventos', 3, 1, 0, 'fa fa-file-text-o'),
('cata-inv-con', 'sis-dash-con', 'Inventario', 3, 3, 0, 'fa fa-file-text-o'),
('cata-inv-det', 'cata-inv-con', 'Detalles de Inventario', 3, 2, 0, 'fa fa-file-text-o'),
('cata-inv-reg', 'cata-inv-con', '+ Inventario', 3, 1, 0, 'fa fa-file-text-o'),
('cata-per-reg', 'cata-per-sis', '+ Perfiles', 3, 5, 0, 'fa fa-file-text-o'),
('cata-per-sis', 'sis-dash-con', 'Perfiles', 3, 6, 0, 'fa fa-file-text-o'),
('cata-ren-con', 'sis-dash-con', 'Rentas', 3, 2, 1, 'fa fa-file-text-o'),
('cata-ren-det', 'cata-ren-con', 'Detalles de Rentas', 3, 1, 0, 'fa fa-file-text-o'),
('cata-ser-con', 'sis-dash-con', 'Paquetes', 3, 3, 0, 'fa fa-file-text-o'),
('cata-ser-det', 'cata-ser-con', 'Detalles de Paquetes', 3, 2, 0, 'fa fa-file-text-o'),
('cata-ser-reg', 'cata-ser-con', '+ Paquetes', 3, 1, 0, 'fa fa-file-text-o'),
('cata-tra-con', 'sis-dash-con', 'Transacciones', 3, 4, 1, 'fa fa-file-text-o'),
('cata-usr-reg', 'cata-usr-sis', '+ Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('cata-usr-sis', 'sis-dash-con', 'Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('oper-eve-cot', 'cata-eve-con', '+ Eventos', 3, 1, 0, 'fa fa-file-text-o'),
('oper-ren-cot', 'cata-ren-con', '+ Rentas', 3, 1, 0, 'fa fa-file-text-o'),
('sis-bod-con', 'sis-dash-con', 'Bodega', 3, 1, 1, 'fa-tachometer-alt'),
('sis-dash-con', NULL, 'Inicio', 3, 1, 1, 'fa-tachometer-alt'),
('sis-log-con', 'sis-dash-con', 'Logs', 3, 15, 0, 'fa fa-file-text-o');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesBotones`
--

DROP TABLE IF EXISTS `SisSeccionesBotones`;
CREATE TABLE `SisSeccionesBotones` (
  `eCodRegistro` int(11) NOT NULL,
  `tCodPadre` varchar(15) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `tCodBoton` varchar(2) DEFAULT NULL,
  `tFuncion` varchar(25) DEFAULT NULL,
  `tEtiqueta` varchar(30) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesBotones`
--

INSERT INTO `SisSeccionesBotones` (`eCodRegistro`, `tCodPadre`, `tCodSeccion`, `tCodBoton`, `tFuncion`, `tEtiqueta`, `ePosicion`) VALUES
(1, 'cata-cli-reg', 'cata-cli-reg', 'VA', NULL, NULL, 1),
(2, 'cata-cli-reg', 'cata-cli-reg', 'GU', NULL, NULL, 2),
(3, 'cata-cli-reg', 'cata-cli-con', 'CO', NULL, NULL, 3),
(4, 'cata-inv-reg', 'cata-inv-reg', 'VA', NULL, NULL, 1),
(5, 'cata-inv-reg', 'cata-inv-reg', 'GU', NULL, NULL, 2),
(6, 'cata-inv-reg', 'cata-inv-con', 'CO', NULL, NULL, 3),
(7, 'cata-per-reg', 'cata-per-reg', 'VA', NULL, NULL, 1),
(8, 'cata-per-reg', 'cata-per-reg', 'GU', 'guardar();', NULL, 2),
(9, 'cata-per-reg', 'sis-per-con', 'CO', NULL, NULL, 3),
(10, 'cata-ser-reg', 'cata-ser-reg', 'VA', NULL, NULL, 1),
(11, 'cata-ser-reg', 'cata-ser-reg', 'GU', NULL, NULL, 2),
(12, 'cata-ser-reg', 'cata-ser-con', 'CO', NULL, NULL, 3),
(13, 'cata-usr-reg', 'cata-usr-reg', 'VA', NULL, NULL, 1),
(14, 'cata-usr-reg', 'cata-usr-reg', 'GU', NULL, NULL, 2),
(15, 'cata-usr-reg', 'sis-usr-con', 'CO', NULL, NULL, 3),
(16, 'oper-eve-cot', 'oper-eve-cot', 'VA', NULL, NULL, 1),
(17, 'oper-eve-cot', 'oper-eve-reg', 'GU', NULL, NULL, 2),
(18, 'oper-eve-cot', 'cata-eve-con', 'CO', NULL, NULL, 3),
(19, 'oper-ren-cot', 'oper-ren-cot', 'VA', NULL, NULL, 1),
(20, 'oper-ren-cot', 'oper-ren-cot', 'GU', NULL, NULL, 2),
(21, 'oper-ren-cot', 'cata-ren-con', 'CO', NULL, NULL, 3),
(22, 'cata-cli-con', 'cata-cli-reg', 'NU', NULL, NULL, 1),
(24, 'cata-eve-con', 'oper-eve-cot', 'NU', NULL, NULL, 1),
(25, 'cata-inv-con', 'cata-inv-reg', 'NU', NULL, NULL, 1),
(26, 'cata-ren-con', 'oper-ren-cot', 'NU', NULL, NULL, 1),
(27, 'cata-ser-con', 'cata-ser-reg', 'NU', NULL, NULL, 1),
(28, 'cata-per-sis', 'cata-per-reg', 'NU', NULL, NULL, 1),
(29, 'cata-usr-sis', 'cata-usr-reg', 'NU', NULL, NULL, 1),
(30, 'cata-cli-det', 'cata-cli-con', 'CO', NULL, NULL, 3),
(31, 'cata-eve-det', 'cata-eve-det', 'PD', NULL, NULL, 1),
(32, 'cata-ren-det', 'cata-ren-det', 'PD', NULL, NULL, 1),
(33, 'cata-cli-con', 'cata-cli-reg', 'XL', NULL, NULL, 2),
(34, 'cata-eve-det', 'cata-eve-con', 'CO', NULL, NULL, 3),
(35, 'cata-ren-det', 'cata-ren-con', 'CO', NULL, NULL, 3),
(37, 'sis-dash-con', 'oper-eve-cot', 'NU', NULL, 'Nuevo Evento', 1),
(38, 'sis-dash-con', 'oper-ren-cot', 'NU', NULL, 'Nueva Renta', 2),
(39, 'cata-ser-det', 'cata-ser-con', 'CO', NULL, NULL, 1),
(40, 'cata-cam-reg', 'cata-cam-reg', 'VA', NULL, NULL, 1),
(41, 'cata-cam-reg', 'cata-cam-reg', 'GU', NULL, NULL, 2),
(42, 'cata-cam-reg', 'cata-cam-con', 'CO', NULL, NULL, 3),
(43, 'cata-cam-con', 'cata-cam-reg', 'NU', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesMenusEmergentes`
--

DROP TABLE IF EXISTS `SisSeccionesMenusEmergentes`;
CREATE TABLE `SisSeccionesMenusEmergentes` (
  `eCodMenuEmergente` int(11) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tCodSeccion` varchar(20) DEFAULT NULL,
  `tCodPermiso` char(1) NOT NULL,
  `tTitulo` varchar(30) NOT NULL,
  `tAccion` varchar(25) DEFAULT NULL,
  `tFuncion` varchar(50) DEFAULT NULL,
  `tValor` varchar(20) DEFAULT NULL,
  `ePosicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesMenusEmergentes`
--

INSERT INTO `SisSeccionesMenusEmergentes` (`eCodMenuEmergente`, `tCodPadre`, `tCodSeccion`, `tCodPermiso`, `tTitulo`, `tAccion`, `tFuncion`, `tValor`, `ePosicion`) VALUES
(1, 'cata-cli-con', 'cata-cli-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(2, 'cata-ser-con', 'cata-ser-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(3, 'cata-eve-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(4, 'cata-ren-con', 'cata-ren-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 1),
(5, 'cata-inv-con', 'cata-inv-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 1),
(6, 'cata-eve-con', 'oper-eve-cot', 'A', 'Editar', 'editar-cotizacion', 'window.location=\'url\';', 'editar-cotizacion', 1),
(7, 'cata-cli-con', 'cata-cli-det', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(8, 'cata-usr-sis', 'cata-usr-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(9, 'cata-ser-con', 'cata-ser-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(10, 'cata-cli-con', 'cata-cli-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(11, 'cata-ser-con', 'cata-ser-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(13, 'cata-ren-con', 'cata-ren-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(14, 'cata-inv-con', 'cata-inv-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 2),
(15, 'cata-eve-con', 'cata-eve-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 2),
(16, 'cata-usr-sis', 'cata-usr-sis', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 2),
(17, 'cata-eve-con', 'cata-eve-con', 'D', 'Finalizar', 'finalizar', 'acciones(codigo,\'F\');', 'finalizar', 4),
(18, 'cata-ren-con', 'cata-ren-con', 'D', 'Finalizar', 'finalizar', 'acciones(codigo,\'F\');', 'finalizar', 4),
(19, 'cata-ren-con', 'oper-ren-cot', 'A', 'Editar', 'editar-cotizacion', 'window.location=\'url\';', 'editar-cotizacion', 1),
(20, 'cata-eve-con', 'cata-eve-con', 'A', 'Agregar Transaccion', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(21, 'cata-ren-con', 'cata-ren-con', 'A', 'Finalizar', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(22, 'cata-eve-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(23, 'cata-cam-con', 'cata-cam-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(24, 'cata-car-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfiles`
--

DROP TABLE IF EXISTS `SisSeccionesPerfiles`;
CREATE TABLE `SisSeccionesPerfiles` (
  `eCodPerfil` int(11) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `bAll` int(11) DEFAULT NULL,
  `bDelete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfilesInicio`
--

DROP TABLE IF EXISTS `SisSeccionesPerfilesInicio`;
CREATE TABLE `SisSeccionesPerfilesInicio` (
  `eCodPerfil` int(11) NOT NULL,
  `tCodSeccion` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesReemplazos`
--

DROP TABLE IF EXISTS `SisSeccionesReemplazos`;
CREATE TABLE `SisSeccionesReemplazos` (
  `eCodReemplazo` int(11) NOT NULL,
  `tBase` varchar(4) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesReemplazos`
--

INSERT INTO `SisSeccionesReemplazos` (`eCodReemplazo`, `tBase`, `tNombre`) VALUES
(1, 'cata', 'catalogo'),
(2, 'oper', 'operaciones'),
(3, 'reg', 'registrar'),
(4, 'inv', 'inventario'),
(5, 'usr', 'usuario'),
(6, 'sis', 'sistema'),
(7, 'bod', 'bodega'),
(8, 'ser', 'paquetes'),
(9, 'per', 'perfiles'),
(10, 'con', 'consultar'),
(11, 'dash', 'dashboard'),
(12, 'eve', 'eventos'),
(13, 'noti', 'notificaciones'),
(14, 'det', 'detalles'),
(15, 'del', 'eliminar'),
(16, 'log', 'logs'),
(17, 'tra', 'transacciones'),
(18, 'cit', 'citas'),
(19, 'gen', 'generar'),
(20, 'xls', 'excel'),
(21, 'pdf', 'pdf'),
(22, 'ren', 'rentas'),
(23, 'cli', 'clientes'),
(24, 'reg', 'editar'),
(25, 'xls', 'xls'),
(26, 'cot', 'crear'),
(27, 'cot', 'editar-cotizacion'),
(28, 'cam', 'camionetas'),
(29, 'car', 'carga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisUsuarios`
--

DROP TABLE IF EXISTS `SisUsuarios`;
CREATE TABLE `SisUsuarios` (
  `eCodUsuario` int(11) NOT NULL,
  `eCodEntidad` int(11) DEFAULT NULL,
  `tNombre` varchar(50) DEFAULT NULL,
  `tApellidos` varchar(50) DEFAULT NULL,
  `tCorreo` varchar(100) DEFAULT NULL,
  `tPasswordAcceso` varchar(60) DEFAULT NULL,
  `tPasswordOperaciones` varchar(60) DEFAULT NULL,
  `fhFechaCreacion` datetime DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `eCodPerfil` int(11) DEFAULT NULL,
  `bAll` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisUsuarios`
--

INSERT INTO `SisUsuarios` (`eCodUsuario`, `eCodEntidad`, `tNombre`, `tApellidos`, `tCorreo`, `tPasswordAcceso`, `tPasswordOperaciones`, `fhFechaCreacion`, `eCodEstatus`, `eCodPerfil`, `bAll`) VALUES
(1, NULL, 'Mario Ernesto', 'Basurto Medrano', 'babec.soluciones@gmail.com', 'MjgwMjkx', 'MjgwMjkx', '2018-07-29 00:00:00', 3, 1, 1),
(2, NULL, 'Administrador', 'Sistema', 'admin@antroentucasa.com', 'YWRtaW4=', 'YWRtaW4=', '2018-07-30 02:00:00', 3, 1, 1),
(4, NULL, 'Jaime', 'Morales PÃƒÂ©rez', 'jaime@antroentucasa.com.mx', 'YW50cm8xMjM=', 'YW50cm8xMjM=', '2018-11-12 19:28:41', 3, 1, 1),
(5, NULL, 'Jose Manuel', 'Morales ', 'manolosa86@hotmail.com', 'YW50cm8xMjM=', 'YW50cm8xMjM=', '2018-11-16 22:44:57', 3, 4, 0),
(6, NULL, 'Mariana ', 'Morales V', '\"mananamorales@gmail.com\" <mananamorales@gmail.com>', 'bWFuYW5hMjAwMg==', 'bWFuYW5hMjAwMg==', '2018-12-13 16:20:42', 7, 3, 0),
(7, NULL, 'Veronica ', 'Jasso', 'veronica_jp@antroentucasa.com.mx', 'VmludGFnZTMz', 'VmludGFnZTMz', '2018-12-17 14:27:15', 3, 1, 1),
(8, NULL, 'Stephany', 'V', 'stephany_vc@antroentucasa.com.mx', 'enp6MTEx', 'enp6MTEx', '2019-01-02 14:47:33', 7, 5, 0),
(9, NULL, 'Lessley', 'Mariz', 'less@antroentucasa.com.mx', 'RGphbnRybzIwMTc=', 'RGphbnRybzIwMTc=', '2019-01-02 14:48:46', 3, 2, 0),
(10, NULL, 'Danny Boy', 'Alvarez', 'danny@antroentucasa.com.mx', 'UXNjMDAz', 'UXNjMDAz', '2019-01-02 14:50:45', 7, 5, 0),
(11, NULL, 'Memo', 'Medina', 'memo@antroentucasa.com', 'bWVtbzEyMw==', 'TWVtbzEyMw==', '2019-02-11 13:39:43', 7, 6, 0),
(12, NULL, 'Karen', 'Vargas', 'karen@antroentucasa.com.mx', 'Q290eTIwMDI=', 'Q290eTIwMDI=', '2019-03-25 12:40:26', 3, 3, 0),
(13, NULL, 'Virginia', 'BaÃƒÂ±os PÃƒÂ©rez', 'Vico@antroentucasa.com.mx', 'SmF6ejE5NzA=', 'SmF6ejE5NzA=', '2019-03-25 16:34:10', 3, 2, 0),
(14, NULL, 'Ernesto', 'Hernandez', 'ernesto_antroentucasa@hotmail.com', 'TWFja2llMTk3MA==', 'TWFja2llMTk3MA==', '2019-04-29 12:26:45', 3, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisVariables`
--

DROP TABLE IF EXISTS `SisVariables`;
CREATE TABLE `SisVariables` (
  `eCodVariable` int(11) NOT NULL,
  `tNombre` varchar(50) NOT NULL,
  `tValor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisVariables`
--

INSERT INTO `SisVariables` (`eCodVariable`, `tNombre`, `tValor`) VALUES
(1, 'tURL', 'http://localhost/');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BitEventos`
--
ALTER TABLE `BitEventos`
  ADD PRIMARY KEY (`eCodEvento`);

--
-- Indices de la tabla `BitTransacciones`
--
ALTER TABLE `BitTransacciones`
  ADD PRIMARY KEY (`eCodTransaccion`);

--
-- Indices de la tabla `CatCamionetas`
--
ALTER TABLE `CatCamionetas`
  ADD PRIMARY KEY (`eCodCamioneta`);

--
-- Indices de la tabla `CatClientes`
--
ALTER TABLE `CatClientes`
  ADD PRIMARY KEY (`eCodCliente`),
  ADD KEY `cliente_rel_estatus_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `CatCombos`
--
ALTER TABLE `CatCombos`
  ADD PRIMARY KEY (`eCodCombo`);

--
-- Indices de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  ADD PRIMARY KEY (`eCodEstatus`),
  ADD UNIQUE KEY `tCodEstatus_UNIQUE` (`tCodEstatus`);

--
-- Indices de la tabla `CatInventario`
--
ALTER TABLE `CatInventario`
  ADD PRIMARY KEY (`eCodInventario`);

--
-- Indices de la tabla `CatServicios`
--
ALTER TABLE `CatServicios`
  ADD PRIMARY KEY (`eCodServicio`);

--
-- Indices de la tabla `CatTiposInventario`
--
ALTER TABLE `CatTiposInventario`
  ADD PRIMARY KEY (`eCodTipoInventario`);

--
-- Indices de la tabla `CatTiposPagos`
--
ALTER TABLE `CatTiposPagos`
  ADD PRIMARY KEY (`eCodTipoPago`);

--
-- Indices de la tabla `SisBotones`
--
ALTER TABLE `SisBotones`
  ADD PRIMARY KEY (`tCodBoton`);

--
-- Indices de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  ADD PRIMARY KEY (`eCodEvento`);

--
-- Indices de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  ADD PRIMARY KEY (`eCodPerfil`);

--
-- Indices de la tabla `SisRegistrosCargas`
--
ALTER TABLE `SisRegistrosCargas`
  ADD PRIMARY KEY (`eCodRegistro`);

--
-- Indices de la tabla `SisSecciones`
--
ALTER TABLE `SisSecciones`
  ADD PRIMARY KEY (`tCodSeccion`);

--
-- Indices de la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD PRIMARY KEY (`eCodRegistro`),
  ADD KEY `tCodPadre_rel_fk_botones_idx` (`tCodPadre`),
  ADD KEY `tCodBoton_rel_fk_botones_idx` (`tCodBoton`);

--
-- Indices de la tabla `SisSeccionesMenusEmergentes`
--
ALTER TABLE `SisSeccionesMenusEmergentes`
  ADD PRIMARY KEY (`eCodMenuEmergente`);

--
-- Indices de la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD KEY `perfil_rel_seccion_fk_idx` (`eCodPerfil`),
  ADD KEY `seccion_rel_perfil_idx` (`tCodSeccion`);

--
-- Indices de la tabla `SisSeccionesReemplazos`
--
ALTER TABLE `SisSeccionesReemplazos`
  ADD PRIMARY KEY (`eCodReemplazo`);

--
-- Indices de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  ADD PRIMARY KEY (`eCodUsuario`),
  ADD KEY `SisUsuarios_rel_perfiles_fk_idx` (`eCodPerfil`),
  ADD KEY `CatEstatus_rel_usuarios_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  ADD PRIMARY KEY (`eCodVariable`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `BitEventos`
--
ALTER TABLE `BitEventos`
  MODIFY `eCodEvento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `BitTransacciones`
--
ALTER TABLE `BitTransacciones`
  MODIFY `eCodTransaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatCamionetas`
--
ALTER TABLE `CatCamionetas`
  MODIFY `eCodCamioneta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatClientes`
--
ALTER TABLE `CatClientes`
  MODIFY `eCodCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatCombos`
--
ALTER TABLE `CatCombos`
  MODIFY `eCodCombo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  MODIFY `eCodEstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `CatInventario`
--
ALTER TABLE `CatInventario`
  MODIFY `eCodInventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatServicios`
--
ALTER TABLE `CatServicios`
  MODIFY `eCodServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatTiposInventario`
--
ALTER TABLE `CatTiposInventario`
  MODIFY `eCodTipoInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `CatTiposPagos`
--
ALTER TABLE `CatTiposPagos`
  MODIFY `eCodTipoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  MODIFY `eCodEvento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  MODIFY `eCodPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `SisRegistrosCargas`
--
ALTER TABLE `SisRegistrosCargas`
  MODIFY `eCodRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  MODIFY `eCodRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesMenusEmergentes`
--
ALTER TABLE `SisSeccionesMenusEmergentes`
  MODIFY `eCodMenuEmergente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesReemplazos`
--
ALTER TABLE `SisSeccionesReemplazos`
  MODIFY `eCodReemplazo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  MODIFY `eCodUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  MODIFY `eCodVariable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD CONSTRAINT `tCodBoton_rel_fk_botones` FOREIGN KEY (`tCodBoton`) REFERENCES `SisBotones` (`tCodBoton`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tCodPadre_rel_fk_botones` FOREIGN KEY (`tCodPadre`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD CONSTRAINT `perfil_rel_seccion_fk` FOREIGN KEY (`eCodPerfil`) REFERENCES `SisPerfiles` (`eCodPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `seccion_rel_perfil` FOREIGN KEY (`tCodSeccion`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

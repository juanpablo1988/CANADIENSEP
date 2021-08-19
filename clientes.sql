-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2021 a las 01:59:19
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clientes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codcliente` int(23) NOT NULL,
  `nit` int(23) DEFAULT NULL,
  `nombre` varchar(23) DEFAULT NULL,
  `apellido` varchar(23) DEFAULT NULL,
  `direccion` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codcliente`, `nit`, `nombre`, `apellido`, `direccion`) VALUES
(1, 343454, 'juan', 'perez', 'ciudad'),
(2, 534543, 'luis', 'paredes', 'ciudad'),
(3, 34565, 'andrea', 'arreaga', 'ciudad'),
(4, 768785, 'osmar', 'lopez', 'ciudad'),
(5, 675644, 'pedro', 'garcia', 'ciudad'),
(6, 568796, 'pablo', 'jerez', 'ciudad'),
(7, 5679674, 'josue', 'juarez', 'ciudad'),
(8, 5687869, 'jose', 'barrera', 'ciudad'),
(9, 654557, 'andres', 'garcia', 'ciudad'),
(10, 7685677, 'jenny', 'rivas', 'ciudad'),
(11, 7474924, 'sofia', 'lopez', 'ciudad'),
(12, 8575874, 'valeria', 'corado', 'ciudad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id` int(23) NOT NULL,
  `nofactura` int(23) DEFAULT NULL,
  `codproducto` int(23) DEFAULT NULL,
  `cantidadpedida` int(23) DEFAULT NULL,
  `preciototal` int(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nofactura` int(23) NOT NULL,
  `fecha` varchar(23) DEFAULT NULL,
  `codcliente` int(23) DEFAULT NULL,
  `totalfactura` int(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(23) NOT NULL,
  `descripcion` varchar(23) DEFAULT NULL,
  `proveedor` int(23) DEFAULT NULL,
  `preciocosto` int(23) DEFAULT NULL,
  `precioventa` int(23) DEFAULT NULL,
  `foto` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codproveedor` int(23) NOT NULL,
  `proveedor` varchar(23) DEFAULT NULL,
  `telefono` varchar(23) DEFAULT NULL,
  `direccion` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nofactura_fk` (`nofactura`),
  ADD KEY `codproducto_fk` (`codproducto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nofactura`),
  ADD KEY `codcliente_fk` (`codcliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`),
  ADD KEY `codproveedor_fk` (`proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codproveedor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `codproducto_fk` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nofactura_fk` FOREIGN KEY (`nofactura`) REFERENCES `factura` (`nofactura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `codcliente_fk` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `codproveedor_fk` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

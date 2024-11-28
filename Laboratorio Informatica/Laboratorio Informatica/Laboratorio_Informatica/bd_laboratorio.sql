-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2024 a las 00:32:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_laboratorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Alumno'),
(2, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add equipo', 7, 'add_equipo'),
(26, 'Can change equipo', 7, 'change_equipo'),
(27, 'Can delete equipo', 7, 'delete_equipo'),
(28, 'Can view equipo', 7, 'view_equipo'),
(29, 'Can add estudiante autorizado', 8, 'add_estudianteautorizado'),
(30, 'Can change estudiante autorizado', 8, 'change_estudianteautorizado'),
(31, 'Can delete estudiante autorizado', 8, 'delete_estudianteautorizado'),
(32, 'Can view estudiante autorizado', 8, 'view_estudianteautorizado'),
(33, 'Can add prestamo', 9, 'add_prestamo'),
(34, 'Can change prestamo', 9, 'change_prestamo'),
(35, 'Can delete prestamo', 9, 'delete_prestamo'),
(36, 'Can view prestamo', 9, 'view_prestamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$720000$oVf1ex5Hncvbqc1IVbvGan$Bm5EX1tDLhakAZMhUkQeyf2JQ3NPL0zDdaPdmucd8hY=', '2024-09-30 19:55:24.000000', 0, 'Juanes', 'Santiago', 'Gerbant', 'gerbant@hotmail.com.ar', 0, 1, '2024-09-30 18:10:44.000000'),
(9, 'pbkdf2_sha256$720000$D5pJtRXMkYarL12GoELwke$GqV/MgajkXQBw7GrAt9xrWsX7yXipT60f/WXUHjFT7g=', '2024-10-09 21:06:32.871631', 0, 'Schmer23', 'Josemir', 'Rodriguez', 'levandowskisch@gmail.com', 0, 1, '2024-10-09 21:05:58.143412'),
(10, 'pbkdf2_sha256$720000$FJlJ94gkHf9bwpJUVkwWAf$p39CUSTXDZ3IQikeTratZu55c/go3N6S2HuFncdgis8=', '2024-10-10 17:56:22.919252', 0, 'Josemir', 'Roberto', 'Schmer', 'emanuelschmer@hotmail.com', 0, 1, '2024-10-09 21:08:11.724753'),
(11, 'pbkdf2_sha256$720000$4Xst7qqHcfqmTPYPsw1rEE$Bt0T7KAdUmJYekXv70xqyH/F4zHy5tVTf29P2ikWCpQ=', '2024-11-27 19:30:16.991893', 0, 'Schmer19', 'Joseme', 'Diaz', 'levandowskisch1@gmail.com', 0, 1, '2024-10-10 17:53:35.511012'),
(12, 'pbkdf2_sha256$720000$bWY2YnDhQ2vzMkFua0JPFb$fbnTj7jX6aPkGq7yERpblJpcG7nvnTRJiLkDqPRpTH4=', '2024-11-27 17:33:34.527181', 0, 'joseme15', 'Juan', 'Marketi', 'valentino@gmail.com', 0, 1, '2024-10-15 17:17:19.227981'),
(13, 'pbkdf2_sha256$720000$mjQxwE5nta9VKIkBVxXRDl$UY0UauDrENsctoyD4/BCs+yD3xkW+UvMSPPyyokgwAU=', '2024-10-17 17:58:33.081823', 1, 'Admin20', '', '', 'emanuelschmer777@gmail.com', 1, 1, '2024-10-16 18:28:22.716985'),
(14, 'pbkdf2_sha256$720000$lkfLBpnyL0R7uGNK6pk0pp$HPO0uY4Qa33QyviWqJJxP3fIPTipMq+33MZE4ihpPzk=', '2024-10-31 17:17:02.141490', 0, 'josemir2024', 'Marco', 'Levandowsly', 'yosemir.pr22@gmail.com', 0, 1, '2024-10-31 17:15:07.850950');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, 2),
(7, 9, 2),
(8, 10, 1),
(9, 11, 2),
(10, 12, 1),
(11, 14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-17 17:53:30.279842', '5', '5 - 4141 - monitor - disponible - Monitor nuevo - 2', 1, '[{\"added\": {}}]', 7, 13),
(2, '2024-10-17 17:53:49.904592', '5', '5 - 4141 - monitor - disponible - Monitor nuevo - 2', 3, '', 7, 13),
(3, '2024-10-17 17:59:28.597084', '3', 'Juanes', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'Equipamiento', 'equipo'),
(8, 'Equipamiento', 'estudianteautorizado'),
(9, 'Equipamiento', 'prestamo'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Equipamiento', '0001_initial', '2024-08-08 00:43:01.655041'),
(2, 'Equipamiento', '0002_alter_equipo_id', '2024-08-08 00:43:03.627823'),
(3, 'Equipamiento', '0003_equipo_categoria_equipo_lab_alter_equipo_id', '2024-08-08 00:43:05.937398'),
(4, 'Equipamiento', '0004_remove_equipo_categoria', '2024-08-08 00:43:06.693929'),
(5, 'Equipamiento', '0005_equipo_imagen_equipo_marca', '2024-08-08 00:43:07.438472'),
(6, 'contenttypes', '0001_initial', '2024-08-08 00:43:09.980900'),
(7, 'auth', '0001_initial', '2024-08-08 00:43:33.715472'),
(8, 'admin', '0001_initial', '2024-08-08 00:43:59.876383'),
(9, 'admin', '0002_logentry_remove_auto_add', '2024-08-08 00:44:00.024291'),
(10, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-08 00:44:00.215175'),
(11, 'contenttypes', '0002_remove_content_type_name', '2024-08-08 00:44:02.266908'),
(12, 'auth', '0002_alter_permission_name_max_length', '2024-08-08 00:44:04.840317'),
(13, 'auth', '0003_alter_user_email_max_length', '2024-08-08 00:44:05.957627'),
(14, 'auth', '0004_alter_user_username_opts', '2024-08-08 00:44:06.113530'),
(15, 'auth', '0005_alter_user_last_login_null', '2024-08-08 00:44:07.398736'),
(16, 'auth', '0006_require_contenttypes_0002', '2024-08-08 00:44:07.438713'),
(17, 'auth', '0007_alter_validators_add_error_messages', '2024-08-08 00:44:07.491682'),
(18, 'auth', '0008_alter_user_username_max_length', '2024-08-08 00:44:08.384132'),
(19, 'auth', '0009_alter_user_last_name_max_length', '2024-08-08 00:44:08.750904'),
(20, 'auth', '0010_alter_group_name_max_length', '2024-08-08 00:44:09.267584'),
(21, 'auth', '0011_update_proxy_permissions', '2024-08-08 00:44:09.343539'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2024-08-08 00:44:09.549408'),
(23, 'sessions', '0001_initial', '2024-08-08 00:44:12.052487'),
(26, 'Equipamiento', '0006_prestamo', '2024-10-09 21:04:59.313636'),
(27, 'Equipamiento', '0007_prestamo_materia', '2024-10-09 19:57:17.676059');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4fotyk16h6udgdxubq8h8hm2p5aqvyve', '.eJxVjMEOwiAQBf-FsyHA0gIevfcbyMJSqRpISnsy_rs06UGv82bem3nct-z3lla_ELsyKdjlFwaMz1SOhR5Y7pXHWrZ1CfxQ-Lk2PlVKr9vp_h1kbLnXSZAQzgAkGiygGUikEY02Llg3BgCpjFUG5tiBniFKsE6R7hlojZp9vuUPNus:1syhDn:GbEOEDFaSEg378jnG9pAuUIsoCnpU6GxgJ4s_pqxY70', '2024-10-23 21:40:03.446651'),
('6b6czr0awznxyn3jv953ig94sd1l4wp8', '.eJxVjEEOwiAQRe_C2pAOMBRduvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERAOL0OwbiZ6qDxAfVe5Pc6rYuQQ5FHrTLW4vpdT3cv4NCvYwaHYZsogNUatYhZkyZKamkATTrKRg7qZkJOWtD2ZJlRw4oR4Nnp8TnCxl0OIg:1tGP71:BWB-YXsLc0-lsqGVZ6az7sSPIWYTk9crMoZTmUS-y_4', '2024-12-11 17:58:15.286148'),
('6m0i35slfj6spasw83y260ouyy0mpd29', '.eJxVjEEOwiAQRe_C2pAOMBRduvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERAOL0OwbiZ6qDxAfVe5Pc6rYuQQ5FHrTLW4vpdT3cv4NCvYwaHYZsogNUatYhZkyZKamkATTrKRg7qZkJOWtD2ZJlRw4oR4Nnp8TnCxl0OIg:1tGPBi:_L693n8y7lgJ8x-J_4hqwjejqfWT0airL-o95qvLLU0', '2024-12-11 18:03:06.770646'),
('74nsqp5c6vcgz9tnraa0m955wc93dcce', '.eJxVjEEOwiAQRe_C2pAOMBRduvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERAOL0OwbiZ6qDxAfVe5Pc6rYuQQ5FHrTLW4vpdT3cv4NCvYwaHYZsogNUatYhZkyZKamkATTrKRg7qZkJOWtD2ZJlRw4oR4Nnp8TnCxl0OIg:1tGPFO:xggkxI5v9twU-TFlu5MqqYG5759qKNtAdaJMFkV1zb4', '2024-12-11 18:06:54.438961'),
('cxaree1qwcmdibhhcndm9828l5bygql9', 'e30:1svL3g:sS7Kty3EtGe-bifs_dnlUX1hGlOF71Cy5TxEpr91lVg', '2024-10-14 18:23:44.110960'),
('dcu9shmhrnt6ydzga6xzf5olr9tlo096', '.eJxVjEEOwiAQRe_C2hCKMAMu3XsGMsygVA1NSrsy3l2bdKHb_977L5VoXWpae5nTKOqkBqcOv2MmfpS2EblTu02ap7bMY9abonfa9WWS8jzv7t9BpV6_tZXAZUByxIjBuWzZe6BoxaAHQENgMTqDAtFmKuCPCOL91XDIJaN6fwDyYjeH:1t6bbK:1LqyVllxcLmF6a7yHj4PC5eCEeIzJV0h1fC4EID3mUk', '2024-11-14 17:17:02.157931');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamiento_equipo`
--

CREATE TABLE `equipamiento_equipo` (
  `id` int(11) NOT NULL,
  `nro_serie` varchar(30) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `descripcion` longtext NOT NULL,
  `lab` varchar(40) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipamiento_equipo`
--

INSERT INTO `equipamiento_equipo` (`id`, `nro_serie`, `tipo`, `estado`, `descripcion`, `lab`, `imagen`, `marca`) VALUES
(1, '3132313', 'netbook', 'prestado', 'joseme', '2', 'laboratorio/bg2.jpg', 'HP'),
(2, '56464', 'monitor', 'disponible', 'Monitor philips', '1', 'laboratorio/nueva_imagen.png', 'Philips'),
(4, '91463', 'monitor', 'disponible', 'usados', '2', 'laboratorio/Captura_de_pantalla_59.png', 'e-view');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamiento_prestamo`
--

CREATE TABLE `equipamiento_prestamo` (
  `id` bigint(20) NOT NULL,
  `fecha_prestamo` datetime(6) NOT NULL,
  `fecha_devolucion` datetime(6) DEFAULT NULL,
  `alumno_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `materia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `equipamiento_prestamo`
--

INSERT INTO `equipamiento_prestamo` (`id`, `fecha_prestamo`, `fecha_devolucion`, `alumno_id`, `equipo_id`, `materia`) VALUES
(1, '2024-10-09 21:08:37.396255', '2024-10-09 21:08:48.739944', 10, 1, NULL),
(2, '2024-10-09 21:27:20.754876', '2024-10-09 21:31:22.139357', 10, 1, NULL),
(3, '2024-10-09 21:34:48.675246', '2024-10-09 18:42:23.265971', 10, 1, NULL),
(4, '2024-10-09 18:43:07.100504', '2024-10-09 18:43:10.994952', 10, 1, NULL),
(5, '2024-10-09 21:40:07.476971', '2024-10-09 21:40:28.351570', 10, 1, 'BASES_DE_DATOS'),
(6, '2024-10-10 17:20:32.348996', '2024-10-10 17:25:46.934984', 10, 1, 'PROGRAMACION'),
(7, '2024-10-15 17:18:21.484319', '2024-10-15 17:18:24.800741', 12, 1, 'APLICACION_NUEVAS_TECNOLOGIAS'),
(8, '2024-10-15 19:27:32.611686', '2024-10-15 19:27:35.261853', 12, 1, 'PROGRAMACION'),
(9, '2024-10-16 19:48:17.514130', '2024-10-16 19:48:33.124630', 12, 2, 'PROGRAMACION'),
(10, '2024-10-18 20:16:56.330824', '2024-10-18 20:23:10.592781', 12, 2, 'BASES_DE_DATOS'),
(11, '2024-10-18 20:23:15.545064', '2024-10-18 20:23:53.047623', 12, 2, 'BASES_DE_DATOS'),
(12, '2024-10-18 20:23:47.651736', '2024-10-18 20:26:00.952151', 12, 4, 'APLICACION_NUEVAS_TECNOLOGIAS'),
(13, '2024-10-18 20:23:56.577853', '2024-10-18 20:26:02.320397', 12, 2, 'LABORATORIO_INFORMATICA'),
(14, '2024-10-18 20:32:18.542457', '2024-10-18 20:33:16.730400', 12, 4, 'BASES_DE_DATOS'),
(15, '2024-10-18 20:33:19.008204', '2024-10-18 20:33:40.025866', 12, 2, 'BASES_DE_DATOS'),
(16, '2024-10-18 20:33:29.935086', '2024-10-18 20:33:41.903889', 12, 4, 'BASES_DE_DATOS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `equipamiento_equipo`
--
ALTER TABLE `equipamiento_equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipamiento_prestamo`
--
ALTER TABLE `equipamiento_prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Equipamiento_prestamo_alumno_id_621a361f_fk_auth_user_id` (`alumno_id`),
  ADD KEY `Equipamiento_prestam_equipo_id_a269c442_fk_Equipamie` (`equipo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `equipamiento_equipo`
--
ALTER TABLE `equipamiento_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `equipamiento_prestamo`
--
ALTER TABLE `equipamiento_prestamo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `equipamiento_prestamo`
--
ALTER TABLE `equipamiento_prestamo`
  ADD CONSTRAINT `Equipamiento_prestam_equipo_id_a269c442_fk_Equipamie` FOREIGN KEY (`equipo_id`) REFERENCES `equipamiento_equipo` (`id`),
  ADD CONSTRAINT `Equipamiento_prestamo_alumno_id_621a361f_fk_auth_user_id` FOREIGN KEY (`alumno_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

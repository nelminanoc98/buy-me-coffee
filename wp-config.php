<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('DB_NAME'));

/** Database username */
define('DB_USER', getenv('DB_USER'));

/** Database password */
define('DB_PASSWORD', getenv('DB_PASSWORD'));

/** Database hostname */
define('DB_HOST', getenv('DB_HOST'));/** Database charset to use in creating database tables. */

define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'Y9r#=N3JmKlLHk;(%W{K8*9lTLt)IcXbWIj_;OZQxK7tJq>z,m{oJ_M=+X|x$>yF');
define('SECURE_AUTH_KEY',  'F>ojgCOi,--!8bM1~{g8Q93Q+-!q!WSm.tR{8u^0hBV!+d)ip-gtF~kT+bZDbvg(');
define('LOGGED_IN_KEY',    'ZdBR%-_`C]:6|8=;Gn%I5?jK|V9I&lFS~~]oD>p;5nX5x`-2N0^gC~zJ1FF4b{GO');
define('NONCE_KEY',        '1JZ*g-=e1i5?DglM}[D~M.K}K-y6J4Nd>T-vw6DJ6u!|3B3y5^}LkL4kI^05-r?}');
define('AUTH_SALT',        'f?&+L~D=]iH?[wYb!a}Fu$TW5Id*,+7!Sx-KTJ%i.=-B3DYU=Jyk>;u[M$|FrK=)');
define('SECURE_AUTH_SALT', 'a(hA<_-T7A&HN=wzZ{ZtduEteqzT2[!w!YJHs+$G1g$%{q^`e1>u1F2wBZ(LO~rH');
define('LOGGED_IN_SALT',   'ql]++x^#}uTOwR}Lj>t^@rLWhGF9v$||!T5y4^y&UkQ}H<KcAWD5zGJVRzr;pRW5');
define('NONCE_SALT',       'nq^;^`CtS(TX2~pKqfRw>Citjq15D;u4]Iu6[qPz_cD}P,6Gmm+8^8mZqF@~%X=E');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'alsakkaf_test');

/** MySQL database username */
define('DB_USER', 'alsakkaf_user');

/** MySQL database password */
define('DB_PASSWORD', '0({gei!6n%g?');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'lFK3AW/}xh#%*Xq<]g-jtTJZ0>sy[Jo2=$ Ju<mL6-2~V7A@Kj#G)07g((#FEAV~');
define('SECURE_AUTH_KEY',  'A;nSBn)6qdW]a{jkAMFk?zgPPG`j:+Xv(P!L2M:6,Tb-Wg]k=fQ-{S1UkW8w88,<');
define('LOGGED_IN_KEY',    '>{![8sq2$Gk@0n(<l-mWe3tpu1G%v;K6V^p5Hf(qU8lG|mFYW+`f%J@| H5F+/K[');
define('NONCE_KEY',        'TrA$hs&v__g tt{!t*2CWOSuud%3O9HZ%33$mKSghB!3P:m@{[RprBq.?}cc&F %');
define('AUTH_SALT',        'EaWs/tvmPH-i)o9E{L%T[+Hy5#n/f?]Jxu+4A^m`ioCkI a)4-dS19xy:CN>pvu{');
define('SECURE_AUTH_SALT', '`[b+=!oBt),2KL6sXxw]^jpVn`6&y^7jDk-xB5py)gT{y~i&GnACqT`N])7@=#@w');
define('LOGGED_IN_SALT',   '(dd!&VY%iUA7%NUxV e(w>eM1X24ETv9_LC)px{9GiTK>`CrqH_2(.jH|>/>|lo4');
define('NONCE_SALT',       'cQ7}yaww7#^W48wb,PXUMS`~*[@nraK-YcI>x^W}+58Mb1(d<>?66}Cf]A*gyc0{');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

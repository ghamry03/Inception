<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', MYSQL_USER );

/** Database password */
define( 'DB_PASSWORD', MYSQL_PASSWORD );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
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
define( 'AUTH_KEY',          'pOz%KO|]Wpyfa},pLrliN5>Y%x2OK9+EZh}ci?iQZkH}FO|$UA<]X<8 ^mc>;Y ^' );
define( 'SECURE_AUTH_KEY',   'RNUHtz>%SR%KRQ<a(nfr4$5F^|q~Zlc:j5H:]Yz>o&ac2][uCAUrrp^Z/xZ>x-xT' );
define( 'LOGGED_IN_KEY',     '>Ox)wOx(<QKx8ERjBewQD4Hg.Z_rX@*Oj*uDyuDdK2B@.=?^c%mf ,L~:u,~90if' );
define( 'NONCE_KEY',         'A!qkdwS^3?x_n2@V8mE_jwo &cV_~4]ZiYOu$!ltc3HS~q0&GV]BFtQuJ_9|ew=p' );
define( 'AUTH_SALT',         'VLR*j+$liSV4-.6p+0 pO^Uh0EZnh=dYH3=jf6itoHh?(V=(c?Fi1U{)diB&dl^q' );
define( 'SECURE_AUTH_SALT',  'wz90/0F]U,RM/c9fOOZ_&abAkJCq1i1CWYUGX6NclozJm_bQ.;omO<ed!/4m;#u)' );
define( 'LOGGED_IN_SALT',    'l4e;>mlBpN>Vs-53^P6OV?H[}:J+FA7r5k-B)L,]w,CR7Kdak3M&`.`[,WS8<^A7' );
define( 'NONCE_SALT',        'Kw>V`2!IT>%8h|;(-FtFDzt%SltTh+{wyO2Do~NwY4L-;A`_9`k3W%p1i/KLLIxO' );
define( 'WP_CACHE_KEY_SALT', 'T/R^/3l7}F`t!3)d4pY%9JcE,~w2Dv&mt9T<_68(m>u%gYO-RM@O.*HHkN|Z(_@-' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

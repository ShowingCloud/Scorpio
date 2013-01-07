CREATE TABLE `aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col_id` int(11) DEFAULT '0',
  `col_name` varchar(255) NOT NULL,
  `row_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `name_cn` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `localities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `areacode` int(11) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `telcode` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `freight_paid` decimal(5,2) DEFAULT '20.00',
  `freight_cod` decimal(5,2) DEFAULT '20.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4671 DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_channel` varchar(255) DEFAULT 'Novasol',
  `order_status` int(11) DEFAULT '0',
  `gift_flag` int(11) DEFAULT '0',
  `gift_price` int(11) DEFAULT '0',
  `gift_msg` varchar(255) DEFAULT NULL,
  `del_msg` varchar(255) DEFAULT NULL,
  `mem_id` varchar(255) NOT NULL,
  `mem_name` varchar(255) NOT NULL,
  `mem_email` varchar(255) NOT NULL,
  `mem_post` int(11) DEFAULT NULL,
  `mem_prov` varchar(255) DEFAULT NULL,
  `mem_city` varchar(255) DEFAULT NULL,
  `mem_dist` varchar(255) DEFAULT NULL,
  `mem_addr` varchar(255) DEFAULT NULL,
  `mem_mobile` varchar(255) DEFAULT NULL,
  `mem_phone` varchar(255) DEFAULT NULL,
  `del_name` varchar(255) DEFAULT NULL,
  `del_post` int(11) DEFAULT NULL,
  `del_prov` varchar(255) DEFAULT NULL,
  `del_city` varchar(255) DEFAULT NULL,
  `del_dist` varchar(255) DEFAULT NULL,
  `del_addr` varchar(255) DEFAULT NULL,
  `del_mobile` varchar(255) DEFAULT NULL,
  `del_phone` varchar(255) DEFAULT NULL,
  `inv_flag` int(11) DEFAULT NULL,
  `inv_title` varchar(255) DEFAULT NULL,
  `inv_content` varchar(255) DEFAULT NULL,
  `inv_name` varchar(255) DEFAULT NULL,
  `inv_post` int(11) DEFAULT NULL,
  `inv_prov` varchar(255) DEFAULT NULL,
  `inv_city` varchar(255) DEFAULT NULL,
  `inv_dist` varchar(255) DEFAULT NULL,
  `inv_addr` varchar(255) DEFAULT NULL,
  `inv_mobile` varchar(255) DEFAULT NULL,
  `inv_phone` varchar(255) DEFAULT NULL,
  `detail` text NOT NULL,
  `payment` int(11) NOT NULL,
  `ship` decimal(5,2) DEFAULT NULL,
  `coupon` decimal(6,2) DEFAULT '0.00',
  `pay_status` int(11) DEFAULT '0',
  `pay_date` date DEFAULT NULL,
  `ship_status` int(11) DEFAULT '0',
  `ship_sched` varchar(255) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `del_company` varchar(255) DEFAULT NULL,
  `del_ship_id` varchar(255) DEFAULT NULL,
  `arrival` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `alipay_cb_buyer_email` varchar(255) DEFAULT NULL,
  `alipay_cb_buyer_id` varchar(255) DEFAULT NULL,
  `alipay_cb_trade_status` varchar(255) DEFAULT NULL,
  `alipay_cb_trade_no` varchar(255) DEFAULT NULL,
  `alipay_cb_total_fee` decimal(6,2) DEFAULT NULL,
  `alipay_cb_notify_time` datetime DEFAULT NULL,
  `expected_total_fee` decimal(6,2) DEFAULT '0.00',
  `alipay_nt_notify_time` datetime DEFAULT NULL,
  `alipay_nt_trade_no` varchar(255) DEFAULT NULL,
  `alipay_nt_trade_status` varchar(255) DEFAULT NULL,
  `alipay_nt_create_time` datetime DEFAULT NULL,
  `alipay_nt_pay_time` datetime DEFAULT NULL,
  `alipay_nt_close_time` datetime DEFAULT NULL,
  `alipay_nt_refund_status` varchar(255) DEFAULT NULL,
  `alipay_nt_refund_time` datetime DEFAULT NULL,
  `alipay_nt_buyer_email` varchar(255) DEFAULT NULL,
  `alipay_nt_buyer_id` varchar(255) DEFAULT NULL,
  `alipay_nt_total_fee` decimal(6,2) DEFAULT NULL,
  `alipay_nt_discount` decimal(6,2) DEFAULT NULL,
  `got_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_orders_on_order_id` (`order_id`),
  KEY `index_orders_on_mem_id` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_pic` varchar(255) NOT NULL,
  `name_desc` text,
  `gallery` text,
  `price` decimal(6,2) NOT NULL,
  `retail` decimal(6,2) NOT NULL,
  `price_desc` varchar(255) NOT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `cert` text,
  `desc` text,
  `adv` text,
  `comp` varchar(255) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `orig` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_mime_type` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_uid` varchar(255) DEFAULT NULL,
  `image_ext` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_inquiries_inquiries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text,
  `spam` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_inquiries_inquiries_on_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_page_part_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_part_id` int(11) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_f9716c4215584edbca2557e32706a5ae084a15ef` (`refinery_page_part_id`),
  KEY `index_refinery_page_part_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_parts_on_id` (`id`),
  KEY `index_refinery_page_parts_on_refinery_page_id` (`refinery_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_page_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_d079468f88bff1c6ea81573a0d019ba8bf5c2902` (`refinery_page_id`),
  KEY `index_refinery_page_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT '1',
  `link_url` varchar(255) DEFAULT NULL,
  `menu_match` varchar(255) DEFAULT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `draft` tinyint(1) DEFAULT '0',
  `skip_to_first_child` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `view_template` varchar(255) DEFAULT NULL,
  `layout_template` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_pages_on_depth` (`depth`),
  KEY `index_refinery_pages_on_id` (`id`),
  KEY `index_refinery_pages_on_lft` (`lft`),
  KEY `index_refinery_pages_on_parent_id` (`parent_id`),
  KEY `index_refinery_pages_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_uid` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_roles_users` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_refinery_roles_users_on_role_id_and_user_id` (`role_id`,`user_id`),
  KEY `index_refinery_roles_users_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `destroyable` tinyint(1) DEFAULT '1',
  `scoping` varchar(255) DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT '0',
  `form_value_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_user_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_refinery_user_plugins_on_user_id_and_name` (`user_id`,`name`),
  KEY `index_refinery_user_plugins_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

CREATE TABLE `refinery_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_users_on_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_meta_id` int(11) DEFAULT NULL,
  `seo_meta_type` varchar(255) DEFAULT NULL,
  `browser_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seo_meta_on_id` (`id`),
  KEY `index_seo_meta_on_seo_meta_id_and_seo_meta_type` (`seo_meta_id`,`seo_meta_type`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20121017082153');

INSERT INTO schema_migrations (version) VALUES ('20121017082154');

INSERT INTO schema_migrations (version) VALUES ('20121017082155');

INSERT INTO schema_migrations (version) VALUES ('20121017082156');

INSERT INTO schema_migrations (version) VALUES ('20121017082157');

INSERT INTO schema_migrations (version) VALUES ('20121031201226');

INSERT INTO schema_migrations (version) VALUES ('20121031202604');

INSERT INTO schema_migrations (version) VALUES ('20121031203537');

INSERT INTO schema_migrations (version) VALUES ('20121031203540');

INSERT INTO schema_migrations (version) VALUES ('20121101000000');

INSERT INTO schema_migrations (version) VALUES ('20121101005837');

INSERT INTO schema_migrations (version) VALUES ('20121102055018');

INSERT INTO schema_migrations (version) VALUES ('20121102055022');

INSERT INTO schema_migrations (version) VALUES ('20121118103940');

INSERT INTO schema_migrations (version) VALUES ('20121118103956');

INSERT INTO schema_migrations (version) VALUES ('20121122135700');

INSERT INTO schema_migrations (version) VALUES ('20121122135800');

INSERT INTO schema_migrations (version) VALUES ('20121122212830');

INSERT INTO schema_migrations (version) VALUES ('20121122232557');

INSERT INTO schema_migrations (version) VALUES ('20121204084544');

INSERT INTO schema_migrations (version) VALUES ('20121208164819');

INSERT INTO schema_migrations (version) VALUES ('20121218203927');

INSERT INTO schema_migrations (version) VALUES ('20121218215500');

INSERT INTO schema_migrations (version) VALUES ('20130107170603');
-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 28 2018 г., 13:50
-- Версия сервера: 5.7.24-0ubuntu0.18.04.1
-- Версия PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `battle`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bets`
--

CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `win` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bonus` double(20,2) DEFAULT NULL,
  `remaining` text,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `commission` double(20,2) NOT NULL DEFAULT '0.00',
  `winner_team` varchar(255) DEFAULT NULL,
  `winner_factor` double(20,2) DEFAULT NULL,
  `rand_number` text,
  `signature` text,
  `random` text,
  `status` tinyint(1) DEFAULT '0',
  `finished_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `sum` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode`
--

CREATE TABLE `promocode` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL,
  `amount` int(255) DEFAULT NULL,
  `count_use` int(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `random_keys`
--

CREATE TABLE `random_keys` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `bits_count` int(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL DEFAULT 'qcode.site',
  `sitename` varchar(255) NOT NULL DEFAULT 'QCode.site',
  `desc` text,
  `keys` text,
  `vk_key` varchar(255) DEFAULT NULL,
  `vk_secret` varchar(255) DEFAULT NULL,
  `vk_url` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT '1',
  `mrh_ID` int(11) DEFAULT NULL,
  `mrh_secret1` varchar(255) DEFAULT NULL,
  `mrh_secret2` varchar(255) DEFAULT NULL,
  `fk_api` varchar(255) DEFAULT NULL,
  `fk_wallet` varchar(255) DEFAULT NULL,
  `timer` int(11) NOT NULL DEFAULT '10',
  `min_bet` double(20,2) NOT NULL DEFAULT '0.10',
  `max_bet` double(20,2) NOT NULL DEFAULT '5000.00',
  `commission` int(11) NOT NULL DEFAULT '10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `domain`, `sitename`, `desc`, `keys`, `vk_key`, `vk_secret`, `vk_url`, `order_id`, `mrh_ID`, `mrh_secret1`, `mrh_secret2`, `fk_api`, `fk_wallet`, `timer`, `min_bet`, `max_bet`, `commission`, `created_at`, `updated_at`) VALUES
(1, 'storegamer.ru', 'storegamer.ru', 'Storegamer.ru - это первая онлайн-игра, где вы можете повысить не только свои шансы на победу, но и шансы всей команды.', 'батл кеш, battle, cash, battlecash, battle.cash, командный, онлайн, игры', 'key', 'secret', 'https://vk.com/qcodesite', 3, NULL, NULL, NULL, NULL, NULL, 10, 0.10, 5000.00, 10, '2018-11-26 22:24:19', '2018-12-26 22:04:59');

-- --------------------------------------------------------

--
-- Структура таблицы `success_pay`
--

CREATE TABLE `success_pay` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `balance` double(20,2) DEFAULT '0.00',
  `ip` varchar(255) DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `is_moder` int(11) DEFAULT '0',
  `is_youtuber` int(11) NOT NULL DEFAULT '0',
  `is_premium` tinyint(1) DEFAULT '0',
  `is_vip` tinyint(1) DEFAULT '0',
  `banchat` int(11) DEFAULT NULL,
  `ban` int(1) NOT NULL DEFAULT '0',
  `affiliate_id` varchar(255) DEFAULT NULL,
  `referred_by` varchar(255) DEFAULT NULL,
  `access_token` text,
  `remember_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` double(8,2) DEFAULT NULL,
  `wallet` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bets_user_id_foreign` (`user_id`),
  ADD KEY `bets_game_id_foreign` (`game_id`);

--
-- Индексы таблицы `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonus_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocode_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `random_keys`
--
ALTER TABLE `random_keys`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `success_pay`
--
ALTER TABLE `success_pay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `success_pay_user_id_foreign` (`user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bets`
--
ALTER TABLE `bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `random_keys`
--
ALTER TABLE `random_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `success_pay`
--
ALTER TABLE `success_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bets`
--
ALTER TABLE `bets`
  ADD CONSTRAINT `bets_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bonus`
--
ALTER TABLE `bonus`
  ADD CONSTRAINT `bonus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `promocode`
--
ALTER TABLE `promocode`
  ADD CONSTRAINT `promocode_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `success_pay`
--
ALTER TABLE `success_pay`
  ADD CONSTRAINT `success_pay_user_id_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `withdraw`
--
ALTER TABLE `withdraw`
  ADD CONSTRAINT `withdraw_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

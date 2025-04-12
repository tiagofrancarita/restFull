CREATE TABLE `user_type`(
    `user_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_payment_info`(
    `payment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `card_number` VARCHAR(255) NOT NULL,
    `card_expiration` VARCHAR(255) NOT NULL,
    `card_security_code` VARCHAR(255) NOT NULL,
    `dt_payment` DATE NOT NULL,
    `user_id` BIGINT NOT NULL
);
CREATE TABLE `users`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `cpf` VARCHAR(255) NOT NULL,
    `dt_subscription` DATE NOT NULL,
    `dt_expiration` DATE NOT NULL,
    `user_type_id` INT NOT NULL,
    `subscription_type_id` INT NOT NULL
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_cpf_unique`(`cpf`);
CREATE TABLE `subscription_type`(
    `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `acess_month` INT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `product_key` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `subscription_type` ADD UNIQUE `subscription_type_product_key_unique`(`product_key`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY(`user_type_id`) REFERENCES `user_type`(`user_type_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_subscription_type_id_foreign` FOREIGN KEY(`subscription_type_id`) REFERENCES `subscription_type`(`subscription_id`);
ALTER TABLE
    `user_payment_info` ADD CONSTRAINT `user_payment_info_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);
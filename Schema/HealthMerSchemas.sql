-- 순서 적용하여 스키마 등록
-- 전체실행하여 테이블 등록 가능.

Drop Database HEALTHMER;
CREATE Database `HealthMer`;
USE `healthmer`;

-- 1. 기초 데이터 테이블
CREATE TABLE `user_type` (
    `type_id` TINYINT NOT NULL AUTO_INCREMENT,
    `type_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`type_id`)
);

CREATE TABLE `sign_up_route` (
    `route_id` TINYINT NOT NULL AUTO_INCREMENT,
    `route_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`route_id`)
);

CREATE TABLE `gender` (
    `id` TINYINT NOT NULL AUTO_INCREMENT,
    `gender_name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `window_mode` (
	`id` TINYINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `health_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

-- 2. 주요 엔티티 테이블
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_type_id` TINYINT NOT NULL,
    `sign_up_route_id` TINYINT NOT NULL,
    `user_id` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(255) NOT NULL,
    `age` TINYINT NOT NULL,
    `gender_id` TINYINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE (`email`),
    UNIQUE (`user_id`),
    UNIQUE (`nickname`),
    FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`type_id`),
    FOREIGN KEY (`sign_up_route_id`) REFERENCES `sign_up_route`(`route_id`),
    FOREIGN KEY (`gender_id`) REFERENCES `gender`(`id`)
);

CREATE TABLE `share_board` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timer_info_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `contents` TEXT NOT NULL,
    `post_views` BIGINT NOT NULL,
    `user_views` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`timer_info_id`) REFERENCES `timer_info`(`id`),
    PRIMARY KEY (`id`)
);

CREATE TABLE `timer_info` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `views_count` BIGINT NOT NULL,
    `complete_count` BIGINT NOT NULL,
    `level` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

CREATE TABLE `routine_info` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timer_info_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `time` SMALLINT NOT NULL,
    `is_rest` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`timer_info_id`) REFERENCES `timer_info`(`id`)
);

-- 3. 연관 테이블
CREATE TABLE `save` (
    `user_id` BIGINT NOT NULL,
    `share_board_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `share_board_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`share_board_id`) REFERENCES `share_board`(`id`)
);

CREATE TABLE `like` (
    `user_id` BIGINT NOT NULL,
    `share_board_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `share_board_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`share_board_id`) REFERENCES `share_board`(`id`)
);

CREATE TABLE `comment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `share_board_id` BIGINT NOT NULL,
    `comments` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`share_board_id`) REFERENCES `share_board`(`id`)
);

CREATE TABLE `user_setting` (
    `user_id` BIGINT NOT NULL,
    `window_mode` TINYINT NULL,
    PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`window_mode`) REFERENCES `window_mode`(`id`)
);

CREATE TABLE `timer_category` (
    `timer_info_id` BIGINT NOT NULL,
    `health_category_id` BIGINT NOT NULL,
    PRIMARY KEY (`timer_info_id`, `health_category_id`),
    FOREIGN KEY (`timer_info_id`) REFERENCES `timer_info`(`id`),
    FOREIGN KEY (`health_category_id`) REFERENCES `health_category`(`id`)
);
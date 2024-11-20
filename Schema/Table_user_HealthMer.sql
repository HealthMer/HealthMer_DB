-- Table_user_HealthMer
USE `HEALTHMER`;

-- 1. 테이블 존재 여부 확인 후 생성
DROP TABLE IF EXISTS `user`;

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
    FOREIGN KEY (`user_type_id`) REFERENCES `user_type`(`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`sign_up_route_id`) REFERENCES `sign_up_route`(`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`gender_id`) REFERENCES `gender`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. TEST 초기 데이터 삽입 방지 (중복 검사 후 삽입) 
INSERT IGNORE INTO `user` (`user_type_id`, `sign_up_route_id`, `user_id`, `password`, `email`, `nickname`, `age`, `gender_id`)
VALUES
(1, 1, 'admin', 'password123', 'admin@example.com', 'admin', 30, 1);
-- (2, 2, 'user1', 'password123', 'user1@example.com', 'user1', 25, 2);

truncate table `user`;
SELECT * from user;
/*
-- 1. 특정 사용자 조회 (ID 기준)
SELECT * FROM `user` WHERE `id` = #{id};

-- 2. 특정 사용자 조회
SELECT * FROM `user` WHERE `user_id` = #{userId};

-- 3. 모든 사용자 조회
SELECT * FROM `user`;

-- 4. 사용자 삽입
INSERT INTO `user` (
    `user_type_id`, 
    `sign_up_route_id`, 
    `user_id`, 
    `password`, 
    `email`, 
    `nickname`, 
    `age`, 
    `gender_id`
) VALUES (
    #{userTypeId}, 
    #{signUpRouteId}, 
    #{userId}, 
    #{password}, 
    #{email}, 
    #{nickname}, 
    #{age}, 
    #{genderId}
);

-- 5. 사용자 정보 수정
UPDATE `user` SET 
    `user_type_id` = #{userTypeId}, 
    `sign_up_route_id` = #{signUpRouteId}, 
    `password` = #{password}, 
    `email` = #{email}, 
    `nickname` = #{nickname}, 
    `age` = #{age}, 
    `gender_id` = #{genderId}
WHERE `id` = #{id};

-- 6. 사용자 삭제
DELETE FROM `user` WHERE `id` = #{id};
*/
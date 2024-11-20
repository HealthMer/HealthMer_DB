-- TABLE_health_caegory_HealthMer
-- upper body : 1
-- lower body : 2
-- Core : 3
-- Full Body : 4
-- Cardio : 5
-- Flexibility_Stretching : 6

USE `HEALTHMER`;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS `health_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

-- 초기 데이터 삽입 (중복 방지)
INSERT IGNORE INTO `health_category` (`id`, `name`) VALUES
(1, 'Upper Body'),        -- 상체
(2, 'Lower Body'),        -- 하체
(3, 'Core'),              -- 코어
(4, 'Full Body'),         -- 전신
(5, 'Cardio'),            -- 유산소
(6, 'Flexibility_Stretching'); -- 유연성/스트레칭

-- 데이터 조회
SELECT 
    `id` AS 'Category ID', 
    `name` AS 'Category Name'
FROM `health_category`;

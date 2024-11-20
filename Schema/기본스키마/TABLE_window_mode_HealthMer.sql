-- TABLE_health_caegory_HealthMer
-- light : 1
-- dark : 2
-- device : 3

USE `HEALTHMER`;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS `window_mode` (
    `id` TINYINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

-- 초기 데이터 삽입 (중복 방지)
INSERT IGNORE INTO `window_mode` (`id`, `name`) VALUES
(1, 'Light'),    -- 라이트 모드
(2, 'Dark'),     -- 다크 모드
(3, 'Device');   -- 사용자 설정 (디바이스 설정 기반)

-- 데이터 조회
SELECT 
    `id` AS 'Mode ID', 
    `name` AS 'Mode Name'
FROM `window_mode`;

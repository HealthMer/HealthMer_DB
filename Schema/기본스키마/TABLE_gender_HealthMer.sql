-- MALE : 1
-- FEMALE : 2
-- ETC : 3
USE `HEALTHMER`;
-- 
-- 초기 데이터 삽입 (중복 방지)
INSERT IGNORE INTO `gender` (`id`, `gender_name`) VALUES
(1, 'MALE'),
(2, 'FEMALE'),
(3, 'ETC');

-- 데이터 조회
SELECT * from `gender`;

SELECT 
    `id` AS 'Gender ID', 
    `gender_name` AS 'Gender Name'
FROM `gender`;

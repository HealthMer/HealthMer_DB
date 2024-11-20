-- 추가 X
-- Admin  : 1
-- Member : 2

USE `HEALTHMER`;

SELECT * from `user_type`;

TRUNCATE table `user_type`;

INSERT INTO `user_type` (`type_name`) VALUES
('Admin'),
('Member');
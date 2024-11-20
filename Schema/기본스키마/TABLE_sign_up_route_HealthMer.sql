-- 추가 X
-- Kakao : 1
-- Naver : 2
-- Google : 3
-- Firebase : 4
-- Email : 5


USE `HEALTHMER`;

select * from sign_up_route;

-- 초기 값 세팅
INSERT INTO `sign_up_route` (`route_name`) VALUES
('Kakao'),
('Naver'),
('Google'),
('Firebase'),
('Email');

-- 테이블 데이터 초기화
-- FK에 의해 적용되지 않음, -> FK 예외 시킨 뒤 다시 적용시켜 해결함
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE sign_up_route;
SET FOREIGN_KEY_CHECKS = 1;
--------------------------------

-- 트리거 확인
show triggers;

-- 추가시 트리거 제거 
DROP TRIGGER IF EXISTS `prevent_insert_sign_up_route`;
DROP TRIGGER IF EXISTS `prevent_update_sign_up_route`;
DROP TRIGGER IF EXISTS `prevent_delete_sign_up_route`;

-- ------------- 트리거 생성
-- UPDATE 방지 트리거
DELIMITER $$

CREATE TRIGGER prevent_insert_sign_up_route
BEFORE INSERT ON `sign_up_route`
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insert operation is not allowed on sign_up_route';
END$$

-- UPDATE 방지 트리거
CREATE TRIGGER prevent_update_sign_up_route
BEFORE UPDATE ON `sign_up_route`
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Update operation is not allowed on sign_up_route';
END$$

-- DELETE 방지 트리거
CREATE TRIGGER prevent_delete_sign_up_route
BEFORE DELETE ON `sign_up_route`
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Delete operation is not allowed on sign_up_route';
END$$
DELIMITER ;
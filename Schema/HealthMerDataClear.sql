-- Clear Data
 
-- 1. 외래 키 제약 조건 비활성화
SET FOREIGN_KEY_CHECKS = 0;

-- 2. 모든 테이블 데이터 초기화
TRUNCATE TABLE `save`;
TRUNCATE TABLE `like`;
TRUNCATE TABLE `comment`;
TRUNCATE TABLE `routine_info`;
TRUNCATE TABLE `timer_category`;
TRUNCATE TABLE `timer_info`;
TRUNCATE TABLE `share_board`;
TRUNCATE TABLE `user_setting`;
TRUNCATE TABLE `user`;
TRUNCATE TABLE `health_category`;
TRUNCATE TABLE `gender`;
TRUNCATE TABLE `window_mode`;
TRUNCATE TABLE `sign_up_route`;
TRUNCATE TABLE `user_type`;

-- 3. 외래 키 제약 조건 활성화
SET FOREIGN_KEY_CHECKS = 1;

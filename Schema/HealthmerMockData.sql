-- 임시 mock data
-- Test Data 추가금지

-- 1. user_type 데이터
INSERT INTO `user_type` (`type_name`) VALUES
('Admin'),
('Member'),
('Guest');

-- 2. sign_up_route 데이터
INSERT INTO `sign_up_route` (`route_name`) VALUES
('Google'),
('Facebook'),
('Email');

-- 3. gender 데이터
INSERT INTO `gender` (`gender_name`) VALUES
('Male'),
('Female'),
('Other');

-- 4. window_mode 데이터
INSERT INTO `window_mode` (`id`) VALUES
(0), -- Light
(1), -- Dark
(2); -- Device

-- 5. health_category 데이터
INSERT INTO `health_category` (`name`) VALUES
('Cardio'),
('Strength'),
('Flexibility');

-- 6. user 데이터
INSERT INTO `user` (`user_type_id`, `sign_up_route_id`, `user_id`, `password`, `email`, `nickname`, `age`, `gender_id`) VALUES
(1, 1, 'user01', 'password1', 'user01@example.com', 'UserOne', 25, 1),
(2, 2, 'user02', 'password2', 'user02@example.com', 'UserTwo', 30, 2),
(3, 3, 'user03', 'password3', 'user03@example.com', 'UserThree', 28, 3);

-- 7. share_board 데이터
INSERT INTO `share_board` (`title`, `contents`, `post_views`, `user_views`, `created_at`, `updated_at`) VALUES
('Post 1', 'Content for post 1', 10, 5, NOW(), NOW()),
('Post 2', 'Content for post 2', 20, 10, NOW(), NOW()),
('Post 3', 'Content for post 3', 30, 15, NOW(), NOW());

-- 8. timer_info 데이터
INSERT INTO `timer_info` (`user_id`, `title`, `views_count`, `complete_count`, `level`) VALUES
(1, 'Morning Routine', 100, 50, 1),
(2, 'Evening Workout', 200, 100, 2),
(3, 'Lunch Break Yoga', 300, 150, 3);

-- 9. routine_info 데이터
INSERT INTO `routine_info` (`timer_info_id`, `name`, `time`, `is_rest`) VALUES
(1, 'Warm-up', 10, 0),
(1, 'Cardio', 20, 0),
(1, 'Cool-down', 5, 1);

-- 10. save 데이터
INSERT INTO `save` (`user_id`, `share_board_id`, `created_at`) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW());

-- 11. like 데이터
INSERT INTO `like` (`user_id`, `share_board_id`, `created_at`) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW());

-- 12. comment 데이터
INSERT INTO `comment` (`user_id`, `share_board_id`, `comments`, `created_at`) VALUES
(1, 1, 'Great post!', NOW()),
(2, 2, 'Very helpful!', NOW()),
(3, 3, 'Thanks for sharing!', NOW());

-- 13. user_setting 데이터
INSERT INTO `user_setting` (`user_id`, `window_mode`) VALUES
(1, 0),
(2, 1),
(3, 2);

-- 14. timer_category 데이터
INSERT INTO `timer_category` (`timer_info_id`, `health_category_id`) VALUES
(1, 1), -- Morning Routine -> Cardio
(2, 2), -- Evening Workout -> Strength
(3, 3); -- Lunch Break Yoga -> Flexibility

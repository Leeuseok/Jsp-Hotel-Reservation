-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.16 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- jsp_project 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jsp_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jsp_project`;

-- 테이블 jsp_project.booking 구조 내보내기
CREATE TABLE IF NOT EXISTS `booking` (
  `resev_idx` int(11) NOT NULL,
  `room_idx` int(11) NOT NULL,
  `mem_idx` int(11) NOT NULL,
  `resev_at` datetime DEFAULT NULL,
  `resev_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`resev_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jsp_project.booking:~0 rows (대략적) 내보내기
DELETE FROM `booking`;

-- 테이블 jsp_project.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `mem_idx` int(11) NOT NULL,
  `mem_id` varchar(50) DEFAULT NULL,
  `mem_pw` varchar(100) DEFAULT NULL,
  `mem_birth` varchar(50) DEFAULT NULL,
  `mem_phone` varchar(50) DEFAULT NULL,
  `mem_addr` varchar(100) DEFAULT NULL,
  `mem_name` varchar(50) DEFAULT NULL,
  `reg_at` datetime DEFAULT NULL,
  PRIMARY KEY (`mem_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jsp_project.member:~0 rows (대략적) 내보내기
DELETE FROM `member`;

-- 테이블 jsp_project.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `reply_idx` int(11) NOT NULL,
  `mem_idx` int(11) NOT NULL,
  `review_idx` int(11) NOT NULL,
  `reply_cmt` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reply_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jsp_project.reply:~0 rows (대략적) 내보내기
DELETE FROM `reply`;

-- 테이블 jsp_project.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_idx` int(11) NOT NULL,
  `mem_idx` int(11) NOT NULL,
  `room_idx` int(11) NOT NULL,
  `review_title` varchar(100) DEFAULT NULL,
  `review_cmt` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`review_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jsp_project.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;

-- 테이블 jsp_project.room 구조 내보내기
CREATE TABLE IF NOT EXISTS `room` (
  `room_idx` int(11) NOT NULL,
  `mem_idx` int(11) NOT NULL,
  `room_title` varchar(100) DEFAULT NULL,
  `room_kind` int(11) DEFAULT NULL,
  `room_people` int(11) DEFAULT NULL,
  `room_detail` varchar(1000) DEFAULT NULL,
  `room_area` varchar(50) DEFAULT NULL,
  `room_guide` varchar(200) DEFAULT NULL,
  `room_map` varchar(200) DEFAULT NULL,
  `room_price` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `room_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jsp_project.room:~5 rows (대략적) 내보내기
DELETE FROM `room`;
INSERT INTO `room` (`room_idx`, `mem_idx`, `room_title`, `room_kind`, `room_people`, `room_detail`, `room_area`, `room_guide`, `room_map`, `room_price`, `created_at`, `room_num`) VALUES
	(1, 1, 'Standard double', 1, 2, '스마트TV | 구스다운 100% 이불 | 샴푸 컨디셔너 | 칫솔 치약 | 샤워젤 및 로션,비누 | 목욕용 가운 | 배스타월 샤워캡 | 빗 | 커피머신기 | 헤어드라이어 | 커피포트 | 슬리퍼', '25.8m(3) 7.8평', '입실시간은 15:00부터, 퇴실 시간은 정오 12:00까지 입니다.', '단층 | 더블 1EA | 샤워부스', 200000, '2023-11-27 21:53:45', 10),
	(3, 1, 'Deluxe Twin', 3, 2, '스마트TV | 구스다운 100% 이불 | 샴푸 컨디셔너 | 칫솔 치약 | 샤워젤 및 로션,비누 | 목욕용 가운 | 배스타월 샤워캡 | 빗 | 커피머신기 | 헤어드라이어 | 커피포트 | 슬리퍼', '31.1m(3) 9.4평', '입실시간은 15:00부터, 퇴실 시간은 정오 12:00까지 입니다.', '단층 | 슈퍼 싱글 2EA | 샤워부스', 250000, '2023-11-27 21:53:45', 10),
	(4, 1, 'Family Twin', 4, 3, '스마트TV | 구스다운 100% 이불 | 샴푸 컨디셔너 | 칫솔 치약 | 샤워젤 및 로션,비누 | 목욕용 가운 | 배스타월 샤워캡 | 빗 | 커피머신기 | 헤어드라이어 | 커피포트 | 슬리퍼', '31.1m(3) 9.4평', '입실시간은 15:00부터, 퇴실 시간은 정오 12:00까지 입니다.', '단층 | 더블 1EA + 슈퍼싱글 1EA | 샤워부스', 280000, '2023-11-27 21:53:46', 10),
	(5, 1, 'Premium Double', 5, 2, '스마트TV | 구스다운 100% 이불 | 샴푸 컨디셔너 | 칫솔 치약 | 샤워젤 및 로션,비누 | 목욕용 가운 | 배스타월 샤워캡 | 빗 | 커피머신기 | 헤어드라이어 | 커피포트 | 슬리퍼', '31.1m(3) 9.4평', '입실시간은 15:00부터, 퇴실 시간은 정오 12:00까지 입니다.', '단층 | 퀸사이즈 1EA | 샤워부스', 230000, '2023-11-27 21:53:46', 10),
	(6, 1, 'Suite Room', 6, 2, '스마트TV | 구스다운 100% 이불 | 샴푸 컨디셔너 | 칫솔 치약 | 샤워젤 및 로션,비누 | 목욕용 가운 | 배스타월 샤워캡 | 빗 | 커피머신기 | 헤어드라이어 | 커피포트 | 슬리퍼', '44.9m(3) 13.6평', '입실시간은 15:00부터, 퇴실 시간은 정오 12:00까지 입니다.', '단층 | 캉사이즈 1EA | 샤워부스', 350000, '2023-11-27 21:53:46', 10);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

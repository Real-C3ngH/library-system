-- Initialize database and import schema/data if needed
CREATE DATABASE IF NOT EXISTS `library2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library2`;

-- If the project has a full dump, it will be mounted and executed by docker-entrypoint-initdb.d
-- This file only ensures database exists. The main schema should come from library2.sql if mounted.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spotify` DEFAULT CHARACTER SET utf8 ;
USE `Spotify` ;

-- -----------------------------------------------------
-- Table `Spotify`.`password`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`password` (
  `id_password` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(100) NOT NULL,
  `last_modified_date` DATE NOT NULL,
  PRIMARY KEY (`id_password`),
  UNIQUE INDEX `id_password_UNIQUE` (`id_password` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `id_password` INT NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `sex` TINYINT(1) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE,
  INDEX `FK_user_password_idx` (`id_password` ASC) VISIBLE,
  CONSTRAINT `FK_user_password`
    FOREIGN KEY (`id_password`)
    REFERENCES `Spotify`.`password` (`id_password`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`subscription` (
  `id_subscription` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `subscription_model` TINYINT(1) NOT NULL,
  `subscription_start_date` DATE NOT NULL,
  `subscription_end_date` DATE NULL,
  PRIMARY KEY (`id_subscription`),
  UNIQUE INDEX `id_subscription_UNIQUE` (`id_subscription` ASC) VISIBLE,
  INDEX `FK_subscription_user_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `FK_subscription_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `Spotify`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `songs_count` INT NOT NULL,
  `create_date` DATE NOT NULL,
  `id_user_creator` INT NOT NULL,
  `playlist_type` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_playlist`),
  UNIQUE INDEX `id_playlist_UNIQUE` (`id_playlist` ASC) VISIBLE,
  INDEX `FK_playlist_user_idx` (`id_user_creator` ASC) VISIBLE,
  CONSTRAINT `FK_playlist_user`
    FOREIGN KEY (`id_user_creator`)
    REFERENCES `Spotify`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`artist` (
  `id_artist` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `profile_image` VARCHAR(2083) NOT NULL,
  PRIMARY KEY (`id_artist`),
  UNIQUE INDEX `id_artist_UNIQUE` (`id_artist` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`discografica` (
  `id_discografica` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_discografica`),
  UNIQUE INDEX `id_discografica_UNIQUE` (`id_discografica` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `id_artist` INT NOT NULL,
  `id_discografica` INT NOT NULL,
  `cover_image` VARCHAR(2083) NOT NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE INDEX `id_album_UNIQUE` (`id_album` ASC) VISIBLE,
  INDEX `album_artist_idx` (`id_artist` ASC) VISIBLE,
  INDEX `album_discografica_idx` (`id_discografica` ASC) VISIBLE,
  CONSTRAINT `album_artist`
    FOREIGN KEY (`id_artist`)
    REFERENCES `Spotify`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `album_discografica`
    FOREIGN KEY (`id_discografica`)
    REFERENCES `Spotify`.`discografica` (`id_discografica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`song` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `duration_time` TIME NOT NULL,
  `id_album` INT NOT NULL,
  `song_played_count` INT NULL,
  `song_liked_count` INT NULL,
  PRIMARY KEY (`id_song`),
  UNIQUE INDEX `id_songs_UNIQUE` (`id_song` ASC) VISIBLE,
  INDEX `FK_song_album_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `FK_song_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `Spotify`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`genre` (
  `id_genre` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE INDEX `id_genre_UNIQUE` (`id_genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`playlist_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`playlist_song` (
  `id_playlist_songs` INT NOT NULL AUTO_INCREMENT,
  `id_playlist` INT NOT NULL,
  `id_songs` INT NOT NULL,
  PRIMARY KEY (`id_playlist_songs`),
  UNIQUE INDEX `idplaylist_x_songs_UNIQUE` (`id_playlist_songs` ASC) VISIBLE,
  INDEX `FK_playlist_song_playlist_idx` (`id_playlist` ASC) VISIBLE,
  INDEX `FK_playlist_song_song_idx` (`id_songs` ASC) VISIBLE,
  CONSTRAINT `FK_playlist_song_playlist`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `Spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_playlist_song_song`
    FOREIGN KEY (`id_songs`)
    REFERENCES `Spotify`.`song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`song_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`song_genre` (
  `id_song_genre` INT NOT NULL AUTO_INCREMENT,
  `id_song` INT NOT NULL,
  `id_genre` INT NOT NULL,
  PRIMARY KEY (`id_song_genre`),
  UNIQUE INDEX `id_song_genre_UNIQUE` (`id_song_genre` ASC) VISIBLE,
  INDEX `FK_song_genre_song_idx` (`id_song` ASC) VISIBLE,
  INDEX `FK_song_genre_genre_idx` (`id_genre` ASC) VISIBLE,
  CONSTRAINT `FK_song_genre_song`
    FOREIGN KEY (`id_song`)
    REFERENCES `Spotify`.`song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_song_genre_genre`
    FOREIGN KEY (`id_genre`)
    REFERENCES `Spotify`.`genre` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

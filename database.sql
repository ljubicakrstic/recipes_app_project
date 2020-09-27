-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 27, 2020 at 07:21 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recepti`
--
CREATE DATABASE IF NOT EXISTS `recepti` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `recepti`;

-- --------------------------------------------------------

--
-- Table structure for table `grupa_jela`
--

DROP TABLE IF EXISTS `grupa_jela`;
CREATE TABLE IF NOT EXISTS `grupa_jela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupa_jela`
--

INSERT INTO `grupa_jela` (`id`, `naziv`) VALUES
(1, 'Doručak'),
(2, 'Ručak'),
(3, 'Večera'),
(4, 'Užina'),
(5, 'Slatkiši'),
(6, 'Piće');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` varchar(45) CHARACTER SET utf8 NOT NULL,
  `ime_prezime` varchar(45) CHARACTER SET utf8 NOT NULL,
  `email` varchar(45) NOT NULL,
  `sifra` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `korisnicko_ime`, `ime_prezime`, `email`, `sifra`) VALUES
(3, 'ljuba', 'Ljubica Krstić', 'ljuba@gmail.com', '123'),
(4, 'boba', 'Boban Jović', 'boba@gmail.com', '123'),
(5, 'mimi', 'Miljana Ilić', 'miljana@gmail.com', '1234567'),
(6, 'kiza', 'Zoran Pavlovic', 'zoran@gmail.com', 'zoran123'),
(7, 'laki', 'Lazar Milojevic', 'laza@laza.com', 'laza12345'),
(8, 'ivana', 'Ivana Krstic', 'ivana@gmail.com', '1234567'),
(9, 'mara', 'Marija Bulajic', 'marijab@gmail.com', 'marijamara'),
(10, 'snezana', 'Snezana Marinkovic', 'ljkrstic1@gmail.com', '1234567'),
(11, 'mica', 'Milica Bajić', 'ljkrstic1@gmail.com', 'micamica'),
(12, 'jana', 'Jana Markovic', 'janaaa@jana.com', 'jana12345'),
(13, 'nikola', 'Nikola Jovanovic', 'nikola@hotmail.com', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

DROP TABLE IF EXISTS `recept`;
CREATE TABLE IF NOT EXISTS `recept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(225) CHARACTER SET utf8 NOT NULL,
  `autor` int(11) NOT NULL,
  `duzina_pripreme` varchar(45) NOT NULL,
  `opis` mediumtext CHARACTER SET utf8 NOT NULL,
  `uputstvo` mediumtext CHARACTER SET utf8 NOT NULL,
  `vreme` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`autor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recept`
--

INSERT INTO `recept` (`id`, `naziv`, `autor`, `duzina_pripreme`, `opis`, `uputstvo`, `vreme`) VALUES
(3, 'Čokoladni mafini', 3, '30 min', 'Omiljeni slatkiš ljudi širom sveta, koji se pravi veoma jednostavno, pa je tako popularan i među početnicima koji tek počinju sa kuvanjem i mešenjem. ', 'Pomešati suve sastojke u jednoj posudi, a u drugoj tečne. \n \n\n Zatim uliti tečne u suve i izmešati. \n \n\n Na stranu odvojite 1/4 čokolade. \n \n\n Pomoću dve kašike spuštajte smesu u papirne korpice za mafine koje ste prethodno poređali u kalupe. Neka 1/3 korpice bude napunjena smesom. \n \n\n Sada svaki mafin pospite čokoladom koju ste odvojili. \n \n\n Pecite na 200 stepeni u prethodno zagrejanoj rerni 20 minuta. \n \n\nOd ove količine sastojaka dobićete 24+ mafina. ', '2020-09-25 09:02:51'),
(4, 'Gurmanski burito', 3, '25 min', 'Burito je jedan od najpoznatijih specijaliteta meksičke kuhinje i jedan od najomiljenijih u svetu. Kao osnova za pravljenje burita se koristi tortilja, odnosno beskvasna vrsta hleba koja predstavlja jedan od simbola meksičke tradicije.', 'Očistite crni luk i sitno ga iseckajte. Stavite ulje u dublji tiganj da se zagreje, pa potom stavite luk da se dinsta dok ne postane staklast.\n\n \n\n Pileće belo meso iseckajte na štapiće ili na kockice, u zavisnosti od toga šta više volite. Paradajz kratko poparite u vreloj vodi, oljuštite ga i isecite na kocke.\n\n \n\nU prethodno pripremljen luk dodajte piletinu, paradajz i crveni pasulj. Zatim dodajte so, vegetu i čili po ukusu, dobro promešajte i kratko prodinstajte, a zatim uz podlivanje sa po malo vode krčkajte oko 20 minuta.\n\n \n\n Kad je nadev od piletine za burito gotov dodajte sok od kuvanog paradajza, sitno isečen peršunov list i propasiran beli luk. Dobro promešajte, potomkrčkajte nekoliko minuta i sklonite.\nZagrejte tortilje na teflonskom tiganju ili u rerni. Na svaku tortilju stavite po 2 kašike nadeva, urolajte je kao palačinku i stavite u podmazanu vatrostanu posudu. Pecite tortilje u rerni 15 minuta na 180 stepeni i meksički specijalitet je pripremljen. Ukoliko želite nešto sočniji burito, možete poređati mocarelu isečenu na kriške po buritosima i vratiti u rernu da se sir rastopi.', '2020-09-25 09:08:21'),
(5, 'Domaći čips iz rerne', 3, '40 min', 'Ako volite čips, onda ga spremite na ovaj način! Em\' utrošite manje ulja, em\' je zdravija varijanta...', '\nKrompir operite, oljuštite i tanko ga iseckajte na secku (ukoliko ga nemate možete i nožem na što tanje listiće). Stavite ga na krpu, kako bi bio suv.\n\nPodmažite veći pleh uljem i ređajte čips jedan do drugog dok ne popunite ceo pleh. Okrenite svaki komad čipsa naopako, kako bi i druga strana bila nauljena. Stavite pleh u zagrejanu rernu na 200 stepeni i pecite oko desetak minuta, tj. dok ne porumeni. S\' vremena na vreme otvorite vrata rerne kako bi izašla para. Pečen izvadite iz rerne, posolite po ukusu i stavite novu turu čipsa da se peče.', '2020-09-25 09:09:47'),
(6, 'Jaja iz rerne', 3, '15 min', 'Hranljiv, zdrav i lagan za pripremu. Takav obrok svi prosto obožavamo. A još kada se lako može prilagoditi sastojcima koje imamo kod kuće u tom trenutku - ništa bolje. Vreme koje je potrebno za pripremu, može biti čak i kraće nego da hranu poručite na kućnu adresu, kada pričamo o večeri. Ako je u pitanju doručak, takođe je vreme bitan faktor, jer prosto smutite, ubacite u rernu - i dok se spremate za posao - vaš doručak je gotov.', 'Uključite rernu na 220 stepeni. \n\nSpanać - kada se koristi svež spanać: potrebno je ubaciti ga u ključalu vodu, bukvalno na 1 munut da omekša. Ako se koristi zaleđen: potrebno je na malo maslaca izdinstati ga par minuta - takođe samo da omekša i naravno odledi se. Ali za sve ovo je zaista potrebno nekoliko minuta. \n\nKada je spanać spreman za upotrebu, pridružitii mu izmrvljen mladi sir i iseckanu pečenicu. Posoliti, pobiberiti i dobro sjediniti sastojke.\n\nJaja - umutiti žicom ili mikserom. Ali ne dodavati ništa više. Smesu ste dovoljno posolili te jaja nema potrebe.', '2020-09-25 09:12:50'),
(7, 'Losos sa prelivom od jogurta', 4, '60 min', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur', '2020-09-25 09:20:56'),
(8, 'Mohito koktel', 4, '5 min', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. ', '2020-09-25 09:22:25'),
(9, 'Njoke u sosu od paradajza', 4, '40 min', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. ', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. ', '2020-09-25 09:23:25'),
(10, 'Omlet sa šunkom', 4, '10 min', 'Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat', '2020-09-25 09:24:45'),
(11, 'Pasta sa piletinom', 5, '40 min', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur', '2020-09-25 09:26:33'),
(12, 'Jagnjeće pečenje', 5, '2 sata', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. ', '2020-09-25 09:27:44'),
(13, 'Američka pita sa višnjama', 5, '45 min', 'Mauris id tincidunt urna. In hac habitasse platea dictumst. Sed tellus nisl, malesuada ac dignissim eu, viverra quis ligula. ', 'Mauris id tincidunt urna. In hac habitasse platea dictumst. Sed tellus nisl, malesuada ac dignissim eu, viverra quis ligula. Proin lacus justo, rutrum quis sodales nec, fermentum gravida sem. Maecenas id felis quis nulla venenatis faucibus. Vivamus eu eros mauris. Phasellus quis molestie magna. Nullam volutpat iaculis tristique. Pellentesque nec odio mi. Cras scelerisque, ipsum in convallis varius, turpis metus mattis nibh, et accumsan est nibh at nisl. Aenean pretium nulla ex. Vivamus viverra elit viverra tincidunt lacinia. Donec sit amet tempor lacus. Fusce quis rutrum ipsum, in tristique augue. Nulla facilisi. Curabitur at odio et enim ullamcorper vestibulum.', '2020-09-25 09:29:27'),
(14, 'Rižoto sa povrćem', 3, '30 min', 'Nulla facilisi. Suspendisse fringilla enim at elit placerat gravida.', 'Nulla facilisi. Suspendisse fringilla enim at elit placerat gravida. Aliquam lacinia, mauris molestie pulvinar bibendum, magna justo ornare ex, vel maximus justo elit in nisi. Pellentesque nibh purus, mattis vitae risus nec, varius imperdiet nibh. Nulla tincidunt maximus faucibus. Aliquam erat volutpat. In ligula lectus, imperdiet nec enim id, tempus sollicitudin purus. Ut at cursus nulla. Cras nibh mi, dictum nec sollicitudin vitae, sagittis et eros.\n\nSed posuere massa non luctus varius. Curabitur euismod odio eget diam dignissim auctor. Nunc luctus bibendum arcu, quis feugiat diam scelerisque eu. Vestibulum dui nulla, ultrices eget elit in, luctus venenatis purus. Proin vel enim ut dolor maximus tempus. Donec nisi justo, cursus quis venenatis ut, facilisis ut odio. Morbi tempus augue neque, id condimentum nibh sodales ac. Integer ut velit nulla.', '2020-09-25 09:30:54'),
(15, 'Sočna obrok salata', 3, '40 min', 'Donec vel augue aliquam, sollicitudin arcu non, sollicitudin nisl. Sed in ante nec augue dapibus accumsan ac non augue. Integer a felis justo. Cras scelerisque augue sed lectus ultrices gravida. ', 'Mauris id tincidunt urna. In hac habitasse platea dictumst. Sed tellus nisl, malesuada ac dignissim eu, viverra quis ligula. Proin lacus justo, rutrum quis sodales nec, fermentum gravida sem. Maecenas id felis quis nulla venenatis faucibus. Vivamus eu eros mauris. Phasellus quis molestie magna. Nullam volutpat iaculis tristique. Pellentesque nec odio mi. Cras scelerisque, ipsum in convallis varius, turpis metus mattis nibh, et accumsan est nibh at nisl. Aenean pretium nulla ex. Vivamus viverra elit viverra tincidunt lacinia. Donec sit amet tempor lacus. Fusce quis rutrum ipsum, in tristique augue. Nulla facilisi. Curabitur at odio et enim ullamcorper vestibulum.', '2020-09-25 09:32:18'),
(16, 'Domaća topla čokolada', 3, '', 'Sed posuere massa non luctus varius. Curabitur euismod odio eget diam dignissim auctor.', 'Mauris id tincidunt urna. In hac habitasse platea dictumst. Sed tellus nisl, malesuada ac dignissim eu, viverra quis ligula. Proin lacus justo, rutrum quis sodales nec, fermentum gravida sem. Maecenas id felis quis nulla venenatis faucibus. Vivamus eu eros mauris. Phasellus quis molestie magna.', '2020-09-25 09:33:23'),
(17, 'Torta od vanile', 3, '60 min', 'Donec vel augue aliquam, sollicitudin arcu non, sollicitudin nisl. Sed in ante nec augue dapibus accumsan ac non augue. Integer a felis justo. ', 'Donec vel augue aliquam, sollicitudin arcu non, sollicitudin nisl. Sed in ante nec augue dapibus accumsan ac non augue. Integer a felis justo. Cras scelerisque augue sed lectus ultrices gravida. Suspendisse sodales, ante non vestibulum ullamcorper, sem elit congue lacus, in condimentum magna sapien quis urna. Vestibulum congue augue libero, id posuere velit eleifend id. In vel posuere libero. Cras suscipit ipsum eget metus maximus, eget convallis tellus efficitur. ', '2020-09-25 09:34:50'),
(18, 'Kroketi od krompira', 3, '20 min', ' Aenean pretium nulla ex. Vivamus viverra elit viverra tincidunt lacinia. ', 'ras scelerisque augue sed lectus ultrices gravida. Suspendisse sodales, ante non vestibulum ullamcorper, sem elit congue lacus, in condimentum magna sapien quis urna. Vestibulum congue augue libero, id posuere velit eleifend id. In vel posuere libero. Cras suscipit ipsum eget metus maximus, eget convallis tellus efficitur. Nunc ut libero accumsan orci interdum semper. Etiam mollis tristique lectus at suscipit.\n\nMauris id tincidunt ur.', '2020-09-25 09:35:51'),
(19, 'dfaesgrd', 3, 'dsf', 'gfdgfh', 'adsfags', '2020-09-25 12:39:51'),
(20, 'adsfdg', 3, 'fdg', 'dgfhgj', 'dsfdg', '2020-09-25 13:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `recept_grupa`
--

DROP TABLE IF EXISTS `recept_grupa`;
CREATE TABLE IF NOT EXISTS `recept_grupa` (
  `id_recept` int(11) NOT NULL,
  `id_grupa` int(11) NOT NULL,
  PRIMARY KEY (`id_recept`,`id_grupa`),
  KEY `id_grupa_idx` (`id_grupa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recept_grupa`
--

INSERT INTO `recept_grupa` (`id_recept`, `id_grupa`) VALUES
(6, 1),
(10, 1),
(15, 1),
(4, 2),
(7, 2),
(9, 2),
(11, 2),
(12, 2),
(14, 2),
(15, 2),
(19, 2),
(20, 2),
(4, 3),
(7, 3),
(9, 3),
(11, 3),
(12, 3),
(14, 3),
(15, 3),
(5, 4),
(15, 4),
(18, 4),
(3, 5),
(13, 5),
(16, 5),
(17, 5),
(8, 6),
(16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `recept_sastojci`
--

DROP TABLE IF EXISTS `recept_sastojci`;
CREATE TABLE IF NOT EXISTS `recept_sastojci` (
  `id_recept` int(11) NOT NULL,
  `id_sastojak` int(11) NOT NULL,
  `kolicina` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_recept`,`id_sastojak`),
  KEY `id_sastojak_idx` (`id_sastojak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recept_sastojci`
--

INSERT INTO `recept_sastojci` (`id_recept`, `id_sastojak`, `kolicina`) VALUES
(3, 4, '500 gr'),
(3, 12, '250 ml'),
(3, 109, '100 ml'),
(3, 166, 'Kašičica'),
(3, 167, '200 gr'),
(4, 4, '200 gr'),
(4, 10, '200 gr'),
(4, 34, '1/2 kašičice'),
(4, 51, '1 glavica'),
(4, 117, 'Po ukusu'),
(4, 131, '250 gr'),
(4, 166, '1/2 kašičice'),
(4, 170, '100 gr'),
(5, 24, '1 kg'),
(5, 109, '4-5 kašika'),
(5, 166, 'Po ukusu'),
(6, 1, '2 '),
(6, 17, '100 gr'),
(6, 26, '100 gr'),
(6, 108, '2 kašike'),
(6, 186, '100 gr'),
(7, 79, '1'),
(7, 108, 'Kašika'),
(7, 169, '2 šnicle'),
(7, 199, '200 ml'),
(8, 2, '100 ml'),
(8, 78, '1/2'),
(8, 148, 'Nekoliko listova'),
(8, 201, '2 dc'),
(9, 16, '100 gr'),
(9, 97, '500 gr'),
(9, 131, '500 ml'),
(9, 173, '200 gr'),
(10, 1, '2 '),
(10, 34, 'Po ukusu'),
(10, 108, 'Kašika'),
(10, 124, 'Malo'),
(10, 166, 'Po ukusu'),
(10, 182, '100 gr'),
(11, 16, 'Malo'),
(11, 22, '100 ml'),
(11, 98, '300 gr'),
(11, 108, 'Kašika'),
(11, 165, '100 gr'),
(11, 174, '300 gr'),
(12, 34, 'Po ukusu'),
(12, 109, '2 kašike'),
(12, 115, 'Po ukusu'),
(12, 166, '2 kašike'),
(12, 172, '1 kg'),
(13, 3, '100 ml'),
(13, 4, '250 gr'),
(13, 62, '500 gr'),
(13, 93, '200 gr'),
(13, 167, '250 gr'),
(14, 15, '2 čena'),
(14, 44, '200 gr'),
(14, 51, '1 glavica'),
(14, 52, '150 gr'),
(14, 99, '200 gr'),
(14, 108, '2 kašike'),
(14, 129, '150 gr'),
(15, 33, '1 čen'),
(15, 34, 'Po ukusu'),
(15, 38, '1 glavica'),
(15, 44, '1 manja'),
(15, 52, '1/2'),
(15, 129, '1'),
(15, 166, 'Po ukusu'),
(16, 11, '100 gr'),
(16, 12, '200 ml'),
(16, 19, '50 ml'),
(16, 120, '1/4 kašičice'),
(17, 4, '200 gr'),
(17, 12, '50 ml'),
(17, 19, '100 ml'),
(17, 87, '100 gr'),
(17, 93, '250 gr'),
(17, 121, '2 kašičice'),
(17, 167, '300 gr'),
(17, 194, '1'),
(18, 24, '500 gr'),
(18, 115, '3 kašičice'),
(18, 136, '2 kašike'),
(18, 140, '100 gr'),
(19, 173, '200 gr'),
(20, 24, '200 gr');

-- --------------------------------------------------------

--
-- Table structure for table `recept_tip`
--

DROP TABLE IF EXISTS `recept_tip`;
CREATE TABLE IF NOT EXISTS `recept_tip` (
  `id_recept` int(11) NOT NULL,
  `id_tip` int(11) NOT NULL,
  PRIMARY KEY (`id_recept`,`id_tip`),
  KEY `id_tip_idx` (`id_tip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recept_tip`
--

INSERT INTO `recept_tip` (`id_recept`, `id_tip`) VALUES
(5, 1),
(8, 1),
(16, 1),
(4, 2),
(14, 2),
(19, 2),
(3, 3),
(5, 3),
(7, 3),
(13, 3),
(15, 3),
(18, 3),
(7, 4),
(10, 4),
(12, 4),
(4, 5),
(10, 5),
(12, 5),
(9, 6),
(15, 6),
(20, 6),
(9, 7),
(12, 7),
(15, 7),
(18, 7),
(6, 8),
(11, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sastojci`
--

DROP TABLE IF EXISTS `sastojci`;
CREATE TABLE IF NOT EXISTS `sastojci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(225) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sastojci`
--

INSERT INTO `sastojci` (`id`, `naziv`) VALUES
(1, 'Jaja'),
(2, 'Kisela voda'),
(3, 'Voda'),
(4, 'Pšenično brašno'),
(5, 'Integralno brašno'),
(6, 'Ovseno brašno'),
(7, 'Heljdino brašno'),
(8, 'Speltino brašno'),
(9, 'Ječmeno brašno'),
(10, 'Kukuruz'),
(11, 'Crna čokolada'),
(12, 'Mleko'),
(13, 'Mlečna čokolada'),
(14, 'Kačkavalj'),
(15, 'Beli sir'),
(16, 'Parmezan'),
(17, 'Feta sir'),
(18, 'Biljno mleko'),
(19, 'Slatka pavlaka'),
(20, 'Kisela pavlaka'),
(21, 'Kiselo mleko'),
(22, 'Pavlaka za kuvanje'),
(23, 'Boranija'),
(24, 'Krompir'),
(25, 'Grašak'),
(26, 'Spanać'),
(27, 'Slatki krompir - batat'),
(28, 'Hleb'),
(29, 'Integralni hleb'),
(30, 'Bezkvasni hleb'),
(31, 'Kvasac'),
(32, 'Artičoke'),
(33, 'Beli luk'),
(34, 'Biber'),
(35, 'Blitva'),
(36, 'Brokuli'),
(37, 'Đumbir'),
(38, 'Zelena salata '),
(39, 'Keleraba'),
(40, 'Kelj'),
(41, 'Krastavac'),
(42, 'Kupus'),
(43, 'Lubenica'),
(44, 'Paprika'),
(45, 'Pasulj'),
(46, 'Patlidžan'),
(47, 'Rotkvica'),
(48, 'Tikva'),
(49, 'Tikvica'),
(50, 'Celer'),
(51, 'Crni luk'),
(52, 'Šargarepa '),
(53, 'Špargle'),
(54, 'Avokado'),
(55, 'Ananas'),
(56, 'Aronija'),
(57, 'Badem'),
(58, 'Banana'),
(59, 'Breskva'),
(60, 'Borovnica'),
(61, 'Brusnica'),
(62, 'Višnja'),
(63, 'Glog'),
(64, 'Grožđe'),
(65, 'Grejpfrut'),
(66, 'Dud'),
(67, 'Dunja'),
(68, 'Jagode'),
(69, 'Jabuke'),
(70, 'Kajsije'),
(71, 'Kruške'),
(72, 'Kupine'),
(73, 'Kokos'),
(74, 'Kikiriki'),
(75, 'Kivi'),
(76, 'Kesten'),
(77, 'Lešnik'),
(78, 'Limeta'),
(79, 'Limun'),
(80, 'Maline'),
(81, 'Mandarine'),
(82, 'Mango'),
(83, 'Masline'),
(84, 'Nar'),
(85, 'Pomorandže - narandže'),
(86, 'Nektarine'),
(87, 'Orasi'),
(88, 'Pisaći'),
(89, 'Rogač'),
(90, 'Smokve'),
(91, 'Crne ribizle'),
(92, 'Šljive'),
(93, 'Puter'),
(94, 'Margarin'),
(95, 'Makarone'),
(96, 'Špagete'),
(97, 'Njoke'),
(98, 'Pasta'),
(99, 'Pirinač'),
(100, 'Integralni pirinač'),
(101, 'Divlji pirinač'),
(102, 'Sojine ljuspice'),
(103, 'Sojine šnicle'),
(104, 'Soja'),
(105, 'Suncokret'),
(106, 'Bundevine semenke'),
(107, 'Golica'),
(108, 'Maslinovo ulje'),
(109, 'Ulje'),
(110, 'Bundevino ulje'),
(111, 'Avokado ulje'),
(112, 'Crno vino'),
(113, 'Belo vino'),
(114, 'Mirođija'),
(115, 'Aleva paprika'),
(116, 'Tucana paprika'),
(117, 'Ljuta papričica'),
(118, 'Ruzmarin'),
(119, 'Kurkuma'),
(120, 'Cimet'),
(121, 'Vanila'),
(122, 'Kakao'),
(123, 'Vlašac'),
(124, 'Peršun'),
(125, 'Zelen za supu'),
(126, 'Paškanat'),
(127, 'Celer'),
(128, 'Vegeta'),
(129, 'Paradajz'),
(130, 'Čeri paradajz'),
(131, 'Kuvani paradajz'),
(132, 'Kečap'),
(133, 'Majonez'),
(134, 'Senf'),
(135, 'Sok od paradajza'),
(136, 'Prezle'),
(137, 'Bosiljak'),
(138, 'Crne masline'),
(139, 'Zelene masline'),
(140, 'Čedar sir'),
(141, 'Gauda'),
(142, 'Edamer'),
(143, 'Ementaler'),
(144, 'Kamamber '),
(145, 'Gorgonzola '),
(146, 'Mocarela '),
(147, 'Med'),
(148, 'Nana'),
(149, 'Kamilica'),
(150, 'Hibiskus'),
(151, 'Žalfija'),
(152, 'Zeleni čaj'),
(153, 'Crni čaj'),
(154, 'Čaj'),
(155, 'Suve smokve'),
(156, 'Suve šljive'),
(157, 'Suvo grožđe'),
(158, 'Suve kajsije'),
(159, 'Suvo voće'),
(160, 'Džem od kajsije'),
(161, 'Džem od jagode'),
(162, 'Džem od breskve'),
(163, 'Džem'),
(164, 'Kukuruzno brašno'),
(165, 'Pesto sos'),
(166, 'So'),
(167, 'Šećer'),
(168, 'Žuti šećer'),
(169, 'Losos'),
(170, 'Svinjetina'),
(171, 'Teletina'),
(172, 'Jagnjetina'),
(173, 'Piletina'),
(174, 'Pileći batak'),
(175, 'Pileća krilca'),
(176, 'Svinjski vrat'),
(177, 'Svinjska rebra'),
(178, 'Ćuretina'),
(179, 'Ćureća krilca'),
(180, 'Ćureći bataci'),
(181, 'Belo meso'),
(182, 'Šunka'),
(183, 'Podloga za picu'),
(184, 'Kore za pitu'),
(185, 'Pašteta'),
(186, 'Pečenica'),
(187, 'Slanina'),
(188, 'Kulen'),
(189, 'Kobasice'),
(190, 'Salama'),
(191, 'Parizer'),
(192, 'Sušeno meso'),
(193, 'Sušena rabarca'),
(194, 'Puding od vanile'),
(195, 'Puding od čokolade'),
(196, 'Puding od karamele'),
(197, 'Puding'),
(198, 'Jogurt'),
(199, 'Grčki jogurt'),
(200, 'Votka'),
(201, 'Rum'),
(202, 'Amareto'),
(203, 'Plazma keks'),
(204, 'Mleveni keks'),
(205, 'Griz'),
(206, 'Sok od limuna'),
(207, 'Sok od narandže'),
(208, 'Žumance'),
(209, 'Belance'),
(210, 'Šećer u prahu'),
(211, 'Vanil šećer'),
(212, 'Šlag');

-- --------------------------------------------------------

--
-- Table structure for table `slika`
--

DROP TABLE IF EXISTS `slika`;
CREATE TABLE IF NOT EXISTS `slika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_recept` int(11) NOT NULL,
  `slika` varchar(225) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_recept_slika_idx` (`id_recept`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `slika`
--

INSERT INTO `slika` (`id`, `id_recept`, `slika`) VALUES
(1, 3, '/uploads/283b5720-fefd-11ea-a07d-95ca04883041_mafini.jpg'),
(2, 4, '/uploads/e77c85a0-fefd-11ea-82a0-5b36a36d8c79_burito.jpg'),
(3, 5, '/uploads/1b1969a0-fefe-11ea-82a0-5b36a36d8c79_cips.jpg'),
(4, 6, '/uploads/8862b520-fefe-11ea-b5e5-af02d2b863f5_jaja.jpg'),
(5, 7, '/uploads/aa1ca120-feff-11ea-a461-337d8542316f_losos.jpeg'),
(6, 8, '/uploads/dea17420-feff-11ea-a461-337d8542316f_mohito.jpg'),
(7, 9, '/uploads/03466790-ff00-11ea-a461-337d8542316f_njoke.jpg'),
(8, 10, '/uploads/3272f920-ff00-11ea-a461-337d8542316f_omlet.jpg'),
(9, 11, '/uploads/721c94a0-ff00-11ea-a461-337d8542316f_pasta.jpg'),
(10, 12, '/uploads/9da91c10-ff00-11ea-a461-337d8542316f_pecenje.jpg'),
(11, 13, '/uploads/da359910-ff00-11ea-a461-337d8542316f_pita.jpeg'),
(12, 14, '/uploads/0e00e010-ff01-11ea-a461-337d8542316f_rizoto.jpg'),
(13, 15, '/uploads/41744310-ff01-11ea-a461-337d8542316f_salata.jpg'),
(14, 16, '/uploads/67128aa0-ff01-11ea-a461-337d8542316f_topla_cokolada.jpg'),
(15, 17, '/uploads/9b393810-ff01-11ea-a461-337d8542316f_torta.jpg'),
(16, 18, '/uploads/bf3abf90-ff01-11ea-a461-337d8542316f_uzina.jpg'),
(17, 19, '/uploads/73ecf390-ff1b-11ea-836e-19cbbfddd30c_uzina.jpg'),
(18, 20, '/uploads/e6742110-ff23-11ea-a763-5fb0fff2d1d2_pita.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tip_jela`
--

DROP TABLE IF EXISTS `tip_jela`;
CREATE TABLE IF NOT EXISTS `tip_jela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tip_jela`
--

INSERT INTO `tip_jela` (`id`, `naziv`) VALUES
(1, 'Veganski'),
(2, 'Vegetarijanski'),
(3, 'Posno'),
(4, 'Keto'),
(5, 'Hrono'),
(6, 'Bez mleka'),
(7, 'Gluten free'),
(8, 'Dijetalno');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`autor`) REFERENCES `korisnici` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recept_grupa`
--
ALTER TABLE `recept_grupa`
  ADD CONSTRAINT `id_grupa` FOREIGN KEY (`id_grupa`) REFERENCES `grupa_jela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_recept_grupa` FOREIGN KEY (`id_recept`) REFERENCES `recept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recept_sastojci`
--
ALTER TABLE `recept_sastojci`
  ADD CONSTRAINT `id_recept` FOREIGN KEY (`id_recept`) REFERENCES `recept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_sastojak` FOREIGN KEY (`id_sastojak`) REFERENCES `sastojci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recept_tip`
--
ALTER TABLE `recept_tip`
  ADD CONSTRAINT `id_recept_tip` FOREIGN KEY (`id_recept`) REFERENCES `recept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_tip` FOREIGN KEY (`id_tip`) REFERENCES `tip_jela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slika`
--
ALTER TABLE `slika`
  ADD CONSTRAINT `id_recept_slika` FOREIGN KEY (`id_recept`) REFERENCES `recept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

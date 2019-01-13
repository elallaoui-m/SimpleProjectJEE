-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2019 at 09:59 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL,
  `date_blog` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `id_etudiant` int(11) DEFAULT NULL,
  `titre` text,
  `intro` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id_blog`, `date_blog`, `description`, `id_etudiant`, `titre`, `intro`) VALUES
(2, '2019-01-06 00:59:10', 'SAN FRANCISCO — A common belief among tech industry insiders is that Silicon Valley has dominated the internet because much of the worldwide network was designed and built by Americans.\r\n\r\nNow a growing number of those insiders are worried that proposed export restrictions could short-circuit the pre-eminence of American companies in the next big thing to hit their industry, artificial intelligence.\r\n\r\nIn November, the Commerce Department released a list of technologies, including artificial intelligence, that are under consideration for new export rules because of their importance to national security.\r\n\r\nTechnology experts worry that blocking the export of A.I. to other countries, or tying it up in red tape, will help A.I. industries flourish in those nations — China, in particular — and compete with American companies.\r\n\r\n“The number of cases where exports can be sufficiently controlled are very, very, very small, and the chance of making an error is quite large,” said Jack Clark, head of policy at OpenAI, an artificial intelligence lab in San Francisco. “If this goes wrong, it could do real damage to the A.I. community.”\r\n\r\nThe export controls are being considered as the United States and China engage in a trade war. The Trump administration has been critical of the way China negotiates deals with American companies, often requiring the transfer of technology to Chinese partners as the cost of doing business in the country. And federal officials are making an aggressive argument that China has stolen American technology through hacking and industrial espionage.', 4, 'Curbs on A.I. Exports? Silicon Valley Fears Losing Its Edge', 'The Commerce Department is considering national security restrictions on artificial intelligence. Some worry they could stunt the industry in the U.S.'),
(8, '2019-01-13 00:00:00', 'this is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\nthis is just a blog\r\n', 27, 'elmehdi', 'this is just a blog'),
(9, '2019-01-13 00:00:00', 'blog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\nblog title\r\n', 3, 'blog title', 'this is a blog');

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `comm` text NOT NULL,
  `upvotes` int(11) NOT NULL DEFAULT '0',
  `date_comm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_blog` int(11) DEFAULT NULL,
  `id_etudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `comm`, `upvotes`, `date_comm`, `id_blog`, `id_etudiant`) VALUES
(2, 'comments', 0, '2019-01-07 12:41:54', 2, 3),
(4, 'that was amazing', 0, '2019-01-13 18:50:05', 2, 27);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_msg` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_msg`, `name`, `email`, `msg`) VALUES
(1, 'elmehdi', 'anwarsami1998@gmail.com', 'this is a msg for u'),
(2, 'l3erbi', 'elmehdi.elallaoui@edu.uiz.ac.ma', 'awdi had sedha dialkom kaiba bazaf bazaf '),
(3, 'estsaraha', 'admin@ad.com', 'qwertyu,jmhgjhggff'),
(4, 'estsaraha', 'admin@ad.com', 'qwedfhdhjfjfjfghj'),
(5, 'estsaraha', 'admin@ad.com', 'qweqweqweqwe'),
(6, 'estsaraha', 'saraha.est@gmail.com', 'wiqo is my name '),
(7, 'sdfsdf', 'admin@ad.com', 'dsfuglkjdsflnsdg\'lor'),
(8, 'sdfsdf', 'admin@ad.com', 'dsfuglkjdsflnsdg\'lor');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id_like` int(11) NOT NULL,
  `id_blog` int(11) DEFAULT NULL,
  `id_commentaire` int(11) DEFAULT NULL,
  `id_etudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_etudiant` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `date_n` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(20) DEFAULT NULL,
  `type` enum('admin','user') NOT NULL,
  `verify` enum('yes','no','yesG') NOT NULL DEFAULT 'no',
  `motdepass` varchar(100) NOT NULL,
  `gender` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id_etudiant`, `nom`, `prenom`, `date_n`, `email`, `token`, `type`, `verify`, `motdepass`, `gender`) VALUES
(3, 'elallaoui', 'elmehdi', '1998-05-15', 'admin@ad.com', NULL, 'admin', 'yes', 'wiqo_1234', 'male'),
(4, 'EL ALLAOUI', 'El mehdi', NULL, 'anwarsami1998@gmail.com', NULL, 'user', 'yes', '101493709739540529903', 'male'),
(27, 'elmehdi', 'elallaoui', '1998-05-17', 'elallaoui.elmehdi@gmail.com', '', 'user', 'yes', 'wiqo_1234', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `id_blog` (`id_blog`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_msg`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `fk_blog` (`id_blog`),
  ADD KEY `fk_commentaire` (`id_commentaire`),
  ADD KEY `fk_utilisateur` (`id_etudiant`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateur` (`id_etudiant`);

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id_blog`),
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateur` (`id_etudiant`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_blog` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id_blog`),
  ADD CONSTRAINT `fk_commentaire` FOREIGN KEY (`id_commentaire`) REFERENCES `commentaire` (`id_commentaire`),
  ADD CONSTRAINT `fk_utilisateur` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateur` (`id_etudiant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

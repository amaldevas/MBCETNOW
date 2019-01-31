-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2019 at 05:30 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpost`
--

CREATE TABLE `bpost` (
  `id` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL,
  `head` text NOT NULL,
  `cnt` text NOT NULL,
  `date` datetime NOT NULL,
  `view` bigint(20) NOT NULL DEFAULT '0',
  `catId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpost`
--

INSERT INTO `bpost` (`id`, `user`, `head`, `cnt`, `date`, `view`, `catId`) VALUES
(3, 10001, 'COMMUNITY EXTENSION PROGRAM', 'The 30 students were divided into four groups.\r\nACTIVITY 1– FUN GAME (CUP STACKING)\r\nOne member from each group was called to play the game. The game was to stack paper cups in such a way that base would have seven cups and the layer above it has six and so on. The first player to place the last cup on top without tipping over the other cups won the game. The winners were given chocolates as prize.\r\n\r\nACTIVITY 2 – GROUP TASK (CHIEF MINISTER)\r\nThe students were asked to list out the new reforms and changes that they would implement if they were the chief minister. They were also asked to list out solutions to the problems they face in their locality.\r\nThis activity was done to make the students aware of the problems in their locality.\r\n\r\nACTIVITY 3– VIDEO SESSION\r\nVideos were shown to the students showing them the importance of a teacher in a student’s life. They also gave a message on respecting elders and teachers. They showed the students the value of education.\r\n\r\nACTIVITY 4– DREAM TREE\r\nEach of the students was given a chart paper and was asked to draw their dream tree. \r\nThe tree consists of the top leaves with fruits in which they wrote their ambitions. The root where they wrote what they need to achieve their ambition and finally the stem with the ones who support them now to achieve their goals.\r\n\r\nFEEDBACK\r\nCommunity Students \r\nThe students gave a good feedback. They wanted to spend more time with us. They wanted more activities. \r\nThe main request they had was for them to visit our college. They are so eager to see our college. They are also very interested to spend more time with us with more such activities. \r\n\r\nStudent Volunteers\r\nThe students were very enthusiastic and also cooperative with all the activities. The program was well organised and planned by the senior coordinators. The M.tech students taught the children about the basic soft skills like cleanliness and respecting elders. Overall it was an excellent program. The teachers were a great support without which this program would not have been a success.\r\n', '2018-11-11 04:42:37', 41, NULL),
(30002, 10001, 'Baselian Computing Workshop-2017', 'The  Department of Computer Science & Engineering organized a two day workshop, ‘Baselian Computing Workshop’ (BCW 2017) on 12th and 13th of October, 2017. BCW 2017 was an intensive two-day workshop for 50 intellectually curious and motivated high-school students, from different Government Schools in and around Trivandrum city. The goal of the workshop was to encourage the computing skills, especially their logical thoughts. This will help students to channelize their creative and logical abilities to become better, more ethical and highly insightful professionals. BCW2017 endeavors to provide a lively, supportive and interactive environment, where students can stretch their talents, discover new strengths, and challenge themselves in the company of peers. As part of this session, the students were familiarized with the basics of Operating System, Algorithm & Programming, Networks &Network Security.\r\n\r\nCommunity extension activities\r\nCommunity Extension Activities\r\n•	SPARSHAM\r\nSocial Extension Programme of Department of Computer Science and Engineering ‘SPARSHAM’ is conducted on 24th February 2018 in college campus. Students organized various recreation activities for a group of 7th, 8th and 9th standard students from Poonthura. Activities also include CPU Assembly and Augmentated Reality which brings a great curiosity in the young minds for knowing future technologies. SPARSHAM helps both students and faculty members to come out of the box and spend their time and effort to engage those students. More than 20 students participated in the programme.\r\n•	As part of Community Extension Programme in association with World Vision a team of faculties and students from the department visited “Poonthura” housing colony, September 2017 and conducted various events to motivate the students.. The visit was mainly indented to get a first- hand knowledge of the educational facilities available to children living there. The visits and discussions with the parents, social service volunteers and children were facilitated by the representatives of the N.G.O.: “World Vision” \r\n\r\n\r\n\r\nAs part of Community Extension Programme in association with World Vision a team of faculties and students from the department visited “Poonthura” housing colony, September 2017 and conducted various events to motivate the students.. The visit was mainly indented to get a first- hand knowledge of the educational facilities available to children living there. The visits and discussions with the parents, social service volunteers and children were facilitated by the representatives of the N.G.O.: “World Vision” \r\n\r\n\r\n\r\n\r\n\r\nAccolades won by students:\r\nARVIND S PANICKER, ARFAN A, ARUN SANKAR, AKHIL J P and AMAL VIJAYAN of S8CS1 got fourth position and selected for the IATA NDC Hackathon in Kochi.\r\nVishnu and Mahesh Markose of S8CS2 secured second position in debugging event on Drishti 2018 held at College of Engineering, Trivandrum.\r\nAchu Vinod Thomas, Adeline Anne Mathew, Aleena Rachel Varghese, Greshma Liz George,Gincy George and Golda Mary Varghese (S8CS1) won second prize in Kerala University Netball Tournament held at MBCET.\r\nAlan Davis Babu and Ashish A John won first prize in All India Netball Tournament held at MBCET.\r\nAlan Davis Babu, Ashish A John and Athul Krishnan won second prize in Kerala University Basketball Tournament held at MBCET.\r\nAlan Davis Babu, Abhishek Krishnan, Ashish A John and Mahesh Markose won second prize in Kerala University Netball Tournament held at MBCET.\r\nAlan Davis Babu and Greshma Santhosh got selected to the National netball team.\r\nAtheena J P, Divya B M,Anu V P,Archana S G and Ashna Anne Philip won second prize in Kerala University Inter collegiate chess tournament on December 2017.\r\nAmith Hari, Neeraj Nair, Githin Thomas George,Aparna K 2 Mekha Nair C.A , Roshni Susan Regi participated and got prizes inAPJ AKTU All Kerala Inter-Zone Netball Men and Women Championship, February 2018.\r\n\r\n\r\n\r\n\r\n\r\n?	Arun Krishna, Anita Acha George, Toney Dias, Asheena Varghese received “Special Jury Award” in the 6th CSI InAPP National Student Project Awards 2017 for the project titled ”GOLDEN AID-An Emergency Ambulance System” under the guidance of Ms.Divya R S.\r\n?	Nibin peter, akhil A, Akhil R and Satyajith S L has secured “Best Project Award” for the project titled “Secure IOT protocol” in the B-Tech Project Exhibition at MBCET,TECXPO’17 under the guidance of Ms.Gayathri K S.\r\n?	Greshma Liz George (S7CS1) won first prize in Kerala University Netball Tournament held at MBCET.\r\nAmal Vijayan(S7CS1) and team won first prize in Kolkali for Merlin (S5CS2) participated in Kerala University Basketball Tournament held at MBCET.\r\n', '2018-11-11 05:40:02', 4, NULL),
(30003, 10001, 'HASH 2018', 'The HASH 2018, is the first ever technical fest conducted by the department of Computer Science. Hash was a pure mix of all technical events. The event started with the formal inaugural function on9 March,2018 by Mr.Pramod Potti Krishnan,Associate director at E &Y.\r\n\r\nAs part of the fest numerous online and offline technical events, workshops and talks for both college as well as school students took place at our college premises with the sharpest minds in town presenting the most advanced technologies. A variety of general technical events like Top coder,Blackbox,Codiva,Code porting,Syncode,Techhunter etc were conducted .These were events that tests the logical thinking and programming skills of participating teams.\r\n\r\nAs part of HASH , for the first time a 22-hour #Hackathon was conducted by the college in association with Startup mission and  Curvelogics  at B\'Hub.The theme of Hackathon for this year was \"Healthcare and Social Welfare\".Seventeen teams from across the state attended the Hackathon.The students from college of engineering trivandrum  bagged the first prize at Hash hackathon 2018, for finding a smart solution to the city’s waste management problem.They received a cash prize of Rs.25000.\r\n\r\n An IoT Home Automation Workshop was handled by  professionals from Robokart. The workshop gave insights about interfacing and controlling home appliances with micro controller and relay board. The participants learned more about android app development in this workshop. ATalk on Internet Security was delivered by Sreenath Sasikumar founder   and CEO of Mashup Academy  .Another  Talk on \"Are we living in a computer simulation?\"  was delivered by Alok  Rajasukumaran from Kerala Microsoft Users\' Group. A workshop on WebApp using Firebase was handled by professionals from google developers .\r\n\r\nApart from all the technical events HASH also included a \'Stories Worth Sharing\' session which is a Pan India initiative spread across various cities over India.\r\n', '2018-11-11 05:46:15', 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `date`) VALUES
(1, 'Workshops', '2019-01-17 10:32:43'),
(2, 'AI Club', '2019-01-17 10:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `cnt` text NOT NULL,
  `bpostId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `designation` text NOT NULL,
  `qualification` text NOT NULL,
  `date` datetime NOT NULL,
  `userId` bigint(20) NOT NULL,
  `area` text NOT NULL,
  `image` varchar(1000) NOT NULL DEFAULT 'pro.jpg',
  `email` text NOT NULL,
  `phoneno` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `designation`, `qualification`, `date`, `userId`, `area`, `image`, `email`, `phoneno`) VALUES
(60017, 'Dr. Tessy Mathew', 'Associate Professor & Head Of The Department Computer Science', 'M.Tech, Ph. D', '2018-11-11 17:42:04', 10001, 'Neural Network\r\n\r\nDatabase Design\r\n\r\nData mining\r\n\r\nMachine Learning\r\n\r\nCellular Automata ', 'TESSY_MATHEW.JPG', 'tessy.mathew@mbcet.ac.in', '94476 96899'),
(60018, 'Dr. R. Vikraman Nair', 'Professor ', 'B.Sc. (Engg), DEA, Ph.D. ', '2018-11-11 20:06:21', 10001, '.', 'VIKRAMAN_NAIR_.JPG', 'hodcs@mbcet.org', '94460 44204'),
(60019, 'Prof. Raju K Gopal', 'Professor', 'B.Sc(Engg), M.Tech, MISTE, MIEEE', '2018-11-11 20:08:26', 10001, 'Next Generation Networks and Protocol Architecture\r\n\r\nCyber Security\r\n\r\nComputer Vision\r\n\r\nMobile & Wearable Computing ', 'RAJU_GOPAL_.JPG', 'raju.gopal@mbcet.ac.in', '80894 11498'),
(60020, 'Ms. S. Asha', 'Assistant Professor ', 'M.E', '2018-11-11 20:10:23', 10001, 'Computer Networks\r\nAd-hoc Networks\r\nMobile communication\r\nComputer Organization\r\nWireless Networks', 'ASHA_S.JPG', 'asha.s@mbcet.ac.in', '94477 41066'),
(60021, 'Ms. Elizabeth B. Varghese', 'Assistant Professor ', 'M.Tech (on Leave)', '2018-11-11 20:13:22', 10001, 'Image Processing \r\nComputer Networks\r\nCryptography', 'ELIZABETH_BV_.JPG', 'elizabeth.b@mbcet.ac.in', '99952 76967'),
(60022, 'Ms. K. S. Sunitha Krishnan', 'Assistant Professor', 'M.Tech (on Leave)', '2018-11-11 20:14:44', 10001, 'Datamining\r\n\r\nCompiler Design\r\n\r\nSystem Programming\r\n\r\nSoftware Engineering ', 'SUNITHA_KRISHNAN.JPG', 'sunithakrishnan.ks@mbcet.ac.in', '.'),
(60023, 'Mr. G. L. Praveen', 'Assistant Professor ', 'M.Tech', '2018-11-11 20:15:57', 10001, 'Data Structures and Algorithms\r\n\r\nFormal Language & Automata Theory\r\n\r\nCompiler Design', 'PRAVEEN_GL_.JPG', 'praveen.gl@mbcet.ac.in', '.'),
(60024, 'Mr. V. S. Shibu', 'Assistant Professor', 'M.Tech', '2018-11-11 20:17:45', 10001, 'Computer Networks\r\n\r\nDigital Image Processing\r\n\r\nFinite Automata\r\n\r\nOperating System\r\n\r\nData Structures ', 'SHIBU_VS_.JPG', 'shibu.vs@mbcet.ac.in', '99613 30770'),
(60025, 'Ms. V. S. Devipriya', 'Assistant Professor', 'M.Tech', '2018-11-11 20:19:23', 10001, 'Computer Networks, Cloud Computing, Cryptography', 'DEVIPRIYA_VS_.JPG', 'devipriya.vs@mbcet.ac.in', '96053 92619'),
(60026, 'Mr. Sandeep S R', 'Assistant Professor', 'M.Tech', '2018-11-11 20:21:36', 10001, 'Distributed Systems\r\nSoftware Engineering\r\nCryptography', 'SANDEEP_SR_.JPG', 'sandeep.sr@mbcet.ac.in', '86068 06402'),
(60027, 'Ms. Anne Dickson', 'Assistant Professor', 'M.Tech (Pursuing Ph. D)', '2018-11-11 20:23:37', 10001, ' Area of interest\r\nArtificial Neural Network\r\n\r\nDigital Image Processing\r\n\r\nInteractive Computer Graphics\r\n\r\nArtificial Neural Network. ', 'ANNE_DICKSON.JPG', 'anne.dickson@mbcet.ac.in', '94961 95706'),
(60028, 'Ms. Poorna B.R', 'Assistant Professor ', 'M.E ', '2018-11-11 20:24:58', 10001, 'Computer Networks\r\n E-Security', 'POORNA_BR_.JPG', 'poorna.br@mbcet.ac.in', '.'),
(60029, 'Ms. Divya R. S', 'Assistant Professor ', 'M.Tech ', '2018-11-11 20:27:03', 10001, 'Networking\r\nWeb Designing', 'DIVYA_RS_.JPG', 'divya.rs@mbcet.ac.in', ''),
(60030, 'Dr. Vishnukumar S', 'Assistant Professor', 'M.Tech, Ph. D', '2018-11-11 20:29:38', 10001, 'Digital Image Processing\r\nFuzzy Logic\r\nNeural Networks', 'Vishnu_photo.jpg', 'vishnu.s@mbcet.ac.in', '94973 59253'),
(60031, 'Dr. Jisha John', 'Assistant Professor', 'M.Tech, Ph. D', '2018-11-11 20:31:30', 10001, 'Image Processing', 'JISHA_JOHN_.JPG', 'jisha.john@mbcet.ac.in', '98954 93468'),
(60032, 'Mr. Shon J Das', 'Assistant Professor ', 'M.Tech', '2018-11-11 20:37:35', 10001, 'Computer Networks\r\nCryptography', 'SHON_DAS_.JPG', 'shon.das@mbcet.ac.in', '.'),
(60033, 'Ms. Merin Kuriakose', 'Assistant Professor', 'M.Tech', '2018-11-11 20:38:58', 10001, 'Networking\r\nObject Oriented Techniques ', 'MERIN_KURIAKOSE.JPG', 'merin.kuriakose@mbcet.ac.in', '98475 83752'),
(60034, 'Ms. Anjali C', 'Assistant Professor', 'M.Tech (Pursuing Ph. D)', '2018-11-11 20:40:07', 10001, 'Machine Learining\r\n\r\nBioinformatics\r\n\r\nSoftware Engineering\r\n\r\nArtificial Intelligence ', 'Passport--2.jpg', 'anjali.c@mbcet.ac.in', '.'),
(60035, 'Mr. Robin Joseph', 'Assistant Professor', 'M.Tech ', '2018-11-11 20:42:44', 10001, 'Data Structures\r\nImage Processing', 'ROBIN_JOSEPH.JPG', 'robin.joseph@mbcet.ac.in', '.'),
(60036, 'Ms. Aswathy Ravikumar', 'Assistant Professor ', 'M.Tech', '2018-11-11 20:43:47', 10001, 'Machine Learning', 'ASWATHY_RAVIKUMAR.JPG', 'aswathy.ravikumar@mbcet.ac.in', '.'),
(60037, 'Ms. Gayathri K. S', 'Assistant Professor', 'M.Tech ', '2018-11-11 20:45:11', 10001, 'Computer Networks\r\n\r\nNetwork Security\r\n\r\nWatermarking\r\n\r\nDatamining ', 'G.JPG', 'gayathri.ks@mbcet.ac.in', '94976 92467'),
(60038, 'Mr. Binu Jose A.', 'Assistant Professor', 'M.E ', '2018-11-11 20:47:15', 10001, '.', 'BINU_JOSE_.JPG', 'binu.jose@mbcet.ac.in', '94479 28919'),
(60039, 'Ms. Jisha Jose', 'Assistant Professor ', 'M.E ', '2018-11-11 20:49:10', 10001, '.', 'JISHA_JOSE_.JPG', 'jisha.jose@mbcet.ac.in', '94007 94614'),
(60040, 'Ms. Shini Renjith', 'Asst. Professor ', 'M.Tech (Pursuing Ph. D) ', '2018-11-11 20:52:27', 10001, '.', 'Shini.jpg', '.', '.'),
(60041, 'Ms. Kiran Baby', 'Assistant Professor ', 'M.Tech ', '2018-11-11 20:56:32', 10001, '.', 'Kiran.jpg', 'kiran.baby@mbcet.ac.in', '98954 93149'),
(60042, 'Mr. Ramjith', 'Assistant Professor ', 'M.Tech ', '2018-11-11 20:58:33', 10001, 'Data structures & algorithms Wireless sensor networks ', 'photo-ram.jpg', 'ramjith.rp@mbcet.ac.in', '.'),
(60043, 'Ms. Jayalekshmi J', 'Assistant Professor ', 'M.Tech ', '2018-11-11 21:02:05', 10001, '.', 'default_avatar.png', 'jayalekshmi.j@mbcet.ac.in', '.'),
(60044, 'Ms. Jesna Mohan', 'Assistant Professor ', 'M.Tech (Pursuing Ph D) ', '2018-11-11 21:03:31', 10001, '.', 'default_avatar1.png', 'jesna.mohan@mbcet.ac.in', '.'),
(60045, 'Ms. Meera Mathew', 'Assistant Professor ', 'M.Tech ', '2018-11-11 21:05:01', 10001, '.', 'default_avatar2.png', '\r\nmeera.mathew@mbcet.ac.in ', '.');

-- --------------------------------------------------------

--
-- Table structure for table `mediapost`
--

CREATE TABLE `mediapost` (
  `id` bigint(20) NOT NULL,
  `bpostId` bigint(20) NOT NULL,
  `fname` text NOT NULL,
  `frmt` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mediapost`
--

INSERT INTO `mediapost` (`id`, `bpostId`, `fname`, `frmt`, `date`) VALUES
(1, 3, '12.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(2, 3, '2.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(3, 3, '3.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(4, 3, '4.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(5, 3, '5.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(6, 3, '6.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(7, 3, '7.jpg', 'image/jpeg', '2018-11-11 04:42:37'),
(40000, 30002, 'bw1.jpg', 'image/jpeg', '2018-11-11 05:40:02'),
(40001, 30003, 'hash.jpg', 'image/jpeg', '2018-11-11 05:46:15'),
(40002, 30004, 'hash1.jpg', 'image/jpeg', '2018-11-11 05:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL,
  `cnfrm` varchar(100) DEFAULT 'NO',
  `type` varchar(100) NOT NULL DEFAULT 'cmnt',
  `password` text NOT NULL,
  `rst` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `date`, `cnfrm`, `type`, `password`, `rst`) VALUES
(10001, 'Admin', 'amaldevastvm@gmail.com', '2018-11-09 23:37:23', 'YES', 'admin', 'amal', NULL),
(10002, 'Abhishek', 'abhisheksr4117@gmail.com', '2018-11-17 15:48:36', 'YES', 'post', 'abhi', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bpost`
--
ALTER TABLE `bpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediapost`
--
ALTER TABLE `mediapost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bpost`
--
ALTER TABLE `bpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30004;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60046;

--
-- AUTO_INCREMENT for table `mediapost`
--
ALTER TABLE `mediapost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40003;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2022 at 04:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `jalan` text NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kode_kabupaten` int(11) UNSIGNED NOT NULL,
  `kode_provinsi` int(11) UNSIGNED NOT NULL,
  `kode_pos` int(11) UNSIGNED NOT NULL,
  `flags` bit(1) NOT NULL DEFAULT b'1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'administrator'),
(2, 'member', 'member user'),
(3, 'user', 'reguler user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cancel_orders`
--

CREATE TABLE `cancel_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product` varchar(100) NOT NULL,
  `color` varchar(15) NOT NULL,
  `size` varchar(5) NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL,
  `flags` bit(1) NOT NULL DEFAULT b'0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Aksesoris', 'aksesoris', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(2, 'Jaket', 'jaket', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(3, 'Celana', 'celana', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(4, 'Kaos', 'kaos', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(5, 'Kemeja', 'kemeja', '2022-06-13 09:45:46', '2022-06-13 09:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `courier` varchar(10) NOT NULL,
  `shipping_type` varchar(100) NOT NULL,
  `estimate_date` varchar(20) NOT NULL,
  `cost` int(10) UNSIGNED NOT NULL,
  `total` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `resi_number` varchar(100) NOT NULL,
  `jalan` text NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kode_pos` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'black', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(2, 'navy', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(3, 'blue', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(4, 'darkgreen', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(5, 'green', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(6, 'teal', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(7, 'deepskyblue', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(8, 'lime', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(9, 'indigo', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(10, 'maroon', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(11, 'purple', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(12, 'gray', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(13, 'grey', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(14, 'darkred', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(15, 'brown', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(16, 'salmon', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(17, 'red', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(18, 'deeppink', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(19, 'orangered', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(20, 'hotpink', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(21, 'orange', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(22, 'lightpink', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(23, 'pink', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(24, 'gold', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(25, 'yellow', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(26, 'white', '2022-06-13 09:45:46', '2022-06-13 09:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `confirms`
--

CREATE TABLE `confirms` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `image_transfer` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'event.jpg',
  `published` bit(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `detail`, `image`, `published`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Ut facere aut.', 'ut-facere-aut.', 'Laborum qui in pariatur aut. Aliquid dolor quam porro voluptatem vero doloribus dolor amet. Voluptas ad qui aperiam quis dolores. Laudantium et itaque necessitatibus at quaerat inventore.\n\nAnimi veritatis quas harum. Doloribus repellendus ut quisquam ut repellat non velit facere. Dolores consequuntur velit officiis et facilis. Voluptatem itaque velit distinctio reprehenderit earum omnis quis illo.\n\nDolores repudiandae saepe eum quis quaerat adipisci eum. Et ipsam illo quo qui consequatur.\n\nAlias tempora deserunt culpa quia laboriosam. Impedit rerum corporis saepe asperiores et. Ut accusantium amet enim expedita mollitia nostrum esse.\n\nTemporibus distinctio at velit dicta harum aut beatae possimus. Voluptatem ut voluptates temporibus itaque iste. Quasi nam sint corrupti facere occaecati pariatur cum qui.\n\nAnimi facilis dignissimos nemo at in. Non quidem eligendi suscipit et. Alias eveniet laborum eaque temporibus expedita.\n\nVoluptate voluptatibus recusandae quod sint. Qui aut ipsa et quaerat laudantium omnis voluptates molestiae. Sed repudiandae error vel est hic rerum inventore perspiciatis. Eum consequuntur est qui quo est.\n\nDolor itaque aut dolor perferendis quidem unde. Quia temporibus ipsa blanditiis eos ipsam. Praesentium autem ut distinctio quas ab. Incidunt quam et incidunt nam voluptatem illum.\n\nRepellendus itaque ut quidem vitae fugit nobis. Cupiditate soluta voluptatem qui impedit. In quia officiis occaecati non quas quibusdam magnam et.\n\nEst sunt necessitatibus aut enim nihil autem. Non incidunt soluta minus perferendis fugiat sint cum. Et est ut voluptate error ex ab id.', 'event.jpg', b'1', '2005-01-21', '2005-01-22', '2006-12-07 09:52:24', '1977-01-29 21:11:21'),
(2, 'Illum et vel.', 'illum-et-vel.', 'Officiis qui non mollitia qui. Ullam est consectetur voluptates doloremque molestias omnis. Pariatur id dolor excepturi at et et eum.\n\nVoluptas incidunt porro consequuntur vitae voluptatibus odit et. Et cupiditate aperiam aperiam molestiae dolorem eum error. Voluptates fugit atque velit non.\n\nDistinctio ea aperiam neque quod. Dolorum architecto asperiores sed aut deleniti. Dignissimos dolores magnam nihil repudiandae et delectus ut.\n\nEt voluptates eveniet ab reprehenderit et ipsum. Sint illo blanditiis deserunt. Saepe ad vel qui sint maiores aliquid vel asperiores. Est delectus temporibus eum tenetur.\n\nLaudantium consectetur dicta sed nemo autem magnam et. Harum accusantium voluptas ea ut nobis. Enim fugiat ut cum nemo eveniet. Qui et ex sint.\n\nTotam sed consequatur fugit non. Iure autem aperiam ipsum. Iure beatae quod qui.\n\nNostrum officia quos ducimus at. Aut iusto aut molestiae labore. Vel nesciunt sint eveniet nostrum assumenda est suscipit.\n\nQui aut dolor neque sit. Omnis excepturi accusamus quasi incidunt nihil quasi saepe. Eius numquam quis accusamus sint libero. Commodi reiciendis doloribus qui aut quaerat.\n\nVoluptas sit eos suscipit sunt hic. Non est et ut temporibus nobis nulla sunt. Pariatur voluptatem cum eum sit iste. Quod facere et itaque neque quos aliquam vel.\n\nEt fugiat expedita in qui. Quia voluptas sapiente enim sed.', 'event.jpg', b'0', '1986-05-21', '1986-05-22', '2015-07-03 11:19:28', '1976-08-06 02:06:39'),
(3, 'Modi amet numquam.', 'modi-amet-numquam.', 'Dicta rerum eius quis dolores. Qui corporis eius unde error animi nemo. Vel praesentium consequuntur sint nam. Et iusto fuga non et officia.\n\nLabore illum ab dolor consequatur. Et quia reprehenderit ipsum quis veniam natus provident. At aut et rerum asperiores possimus rem. Cumque ex nemo modi rerum non.\n\nMaiores eaque vel perspiciatis quia. Laboriosam totam facere aliquid aut. Iure eum itaque voluptatem nihil consequuntur.\n\nAutem adipisci repudiandae quia error est aliquam vel. Placeat possimus ea voluptatibus quibusdam perspiciatis est assumenda omnis. Sed dicta eligendi repellendus. Et consequatur occaecati et vero aut officia quis est. Voluptatem et quis et.\n\nAut aut deleniti molestiae est. Impedit ab voluptate odio. Ut quidem quia ullam repellat et sunt quis et. Corrupti perspiciatis aperiam modi et praesentium et.\n\nEveniet nostrum voluptas asperiores aliquam. Esse quae sunt sit itaque nihil consequuntur neque sed. Nesciunt nulla et dolores eos id. Illum odio inventore non et libero id est repudiandae.\n\nEa qui excepturi voluptates nesciunt cupiditate pariatur et. Ab necessitatibus dolores assumenda minus enim quae nulla reiciendis. Assumenda praesentium velit sint qui odio odio dolores.\n\nAmet ut quia sint assumenda qui consequatur voluptates. Illo est reprehenderit aspernatur necessitatibus.\n\nVoluptas quis dolor autem unde dolor ut facere. Consequatur est assumenda a et. Dolorem quis perspiciatis architecto et velit ipsa.\n\nDignissimos sint atque sed enim ut rerum necessitatibus. Magnam necessitatibus in voluptatibus alias repellat suscipit. Dolorum tempora nam iure atque et. Ipsam sit deserunt voluptatem sed.', 'event.jpg', b'1', '2007-05-20', '2007-05-21', '2007-04-19 01:12:09', '2017-10-29 19:52:46'),
(4, 'Ut voluptatum qui id.', 'ut-voluptatum-qui-id.', 'Beatae illo culpa nihil quo ipsa. Exercitationem sint sed aliquid praesentium. Fugiat inventore ratione ut laboriosam iusto qui veritatis fugit. Nihil aspernatur perferendis ipsam omnis voluptatem rerum corrupti repellendus.\n\nQui eveniet omnis laudantium. Voluptas consectetur et ab eaque provident at rerum. Dicta beatae qui excepturi quia consequuntur.\n\nVero architecto et maxime odio enim. Sunt eos quia quasi eos. Porro blanditiis voluptate velit et quibusdam sed.\n\nAutem voluptatem et veniam est accusamus alias consectetur dicta. Consequuntur voluptatum qui sint. Exercitationem omnis quae tempore cupiditate quis vitae voluptate eum. Optio necessitatibus consectetur suscipit architecto et.\n\nVero sint autem aliquid officiis quam. Repellendus quo modi dolore ad corporis harum. Sed ea beatae unde voluptas.\n\nQui qui et doloremque. Ut optio excepturi illo mollitia quia explicabo repudiandae. Quis minus maiores doloribus qui accusamus. Et saepe quis consequatur impedit esse.\n\nError ad et est eaque praesentium. Quae rerum similique in consequuntur aut amet voluptate error. Laudantium aut quam quaerat officia est quis. Quo quisquam et sint dolorem nisi vero.\n\nDolores architecto eos commodi est. Tempora amet a voluptas. Ut doloribus occaecati ex ut dolor at.\n\nQui dolorem nisi et quia reprehenderit consequatur dolorum. Impedit maxime provident quo aperiam maiores quia blanditiis in. Reiciendis occaecati voluptas neque sunt aliquam. Sint inventore aut quibusdam possimus.\n\nProvident ad voluptate consequatur tempora sunt rem. Voluptates sequi et neque repudiandae ut adipisci minus. Perspiciatis et ea rerum est fuga. A dolores voluptatem commodi ipsam nemo ducimus.', 'event.jpg', b'0', '1996-07-21', '1996-07-22', '1983-03-12 22:10:10', '2021-10-16 21:00:31'),
(5, 'Aliquam vel est.', 'aliquam-vel-est.', 'Qui nostrum magni molestiae ut vero voluptatum accusantium. Occaecati ut laboriosam molestiae occaecati odit et cumque. Optio iure sint voluptatem dignissimos aliquid.\n\nEt repellendus maiores omnis nam. Similique dicta ut quas ipsum suscipit. Aliquid fuga corrupti rerum at molestiae temporibus.\n\nDistinctio provident nisi ea laboriosam ea laboriosam eum. Voluptatum ab non asperiores aut quidem eveniet. Et ut hic eveniet aut voluptatum atque. Neque omnis quia voluptatem.\n\nAb omnis quos qui. Tempora ut aut minus in nostrum sed. Laborum quae iste corrupti saepe quia. Distinctio odio eum eum asperiores atque.\n\nAssumenda ut iusto corrupti. Enim quibusdam doloremque deserunt nihil omnis. Aut mollitia iure qui explicabo doloremque. Id provident ducimus facere dolor quaerat soluta. Exercitationem odit neque dolore veniam provident.\n\nAspernatur aut quis quibusdam voluptas. Velit non animi alias distinctio perferendis est. Doloribus magni tenetur doloremque numquam quis non.\n\nOptio aut deserunt voluptas voluptas sed. Maiores ut at commodi facilis. Qui vitae ut minus molestiae esse a voluptate. Dignissimos placeat deserunt doloribus eveniet aut.\n\nSoluta nulla laudantium cumque ut. Voluptatibus molestiae tenetur non possimus. Molestiae repudiandae qui est repellendus quod.\n\nSequi aperiam id suscipit harum accusamus. Accusamus quia delectus non deserunt animi enim aut harum. Assumenda iste magni modi voluptas. Libero dolores esse optio labore.\n\nOdio eveniet qui expedita non magni non et. Ea doloribus in soluta et ex vel. Et cumque officia delectus velit quia cum tenetur et. Voluptas commodi doloribus voluptas.', 'event.jpg', b'0', '2020-04-22', '2020-04-23', '1975-06-13 14:26:50', '1998-01-18 03:28:27'),
(6, 'Quis culpa sint.', 'quis-culpa-sint.', 'Et soluta eveniet qui nemo. Maiores sint autem sed rerum enim iusto debitis. Itaque quo occaecati et et. Nihil rerum voluptates molestiae quasi voluptatem.\n\nPerspiciatis et sit quis velit qui. Corrupti ut reprehenderit eaque adipisci et libero.\n\nAb qui similique placeat quis. Maxime eveniet est temporibus veritatis aut. Eos itaque fugiat quis deserunt omnis omnis ipsam.\n\nRepellat voluptatem modi nam quia minima nisi quis. Quia sunt dignissimos rem occaecati amet quia eos. Animi non dolorum id excepturi.\n\nDolores dolores illo et accusantium quos aut autem explicabo. Qui placeat quas est quia id ipsum. Consequatur quia vel quod eligendi consequatur non nesciunt. Fugit perferendis illo eum velit.\n\nAnimi sit ex molestiae ea. Sapiente et nihil deserunt quidem voluptas recusandae. Animi pariatur dolor quo quidem dolore dignissimos. Dolor ipsum fugit est autem dolores sequi exercitationem.\n\nMagnam distinctio sunt voluptas sapiente voluptas qui. Et sint ut sequi. Magnam aut velit eos autem temporibus aspernatur facere doloribus. Aut soluta ut assumenda vel quia.\n\nDoloribus cumque vitae est hic. Vitae cumque eveniet doloribus incidunt. Vitae neque dolorum voluptatibus qui quos facilis recusandae. Eius minus rerum facere nulla possimus dolorem.\n\nAt dolorem vel modi voluptas quia nihil. Eos atque vel necessitatibus molestias quae dolores. Laboriosam nesciunt alias fugiat dolorum. Eligendi quod aut vel modi maiores.\n\nPerspiciatis blanditiis architecto quidem iste. Officiis quis aliquam consectetur velit dolorem perferendis eos ut. In ea nostrum veritatis commodi ut laboriosam.', 'event.jpg', b'1', '2021-12-09', '2021-12-10', '1970-07-27 02:20:03', '1973-02-02 09:05:11'),
(7, 'Sint est.', 'sint-est.', 'Impedit consequatur sit unde doloribus nihil eveniet. Iure quas in nam quod omnis et. Voluptate aut alias ullam illo ducimus.\n\nArchitecto autem in magnam autem voluptas. Voluptatem error enim dolore earum expedita necessitatibus voluptatum aut. Velit quam a dolores eveniet velit consequatur et. Dolores ut delectus inventore quo laborum consequatur.\n\nQuis maxime maxime et cumque ipsam provident. Totam perspiciatis qui dolor. Sequi et quasi voluptatem voluptatem ratione est omnis. Quia amet ullam tempore quam.\n\nUt natus numquam optio consequatur molestiae. Et culpa dolores in quia neque laudantium sit. Non voluptas quod ducimus possimus dolor quis ea.\n\nQuam nisi impedit enim quas sunt qui. Doloribus est ut aut dolor voluptatem in sed. Magnam sit harum reprehenderit assumenda aut.\n\nPorro exercitationem fugiat vel repellat corrupti. Maxime minima hic nihil beatae aut. Pariatur maiores eos unde ut quia. Numquam inventore molestiae numquam voluptatem laborum. Officia et sed quisquam eum enim aperiam molestiae.\n\nVoluptas doloremque accusamus et soluta soluta. Consequatur rerum et aut quisquam atque. Commodi beatae non qui.\n\nAutem fugiat consequatur sit exercitationem est nobis. Cupiditate est accusamus ut impedit quasi minus. Vero eius earum qui expedita repellendus suscipit minus.\n\nPlaceat voluptas amet vel impedit porro consectetur veniam. Quia et sit sequi consequatur assumenda.\n\nId sed possimus itaque ut ut. Eos qui non aut voluptatem eveniet. Recusandae aut quod officiis provident quis et distinctio. Sapiente labore laudantium reprehenderit nulla earum.', 'event.jpg', b'1', '2021-05-06', '2021-05-07', '1980-09-30 21:00:51', '1991-01-26 13:36:16'),
(8, 'Inventore velit harum animi.', 'inventore-velit-harum-animi.', 'Dolorem animi quisquam ullam voluptates et. Dolore quasi ad tempore totam voluptates odio. Vel minus cupiditate velit est est rem numquam.\n\nEnim accusamus ratione ipsam et. Est hic consequatur eum autem. Et culpa ullam animi animi dignissimos quasi consequatur.\n\nTenetur iure saepe magnam atque repudiandae omnis nostrum. Sed eius perferendis et deleniti rerum quae quidem.\n\nQui aut ea nulla placeat nostrum. Nostrum rerum omnis aut. Soluta accusantium hic veniam numquam.\n\nDolorum officiis nihil sed iste asperiores vitae. Temporibus fuga aut at qui expedita enim. Sunt qui aut consectetur molestiae est odit ut.\n\nIpsam qui fugit quis autem. Nihil laboriosam nemo voluptas quia ea debitis. Et similique blanditiis dolorem nam et.\n\nQui necessitatibus facere voluptas delectus. Deserunt suscipit odit cumque quisquam. Est est quia voluptas et omnis perspiciatis velit. Nisi et alias totam modi reprehenderit ipsa.\n\nPlaceat rem magni dolor aut molestiae eveniet rerum. Dolorem dicta reprehenderit voluptatum quod quae ad. Quia voluptas veniam repellendus temporibus. In non quod error deleniti vero. Magni accusamus impedit sed harum aut ut.\n\nPorro tempore commodi quia modi autem est. Commodi eos velit eius vitae et. Non molestiae qui molestiae totam dolores recusandae doloribus.\n\nConsectetur voluptas sequi quis nostrum qui aut quam ratione. Suscipit ut odit aut optio temporibus ad. Cumque ut eum qui quo asperiores consequatur. Aperiam hic eius qui officia qui tenetur sunt.', 'event.jpg', b'0', '2020-05-02', '2020-05-03', '1989-11-14 01:41:14', '2016-04-02 18:31:31'),
(9, 'Libero quis dolorum.', 'libero-quis-dolorum.', 'Vel nisi voluptatem ducimus accusantium ut natus quidem. Impedit alias culpa atque et. Quas voluptas et laborum dolorum culpa nihil.\n\nReprehenderit eum corrupti omnis vero ut alias omnis. Aut error earum quaerat laborum ea sed magni. Nesciunt rerum animi necessitatibus iure quis. Magni iusto maiores eligendi est rem molestiae doloremque reprehenderit.\n\nNihil eveniet quas placeat voluptatem eaque sunt. Porro ad sit vel laborum sit nam. Tempora voluptatum dolorem aut magni eligendi non est in.\n\nSit voluptatem omnis cum tempore quidem dolor. Eos assumenda nisi doloribus mollitia commodi doloribus velit. Nobis modi est ut.\n\nBeatae accusantium nihil quis corrupti laboriosam. Aut sunt aperiam atque. Maiores autem quidem eum officiis optio voluptas nulla. Natus voluptas vel non et soluta ab totam.\n\nEt dolores consectetur fugit ipsum. Earum id aut perspiciatis quis sint sed et tenetur. Sit voluptatem dignissimos adipisci quia dignissimos blanditiis.\n\nEt consequatur aut ad voluptatem in. Alias perferendis et natus quas quasi qui. Voluptate ullam in officiis est aut temporibus.\n\nAut rerum qui autem sint fugit libero. Corrupti velit et sed sit placeat. Perspiciatis impedit itaque incidunt. Minus enim accusantium culpa commodi natus.\n\nQui asperiores eum in quis dolores dolor. Numquam qui ut voluptatem sed sint neque. Molestiae nesciunt repellendus soluta.\n\nAsperiores consequuntur ratione in quo ipsum voluptate. Illum commodi hic quae. Laudantium labore illo aut dolores officia porro nihil asperiores. Cumque est eius earum dignissimos eos sit.', 'event.jpg', b'1', '1981-11-20', '1981-11-21', '2004-11-05 09:48:33', '2016-09-14 21:01:06'),
(10, 'Optio consequatur eum consequatur.', 'optio-consequatur-eum-consequatur.', 'Eos porro voluptatibus sed eum enim. Possimus perferendis deleniti atque ab at.\n\nExcepturi reprehenderit facere rem exercitationem temporibus dolor libero. Commodi adipisci aut debitis explicabo. Maxime vero quia provident quasi enim.\n\nUt praesentium quo pariatur reprehenderit illum et repudiandae. Perspiciatis quia asperiores sapiente quis laudantium maxime consequatur. Et fugiat porro non id enim maiores id. Rem hic beatae omnis atque aut expedita.\n\nSit nostrum porro fugiat sint explicabo id. Veniam in sit nesciunt eligendi molestias expedita laudantium totam.\n\nBeatae sed eum quis natus occaecati. Quaerat consequatur vitae iste nihil quia culpa dolore. Eum consequatur dicta dignissimos numquam odit fuga mollitia. Aliquam quibusdam odit rerum rerum inventore soluta est recusandae.\n\nRem quia vitae officiis minus tempora. Sit et enim aut laboriosam. Quia et officia explicabo dolor. Ipsum voluptas dolores et provident quod qui est.\n\nCorporis sequi error in rerum distinctio. Hic quisquam voluptate corporis in. Quaerat quos quia omnis fuga enim.\n\nBlanditiis repudiandae ullam temporibus officia voluptatem. Enim illum cumque architecto unde veritatis ipsum. Distinctio ad et consequatur et rerum. Sint voluptatem sint voluptate.\n\nQui tenetur perferendis sequi autem eos quia. Facere distinctio vel corporis quisquam. Eos quis perferendis quibusdam dolor velit. Optio nobis dolorem corrupti est blanditiis vitae.\n\nEum enim neque est maiores pariatur. Autem repellat hic nisi cum porro commodi quod.', 'event.jpg', b'0', '2012-01-04', '2012-01-05', '1976-11-16 21:19:24', '2012-03-27 07:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `historysales`
--

CREATE TABLE `historysales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `historyusers`
--

CREATE TABLE `historyusers` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tgl_registrasi` datetime DEFAULT NULL,
  `tgl_gabung_member` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1655088320, 1),
(2, '2022-01-25-111041', 'App\\Database\\Migrations\\Products', 'default', 'App', 1655088322, 1),
(3, '2022-01-25-112702', 'App\\Database\\Migrations\\Categories', 'default', 'App', 1655088322, 1),
(4, '2022-01-25-113448', 'App\\Database\\Migrations\\Colors', 'default', 'App', 1655088322, 1),
(5, '2022-01-25-113510', 'App\\Database\\Migrations\\Sizes', 'default', 'App', 1655088323, 1),
(6, '2022-01-25-115054', 'App\\Database\\Migrations\\Productsize', 'default', 'App', 1655088323, 1),
(7, '2022-01-25-115103', 'App\\Database\\Migrations\\Productcolor', 'default', 'App', 1655088323, 1),
(8, '2022-01-29-094818', 'App\\Database\\Migrations\\Cart', 'default', 'App', 1655088324, 1),
(9, '2022-01-29-095124', 'App\\Database\\Migrations\\Productcart', 'default', 'App', 1655088324, 1),
(10, '2022-02-28-042727', 'App\\Database\\Migrations\\Address', 'default', 'App', 1655088324, 1),
(11, '2022-02-28-043735', 'App\\Database\\Migrations\\Checkouts', 'default', 'App', 1655088325, 1),
(12, '2022-03-04-021129', 'App\\Database\\Migrations\\Confirms', 'default', 'App', 1655088325, 1),
(13, '2022-03-16-023137', 'App\\Database\\Migrations\\Events', 'default', 'App', 1655088326, 1),
(14, '2022-03-21-040430', 'App\\Database\\Migrations\\CancelOrders', 'default', 'App', 1655088326, 1),
(15, '2022-03-23-035447', 'App\\Database\\Migrations\\Productcheckout', 'default', 'App', 1655088328, 1),
(16, '2022-06-06-055254', 'App\\Database\\Migrations\\Historyuser', 'default', 'App', 1655088329, 1),
(17, '2022-06-07-023439', 'App\\Database\\Migrations\\Historysales', 'default', 'App', 1655088329, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productcart`
--

CREATE TABLE `productcart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `size` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productcheckout`
--

CREATE TABLE `productcheckout` (
  `checkout_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `color` varchar(15) NOT NULL,
  `size` varchar(5) NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `grand_total` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `productcheckout`
--
DELIMITER $$
CREATE TRIGGER `hapusSold` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold - OLD.quantity WHERE id = OLD.product_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapusStok` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock + OLD.quantity WHERE id = OLD.product_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kurangStok` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock - NEW.quantity WHERE id = NEW.product_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambahSold` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold + NEW.quantity WHERE id = NEW.product_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubahSold` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = (sold - OLD.quantity) + NEW.quantity WHERE id = OLD.product_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubahStok` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = (stock + OLD.quantity) - NEW.quantity WHERE id = OLD.product_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `productcolor`
--

CREATE TABLE `productcolor` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `color_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productcolor`
--

INSERT INTO `productcolor` (`product_id`, `color_id`) VALUES
(83, 15),
(44, 5),
(86, 25),
(21, 11),
(87, 23),
(98, 3),
(56, 17),
(37, 15),
(64, 17),
(60, 13),
(11, 7),
(71, 13),
(73, 16),
(6, 2),
(39, 16),
(6, 22),
(81, 26),
(28, 4),
(80, 17),
(84, 8),
(84, 4),
(18, 9),
(79, 10),
(48, 4),
(95, 14),
(10, 23),
(31, 1),
(53, 3),
(65, 9),
(66, 23),
(30, 23),
(45, 21),
(51, 19),
(94, 26),
(11, 13),
(72, 14),
(48, 8),
(54, 7),
(71, 22),
(98, 2),
(82, 15),
(59, 7),
(72, 13),
(33, 7),
(41, 25),
(30, 25),
(39, 3),
(20, 4),
(96, 13),
(8, 1),
(17, 9),
(70, 18),
(63, 21),
(94, 23),
(83, 2),
(49, 17),
(76, 13),
(79, 19),
(30, 6),
(87, 7),
(65, 11),
(76, 2),
(98, 3),
(37, 1),
(52, 1),
(57, 16),
(19, 7),
(81, 2),
(95, 21),
(25, 9),
(42, 19),
(20, 6),
(37, 23),
(23, 3),
(17, 10),
(72, 2),
(32, 25),
(48, 9),
(11, 13),
(15, 12),
(54, 16),
(52, 24),
(32, 22),
(8, 26),
(81, 14),
(75, 26),
(25, 6),
(92, 5),
(2, 25),
(6, 12),
(65, 16),
(86, 5),
(61, 7),
(35, 21),
(32, 23),
(100, 6),
(34, 11),
(79, 11),
(31, 22),
(40, 17),
(90, 24),
(82, 8),
(88, 10),
(71, 23),
(16, 23),
(76, 15),
(36, 3),
(65, 4),
(36, 14),
(11, 12),
(17, 26),
(34, 17),
(80, 4),
(94, 18),
(62, 13),
(96, 17),
(99, 14),
(56, 6),
(95, 20),
(77, 17),
(41, 21),
(67, 21),
(1, 12),
(42, 21),
(6, 18),
(56, 26),
(59, 24),
(19, 7),
(97, 12),
(10, 21),
(38, 8),
(5, 5),
(1, 26),
(82, 20),
(65, 12),
(82, 17),
(67, 9),
(1, 21),
(16, 6),
(7, 24),
(89, 12),
(58, 8),
(45, 4),
(81, 18),
(84, 8),
(60, 10),
(13, 10),
(42, 16),
(19, 5),
(27, 14),
(52, 5),
(14, 26),
(30, 11),
(54, 11),
(59, 2),
(6, 18),
(81, 9),
(71, 8),
(51, 20),
(100, 14),
(93, 9),
(55, 11),
(81, 10),
(58, 2),
(54, 3),
(69, 9),
(70, 16),
(93, 18),
(79, 7),
(24, 18),
(91, 17),
(1, 21),
(99, 22),
(80, 19),
(45, 4),
(58, 21),
(80, 17),
(72, 12),
(12, 5),
(66, 26),
(23, 26),
(35, 3),
(59, 5),
(51, 26),
(80, 8),
(26, 5),
(76, 23),
(46, 20),
(76, 3),
(43, 14),
(67, 13),
(11, 21),
(60, 3),
(86, 15),
(54, 3),
(24, 22),
(7, 26),
(22, 13),
(98, 20),
(8, 26),
(51, 14),
(30, 15),
(55, 5),
(47, 13),
(77, 22),
(30, 22),
(10, 17),
(53, 4),
(76, 19),
(79, 2),
(15, 20),
(56, 26),
(19, 3),
(46, 15),
(86, 20),
(80, 16),
(28, 10),
(85, 17),
(7, 7),
(73, 25),
(48, 9),
(8, 23),
(2, 16),
(26, 2),
(16, 15),
(44, 6),
(26, 4),
(58, 19),
(1, 1),
(70, 11),
(27, 21),
(27, 2),
(23, 26),
(52, 1),
(88, 2),
(4, 20),
(86, 4),
(92, 16),
(6, 8),
(71, 24),
(66, 8),
(75, 23),
(8, 17),
(44, 21),
(19, 6),
(3, 4),
(55, 21),
(2, 13),
(26, 5),
(37, 7),
(98, 11),
(32, 3),
(16, 19),
(8, 2),
(42, 8),
(24, 19),
(10, 14),
(40, 22),
(41, 15),
(14, 17),
(11, 13),
(63, 14),
(14, 16),
(97, 25),
(56, 5),
(59, 2),
(61, 19),
(20, 17),
(75, 26),
(46, 26),
(44, 19),
(72, 23),
(58, 22),
(36, 24),
(52, 12),
(9, 24),
(43, 10),
(95, 18),
(46, 20),
(80, 9),
(73, 12),
(47, 3),
(74, 11),
(35, 20),
(27, 9),
(83, 14),
(31, 10),
(20, 3),
(32, 17),
(45, 14),
(53, 1),
(55, 16),
(47, 9),
(31, 10),
(89, 13),
(100, 18),
(56, 5),
(66, 21),
(100, 26),
(23, 8);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `detail` text NOT NULL,
  `price` int(11) NOT NULL,
  `discount` float NOT NULL,
  `weight` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT 'product.jpg',
  `image_2` varchar(255) NOT NULL DEFAULT 'product.jpg',
  `image_3` varchar(255) NOT NULL DEFAULT 'product.jpg',
  `sold` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `detail`, `price`, `discount`, `weight`, `stock`, `image_1`, `image_2`, `image_3`, `sold`, `created_at`, `updated_at`) VALUES
(1, 5, 'Et reiciendis qui error.', 'et-reiciendis-qui-error.', 'Eligendi qui temporibus suscipit qui eum illo. Eaque et eaque sed et. Eum veritatis aut sit accusantium eligendi itaque ex quia. Earum dolor odit necessitatibus hic sapiente.\n\nFacilis mollitia debitis ipsum voluptas ut possimus. Sit ipsam sint dolor dolorem ipsam dolor repellendus. Aut placeat aut nesciunt non. Dolores mollitia et voluptatibus sapiente eum labore.\n\nEst dolorum unde molestias non sed totam. Veritatis qui ea repellat aliquam eveniet. Aut quisquam aut sed iusto rerum et. Sit quibusdam illo numquam.\n\nAtque sed vel sit natus. Cumque optio nobis voluptate iste natus totam. Quae et et qui pariatur et. Sint nemo sapiente id recusandae aliquid ea.\n\nOccaecati reprehenderit unde rerum nisi. Doloribus illum molestiae provident et commodi nisi. Autem architecto similique repudiandae est nulla. Suscipit quasi corrupti natus aut esse quia ducimus.', 658883, 27, 1137, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1993-11-05 00:00:00', '2022-06-13 09:45:46'),
(2, 3, 'Eveniet sapiente non.', 'eveniet-sapiente-non.', 'Exercitationem veniam ullam molestiae rerum quia. Et aut fuga quam sit. Expedita rerum veritatis voluptate rerum.\n\nEt rerum eius voluptatem ut adipisci doloremque. Dolor ut a ut quasi omnis ad inventore. Autem et quo saepe optio voluptas explicabo.\n\nVelit ipsa iure dolore amet molestias quia. Id provident quo consequatur exercitationem nisi voluptatum enim sint. Esse illo sequi velit asperiores dolorem numquam ut.\n\nConsectetur sunt autem quas eligendi. Tenetur voluptate quasi sed molestias. Reprehenderit id amet quis ut.\n\nNecessitatibus totam ut in quasi. Rerum sed totam et enim quibusdam eos. Aliquid unde magni ut quis suscipit rem ullam. Voluptas doloremque iste iure quos voluptas quam non. At accusantium commodi commodi atque hic excepturi.', 496487, 13, 2330, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2015-01-06 13:12:23', '2022-06-13 09:45:46'),
(3, 2, 'Magnam explicabo culpa.', 'magnam-explicabo-culpa.', 'Consectetur error fugiat nihil molestiae laborum ratione. Vel dolores culpa modi qui tenetur ex minima explicabo. Cumque voluptatem sed deserunt ea qui nam voluptates.\n\nReprehenderit illo necessitatibus quasi aut id eius id. Est nostrum doloremque qui iste culpa. Magni minima aliquid sequi laboriosam placeat. Molestias quae ipsa asperiores mollitia et ducimus.\n\nRepellat ut et quae. Odio consequuntur asperiores nesciunt expedita sed. Consectetur voluptas qui aut possimus omnis hic.\n\nDistinctio veritatis enim ut quia aut impedit. Eum qui magni pariatur dignissimos officiis animi non. Enim id natus nulla non hic.\n\nVoluptatibus quidem nisi ut ut nesciunt. Quia rerum dignissimos aliquam nam non repudiandae. Voluptas non sint qui. Sit porro quo et eaque. Officiis quod quam sunt molestiae ad.', 320060, 2, 1080, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2008-05-14 06:48:22', '2022-06-13 09:45:46'),
(4, 4, 'Libero autem minus est assumenda.', 'libero-autem-minus-est-assumenda.', 'Ut odio debitis magni. Atque quia fugit veniam aut. Doloribus quia et molestias facilis sit eius et.\n\nIn voluptas fugiat fugiat adipisci cupiditate numquam sit doloribus. Voluptatum assumenda ut sed quas totam alias. Non dolor nam ipsa quasi. Temporibus quis mollitia nihil quos et.\n\nDolor quo aut aut sunt ut. Officia voluptate laboriosam autem dolorem reprehenderit porro placeat corporis.\n\nQuo et laboriosam ex inventore consectetur provident est nihil. Deleniti culpa neque maxime optio sapiente vel quos. Voluptatem dolorum et corporis non quos ut facere.\n\nMaiores possimus et nisi tempora aut eaque doloremque. In nam ut dignissimos maiores animi quasi natus. Aut unde temporibus qui natus sit nihil. Qui cum adipisci omnis velit itaque consequatur quae. Omnis in sed rem et omnis.', 503902, 43, 3156, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2014-06-23 19:33:16', '2022-06-13 09:45:46'),
(5, 1, 'Vitae quasi natus.', 'vitae-quasi-natus.', 'Assumenda numquam tempore culpa ut maxime. Et autem ducimus cupiditate et. Voluptas mollitia ipsa itaque saepe vel. Nostrum eaque enim optio sequi quas.\n\nVoluptas cupiditate sint in quisquam non soluta. Ut repellendus occaecati quo est error. Quia porro deleniti a itaque est. Esse reprehenderit quaerat minus qui mollitia.\n\nDolorem ipsa vel blanditiis voluptates sapiente sunt veniam pariatur. Ea ipsa deserunt sit non facere. Nesciunt recusandae assumenda est doloribus nihil.\n\nDebitis nisi cumque facilis consectetur omnis quae. Sapiente harum quia cupiditate autem est omnis. Assumenda voluptatem tenetur adipisci totam voluptatem. Dolores neque odit ducimus expedita.\n\nVoluptatum nam iure dolores. Excepturi tempora magni saepe nemo. Maiores expedita eos corrupti et error provident. Sapiente neque et sit blanditiis eveniet possimus.', 559775, 62, 4931, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-11-07 13:29:27', '2022-06-13 09:45:46'),
(6, 4, 'Ratione aut vel reiciendis.', 'ratione-aut-vel-reiciendis.', 'Harum nulla ex dolor ducimus at consequatur qui. Et molestiae sed eos. Accusantium nisi et ut qui reprehenderit assumenda sed. Dolores voluptate quisquam aut eos velit nam ut nam.\n\nVoluptatem perspiciatis velit rerum in nam repellendus. Dignissimos ipsam est voluptas dolor velit. Quia temporibus saepe laborum reprehenderit repudiandae animi. Sint qui voluptates aut. Sed veritatis iure delectus voluptas autem dicta.\n\nEaque commodi maiores aut. Ducimus beatae recusandae maxime asperiores debitis. Voluptatibus a inventore labore dolore.\n\nSapiente sint qui reprehenderit sunt soluta delectus. Labore optio voluptatem asperiores reprehenderit culpa. Quia et numquam inventore ad corrupti. Rerum soluta enim est nisi.\n\nDelectus perspiciatis voluptatem labore non exercitationem rerum odio. Facere id tempore enim iusto velit quaerat. Dolores assumenda illum sed.', 490536, 69, 1069, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2011-07-01 21:39:08', '2022-06-13 09:45:46'),
(7, 1, 'Ducimus nemo totam temporibus.', 'ducimus-nemo-totam-temporibus.', 'Et minus et consequatur placeat recusandae. Iste velit fuga aut dolores iusto voluptatum.\n\nAtque qui asperiores odio repellat totam molestiae. Alias sapiente et illum. Aut voluptas in saepe. Enim dolorem hic dolorem harum inventore.\n\nRepellat eum modi explicabo vel sunt laboriosam nemo. Deserunt odio est dolores et rerum officiis sed. Non autem voluptatem qui incidunt tempora et. Consequatur odit adipisci excepturi error. Natus eveniet incidunt consequatur.\n\nCorporis porro quos odit maxime impedit repudiandae. Eaque facere laborum impedit ea. Quidem neque minus fugiat natus veritatis nemo sunt. Reprehenderit laboriosam tempora quaerat in voluptas.\n\nRecusandae illo perspiciatis ut voluptatem dolorum unde sed. Optio amet doloremque voluptas sit. Recusandae deleniti repellat vero earum. Harum cum officiis porro dicta veniam.', 772438, 72, 2177, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1993-03-05 08:30:55', '2022-06-13 09:45:47'),
(8, 2, 'Reprehenderit laboriosam ut labore.', 'reprehenderit-laboriosam-ut-labore.', 'Ratione qui dignissimos quidem aliquid deleniti. Sunt et dolorem modi dolorem. Non eveniet aspernatur animi blanditiis et.\n\nIn atque accusamus molestias ab provident. Earum dolores est consequatur id ea voluptatem aliquam. Dolorum rerum sapiente officiis eveniet.\n\nConsectetur et ullam corrupti doloribus. Voluptate sint qui laudantium fuga modi consequatur inventore. Animi rem labore et quasi eaque ut pariatur. Accusantium aut aut autem debitis necessitatibus.\n\nDoloribus facilis ut magnam quia et mollitia. Et voluptatum aut molestiae tempore. Quia voluptatem odit reiciendis magni excepturi sint quasi dignissimos. Occaecati eum autem consequatur totam.\n\nReprehenderit optio eum consequatur dolores voluptas placeat eaque. Odit aut suscipit reprehenderit velit qui. Ipsum deserunt temporibus quia et. Laborum iure ut voluptatibus iure dolore sit dolore.', 426898, 75, 2035, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1985-09-10 19:25:50', '2022-06-13 09:45:47'),
(9, 2, 'Adipisci occaecati est reprehenderit.', 'adipisci-occaecati-est-reprehenderit.', 'Doloremque praesentium voluptatem aut molestiae repellendus a sed. Temporibus voluptatum non consequatur nesciunt quia esse atque. Eum et iure nulla totam saepe aliquid eligendi nulla. Rerum cum culpa autem non minima officiis architecto aperiam.\n\nQuis distinctio laudantium delectus quaerat cupiditate ex consequatur. At illum ut eos aut. Sed totam in iste sapiente. Dolorem vitae dolore provident sapiente quod repellendus illum.\n\nProvident itaque ut mollitia soluta dignissimos excepturi laboriosam veniam. Quia incidunt ab quibusdam corporis molestiae distinctio.\n\nMagni molestiae et quis ipsam. At magnam numquam eos vel et at repudiandae. Quia deserunt fugit eum facere.\n\nAtque pariatur consectetur odit nobis rem velit. Est numquam eum ad iusto aut qui et. Illo minus similique ab ut labore.', 118609, 43, 2933, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2002-11-19 20:52:47', '2022-06-13 09:45:47'),
(10, 4, 'Error sit ducimus ipsam aut.', 'error-sit-ducimus-ipsam-aut.', 'Adipisci quia provident similique voluptatum deleniti sapiente sint sapiente. Quas consequatur nisi accusamus iure recusandae quasi. Perferendis iusto sit ullam vel.\n\nEt sit nam sunt inventore corrupti. Omnis molestias suscipit repudiandae ea. Placeat dolor quia saepe dolores ipsa laborum sunt.\n\nQuo praesentium unde porro et. Sit velit excepturi molestiae est voluptas. Ipsum quos dolorem iure dolores dolor et illo excepturi. Dicta ad fugit aut sint harum sint quisquam rerum.\n\nDicta ipsum nihil autem dolor. Tempore quasi sed ipsa soluta. Architecto eaque laboriosam deserunt fugiat. Qui quos ducimus placeat.\n\nAd fugiat minus ipsa vitae corporis. Qui debitis numquam voluptatum ex ullam. Ducimus sunt nulla accusamus laborum.', 147092, 53, 3594, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-03-27 17:32:26', '2022-06-13 09:45:47'),
(11, 1, 'Molestiae laborum eligendi.', 'molestiae-laborum-eligendi.', 'Eius nisi eveniet earum quas et nostrum. Laborum et totam quia harum aut eos. Facilis optio amet illo.\n\nEt aut eius et quibusdam ex expedita officiis. Dicta molestiae alias vel et. Et tempore eos sequi qui non nostrum sed. Nulla reiciendis et magnam non dolores omnis.\n\nIpsa non ut earum id totam hic. Quisquam delectus quia quis harum unde alias. Ea accusamus culpa dolor. Et consequatur facere quo deserunt.\n\nCulpa provident necessitatibus ut qui voluptatem. Commodi culpa et neque voluptatibus temporibus ipsum et. Voluptatem voluptates et aut deleniti repudiandae pariatur.\n\nVoluptas cum debitis sed beatae. Vero blanditiis aspernatur exercitationem laboriosam nam. Hic et hic ut eos aliquam id officiis.', 164301, 61, 2369, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-05-26 10:52:44', '2022-06-13 09:45:47'),
(12, 4, 'Dolore aliquid blanditiis.', 'dolore-aliquid-blanditiis.', 'Quos nihil voluptatum officiis ut nemo veniam. Accusantium laborum doloremque nihil nihil et minima velit. Mollitia eum rerum sit alias modi voluptas. Neque numquam rerum eum cupiditate sapiente ut asperiores ab.\n\nEos ex omnis quia autem. Fugit exercitationem voluptatem architecto dolorum omnis expedita praesentium. Eaque quo natus repellat.\n\nSint excepturi aut dolorem excepturi excepturi sunt. Maxime ut ut quasi vero consectetur delectus ipsa. Et vero impedit porro officiis libero.\n\nNecessitatibus qui illum exercitationem. Eum illum sit aspernatur. Doloremque aut odit voluptas consectetur. Et id vel perferendis ea quisquam numquam commodi.\n\nUt dolore iure et sunt. Aperiam minima quia ea fuga est et quos. Non autem voluptatem provident est aperiam minus et. Eaque et fugiat maxime voluptatum. Rerum temporibus maxime quia.', 405812, 2, 2993, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2018-01-11 13:58:54', '2022-06-13 09:45:47'),
(13, 5, 'Atque dolorem suscipit at.', 'atque-dolorem-suscipit-at.', 'Est inventore est nihil sed impedit quos facilis doloremque. Deleniti amet labore ut voluptatem numquam. Voluptatum officiis voluptatem rerum nesciunt similique consequuntur. Enim reprehenderit placeat quia qui.\n\nAliquid cumque architecto possimus blanditiis sunt natus et sit. Fuga a vel aut amet voluptatibus. Rerum quae possimus itaque expedita fugit modi. Sunt repellendus tempore fugiat.\n\nPerspiciatis modi commodi magnam consectetur necessitatibus. Dignissimos sunt qui quia. Libero excepturi vel quia earum. Dolorum similique perferendis deserunt.\n\nFacilis doloribus laudantium assumenda. Nostrum animi exercitationem perspiciatis explicabo et quia. Quas dolorem qui cumque repudiandae nesciunt officia.\n\nVoluptatem est expedita veritatis perspiciatis earum nisi repellendus. Magni dignissimos temporibus quibusdam molestiae dolor. Distinctio officia ut hic non. Et aspernatur delectus ex possimus rerum praesentium.', 495449, 58, 4961, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1998-04-11 19:50:22', '2022-06-13 09:45:47'),
(14, 1, 'Dolorem enim doloremque delectus voluptas.', 'dolorem-enim-doloremque-delectus-voluptas.', 'Exercitationem sint itaque molestias in. Praesentium dicta autem dolores fuga. Doloremque suscipit delectus nihil inventore beatae voluptatem dolorum sit. Eum quo unde sed voluptas ut vel aut. Culpa et sapiente consequatur voluptatem architecto.\n\nRerum veritatis iure quam ea rerum voluptates ad. Voluptatem quo odit a enim. Aperiam doloribus aliquid quo dolore. Eum sed ut omnis.\n\nRerum consequuntur impedit aut quidem nam accusamus. Consequatur quo voluptatem id magni inventore amet ad dicta. Dolor et possimus doloremque quo facilis.\n\nVelit non eaque et et animi sit blanditiis officiis. Dolore praesentium et deleniti voluptate dolor illum.\n\nQuia error numquam aut aut numquam aut vel. Facere veniam sit cum illum veniam ut. Deleniti provident mollitia dolore qui perferendis vero qui ipsum. Illo expedita enim nostrum asperiores neque quidem magni.', 870089, 20, 2230, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1990-12-27 20:00:36', '2022-06-13 09:45:47'),
(15, 5, 'Possimus beatae.', 'possimus-beatae.', 'Alias nulla repellat voluptate non voluptas et. Pariatur rerum autem quos quo voluptatem iusto est. Dolorem ipsam blanditiis itaque amet. Iure est magnam qui dolorem ut quae.\n\nEt qui voluptatem qui quis. Labore quis qui ad omnis quo. Porro unde vitae et ut.\n\nUt consequatur nostrum molestias minima nobis iste nesciunt. Labore ullam ducimus nostrum sit non omnis qui provident. Voluptas quidem dolore sunt sit expedita accusamus.\n\nVoluptas saepe ea sed repudiandae nesciunt voluptatum. Sit consequatur rerum corrupti dignissimos sapiente esse. Officiis eum et odit sint eum.\n\nEx ut pariatur ipsa rerum. Sint magni fugit quia magni. Eum ipsum enim doloremque optio voluptatem debitis nobis accusantium. Consequatur quo officia eius eveniet.', 694702, 66, 4495, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-07-20 13:54:39', '2022-06-13 09:45:47'),
(16, 4, 'Enim odio sed.', 'enim-odio-sed.', 'Sequi optio nulla quidem. Sint est et dolores et nihil laudantium placeat voluptas. Voluptatem quia occaecati dolorem. Eum et qui omnis excepturi iste.\n\nAut tempora libero sed aliquam. Omnis id magnam aliquam voluptatem. Harum in ut aperiam rem facilis expedita cum. Dolor aperiam autem dicta repellendus.\n\nRerum dignissimos odio quo et. Beatae rerum aut non quidem sit sunt quisquam. Consequatur dolor sed et harum.\n\nQui aut amet repellat ducimus debitis recusandae. Qui architecto perferendis iure enim. Dolorum incidunt qui ex qui. Et neque accusantium saepe.\n\nDucimus sit laboriosam dolorem consequuntur aut. Consectetur consequatur commodi porro et. Enim aliquam quae qui maiores consequatur.', 169310, 0, 1697, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-12-26 19:20:24', '2022-06-13 09:45:47'),
(17, 1, 'Alias dolore qui reprehenderit.', 'alias-dolore-qui-reprehenderit.', 'Aut aut eos molestiae nulla omnis nostrum nam. Sunt aut ut est consectetur. Voluptates officiis placeat et consequuntur voluptatem quasi autem.\n\nSequi iure et dignissimos assumenda. Id ducimus libero enim odio. Molestias illo a ducimus id. Cum soluta reiciendis similique blanditiis et.\n\nMolestiae ipsam totam quaerat distinctio repudiandae iusto qui tempore. Qui quod facilis exercitationem reiciendis fuga officia officia. Impedit et ut vel qui labore repudiandae qui. Sed modi ipsa quos.\n\nSint sed quidem voluptatibus velit. Expedita aperiam iste et assumenda. Fuga soluta necessitatibus tempore ipsa quis illum. Velit aut sit repellat dolores voluptate praesentium est quia.\n\nFugit in quidem dolorem aliquam. Non aut quibusdam voluptatem laborum et assumenda. Ullam optio non impedit qui consectetur. Molestiae libero perspiciatis tenetur.', 820680, 9, 1875, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2015-06-28 15:44:03', '2022-06-13 09:45:47'),
(18, 5, 'Tempora et.', 'tempora-et.', 'Tempore aut aperiam doloremque consequatur odit. Ex eaque ut nostrum possimus et quaerat mollitia. Repellendus vel repudiandae ipsa. Sit ipsam modi officiis est. In consequatur neque sint ipsa consequuntur sunt consequatur sapiente.\n\nOfficiis totam et laboriosam sit optio repellat quidem. Sint sint perferendis non sed deserunt aut eos. Similique ut aut et sunt.\n\nAut ut corporis et qui. Aspernatur unde consequatur sit ducimus sit suscipit. Culpa unde tempora dicta est eum ratione. Voluptas officiis non nisi perspiciatis non non. Eos debitis hic pariatur ducimus.\n\nVero qui nihil ducimus delectus et. Labore dolores sit facilis possimus beatae repellat. Voluptatibus nulla dolor natus voluptas velit. Minus adipisci numquam occaecati sapiente molestiae veniam a. Atque autem pariatur voluptatem eum voluptatum aliquid ut voluptatem.\n\nNeque perspiciatis non nesciunt laboriosam sapiente minima qui. Quod quisquam voluptatem recusandae quia. Iste dolorem officiis quidem accusantium provident ab ut voluptates.', 25704, 34, 1610, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-01-20 02:11:54', '2022-06-13 09:45:47'),
(19, 1, 'Quo minus cumque.', 'quo-minus-cumque.', 'Et perspiciatis sequi sapiente voluptates harum optio sit ut. Ea error dicta vero neque dolores temporibus est. Ut quia at in. Modi fugiat unde repudiandae odio. Natus quas rerum qui qui deserunt eum corrupti.\n\nExcepturi sed saepe et. Pariatur dolor corporis qui itaque. Quibusdam itaque facere aut. Enim unde quod et minus perspiciatis non aut. Eius voluptas nihil repellat fugiat consectetur corrupti tempora.\n\nPorro voluptate ipsam laboriosam dolorem facilis. Ex voluptatum aut rerum amet quis facilis.\n\nLaudantium blanditiis ea eos et. Ab aperiam molestiae et omnis. Consequatur numquam explicabo dolores at. Quasi autem debitis veritatis aperiam sed.\n\nReiciendis ipsum voluptas rem quos perferendis voluptates mollitia. Vero magni aspernatur ad vel sit ea accusamus repudiandae. Qui minima ipsum aperiam voluptas et dolor.', 865033, 22, 3016, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-01-15 21:43:16', '2022-06-13 09:45:47'),
(20, 1, 'Non inventore qui facilis.', 'non-inventore-qui-facilis.', 'Laudantium ea et aut voluptate. Consequatur sed asperiores quod exercitationem. Qui itaque veniam cumque occaecati ipsa voluptates.\n\nQui ad qui expedita voluptas quae quos officia eaque. Odio id amet amet velit illo. Eveniet magnam iusto sit quia dolorem iure. Eaque reiciendis quia facilis fuga minima.\n\nAtque cumque pariatur commodi consequatur repellat. Non consectetur voluptatem et ut eum. Illo et animi corporis mollitia.\n\nNihil officia ad enim quibusdam expedita. Qui ex dolorem animi consequatur vel rerum et. Nam eligendi aut eligendi aut ipsum aut sed saepe.\n\nAut et expedita et voluptas doloribus. Magnam sint molestias nesciunt perferendis quod corporis libero at. Deleniti molestias aperiam ut ut non quis. Harum nulla beatae tempora fuga qui.', 59203, 33, 4724, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-02-01 07:47:23', '2022-06-13 09:45:48'),
(21, 4, 'Officiis dolores suscipit quos.', 'officiis-dolores-suscipit-quos.', 'Et ea et vero. Aut tenetur neque quibusdam distinctio necessitatibus numquam. Ab deserunt eos laborum quo.\n\nRerum ex cum dolorem iure quis. Distinctio iste magni doloribus tempora ut. Omnis minima sunt non accusantium unde.\n\nEt enim magnam quia accusamus alias. Unde ratione tenetur laboriosam ab voluptas sint qui. Sit repellendus at porro tenetur ducimus qui est est. Ea distinctio minus sunt ducimus velit architecto ipsa voluptates.\n\nEt quidem dolor ad amet nostrum suscipit asperiores. Provident eaque nam rerum nulla iure. Dolor laborum consequatur quisquam aut. Molestias hic quam odit eum esse. Consequatur culpa corrupti nostrum labore sapiente.\n\nEt qui at eos magnam similique id. Eligendi doloremque praesentium ipsam velit consequuntur voluptate. Voluptatem itaque dolore veritatis aspernatur vitae. Ut quia debitis officia est.', 39397, 72, 1641, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-07-25 15:16:58', '2022-06-13 09:45:48'),
(22, 3, 'Ullam iste qui.', 'ullam-iste-qui.', 'Voluptatem iure et cum eum dolores ex corrupti. Velit ut saepe nam perferendis ea. Quia sapiente delectus non voluptatem explicabo laudantium.\n\nVoluptatem alias adipisci tenetur voluptatem sint et. Ea laboriosam veniam dicta delectus. Qui dolores quaerat culpa id voluptatem.\n\nIpsum provident accusamus magnam iure eveniet eveniet. Vel nobis eos occaecati a et suscipit. Mollitia consequatur in et culpa vel consequatur. Voluptatem qui enim neque id nisi est.\n\nEarum quia ullam vel aliquid. Facilis et rerum maiores porro rerum. Est sapiente et aut sed cupiditate repellat labore ea.\n\nMolestias facere ducimus harum sunt ipsum nisi. Temporibus facilis ut aperiam dignissimos doloremque. Maxime et aut quae ab sunt vel et. Temporibus omnis veritatis totam eos tempore.', 18496, 20, 3187, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1970-09-09 22:39:38', '2022-06-13 09:45:48'),
(23, 1, 'Et saepe maiores aut.', 'et-saepe-maiores-aut.', 'Ex dolorum ut est cumque. Nihil delectus et pariatur dolorem quo. In nostrum asperiores iste deleniti. Ipsa dignissimos ea doloribus tempora omnis.\n\nQuisquam doloremque modi in placeat incidunt consequuntur nihil. Rem qui non expedita eius. Molestiae at natus et est.\n\nPerferendis aperiam qui est ab a error cupiditate. Provident enim architecto iste necessitatibus maxime est numquam. Consequatur quia eum quam. Maiores esse eligendi quod cupiditate corrupti aut aut. Quisquam est velit rerum nihil.\n\nQuidem est molestiae eligendi esse sequi nemo. Qui voluptatem sequi itaque tempora. Soluta esse excepturi aliquam.\n\nEt amet quo quia et dolores cupiditate. Facere atque necessitatibus et dolores consectetur consequuntur doloribus. Voluptatum voluptatem at eius minima neque sint consequatur.', 622531, 66, 1143, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1972-07-04 00:27:21', '2022-06-13 09:45:48'),
(24, 5, 'Eaque odio et adipisci.', 'eaque-odio-et-adipisci.', 'Sed perferendis quia dignissimos culpa quo quia. Esse et enim omnis omnis aperiam voluptas eum. Eos id et omnis et possimus recusandae. Aut placeat sed eos voluptate.\n\nVelit magnam vitae sed velit eaque. Dolorem quo temporibus nemo voluptates incidunt sint dicta. Et consectetur qui voluptas eligendi aut deleniti.\n\nAutem necessitatibus corrupti beatae quam quaerat. Dicta officia reiciendis ad est alias totam. Unde dolorem reprehenderit temporibus est.\n\nSint fugit tempore totam quo asperiores eaque odio. Non quo natus officia. Modi exercitationem velit et cupiditate molestiae est ex nostrum.\n\nRepudiandae illum ipsum ullam ipsam velit aut fugit. Qui rem modi nihil non. Ut eius illo occaecati ut eius et sed. Qui quia quaerat rem adipisci.', 281658, 7, 1350, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-09-25 14:07:36', '2022-06-13 09:45:48'),
(25, 4, 'Vel sit corporis.', 'vel-sit-corporis.', 'Tenetur in rerum molestiae asperiores aut. Doloremque explicabo voluptatum et ea odio. Et ut voluptas velit.\n\nPariatur blanditiis vitae possimus commodi nostrum nihil possimus. Veritatis hic maxime eaque. Et qui eius est nobis nemo molestias aut. Distinctio a qui vero quae velit.\n\nMolestiae alias aut laborum iusto earum. Ut illum maxime quae. Quas ratione aut quas minima aliquid cupiditate debitis. Omnis delectus vel occaecati eaque ab.\n\nVeniam atque illo enim consequuntur unde. Tempore quidem et adipisci porro eos illo. Sed tenetur et praesentium dicta nesciunt rerum. Reiciendis reprehenderit eos architecto corporis.\n\nFacere in maiores maxime autem. Voluptatibus beatae eos itaque est aut quis. Nam aut non ad perspiciatis. Magnam quos vel adipisci non mollitia cumque.', 886960, 18, 2977, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-11-27 21:58:08', '2022-06-13 09:45:48'),
(26, 3, 'Facilis quia sapiente sint.', 'facilis-quia-sapiente-sint.', 'Et sint sunt iste modi dicta sint dolorum qui. Ipsa assumenda quas suscipit ut qui quo. Dolores consequatur autem deleniti quod. Maxime suscipit facilis possimus soluta sint.\n\nNumquam ducimus fugiat consectetur recusandae non illo et magni. Exercitationem vel asperiores qui sed ut. Eum enim corporis sunt aliquid qui. Ratione et autem odit. Eveniet ab eligendi ad voluptatem neque labore.\n\nAut quia non ipsam in asperiores dolor aut. Doloremque sequi qui voluptates est. Explicabo ratione omnis harum dolores magnam magni. Nihil atque est enim quasi quas beatae.\n\nEst sed blanditiis expedita eveniet natus sapiente. Accusantium voluptatem quasi ut non exercitationem odio. Nulla dolore impedit nihil voluptatibus soluta facilis.\n\nSed molestiae rerum dicta. Et dicta minima dolorum consequatur alias et tenetur ipsam. Dolores facilis natus eveniet laboriosam.', 687732, 34, 2563, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-03-12 07:30:45', '2022-06-13 09:45:48'),
(27, 1, 'Asperiores molestiae eaque.', 'asperiores-molestiae-eaque.', 'Neque quis omnis placeat facilis. Cupiditate dolor fugit voluptatem cumque ab sed aut. Itaque voluptatem non consectetur veritatis. Ipsa ab omnis similique veritatis doloribus.\n\nNostrum molestias culpa quidem dicta. Facilis perspiciatis ratione dicta illum. Esse tenetur ut laudantium et.\n\nTenetur non odio veritatis non. Molestiae cupiditate et quod voluptas illum sint quasi quam.\n\nEt nesciunt consequatur quam eos ipsam id. Doloremque dolor neque odit voluptates aliquam aut qui nulla. Aut nostrum ea ut officia.\n\nAsperiores modi quo ratione quod qui earum ut quam. Dicta debitis aut totam est. Nisi tempore expedita recusandae velit optio numquam doloribus. Quaerat qui et nisi est sequi temporibus.', 385925, 72, 3320, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2001-08-19 11:00:39', '2022-06-13 09:45:48'),
(28, 3, 'Assumenda possimus inventore reiciendis.', 'assumenda-possimus-inventore-reiciendis.', 'Atque qui et nostrum id doloremque ut. Velit at tempore quisquam omnis molestiae porro. Qui maxime aliquid qui vero aut aliquid eos. Ad iusto ducimus omnis ipsa.\n\nPariatur perspiciatis itaque at totam saepe enim aut dolores. Reiciendis quia accusantium ipsa soluta sed. Blanditiis veritatis omnis odio molestiae at corporis ad. Quis nostrum omnis at consequatur sed. Et modi dicta sit sed exercitationem pariatur soluta.\n\nAut est at nulla doloribus vel. Dolor dolorem ipsa exercitationem non. Dignissimos iure aut quasi beatae repudiandae repellat tempora suscipit. A officiis ad velit earum exercitationem.\n\nPossimus ducimus velit quia quos ut blanditiis. Aliquid enim explicabo quisquam ut rerum id est. Officiis pariatur earum ab voluptas illo hic amet. Consequatur ducimus quasi ut eius praesentium.\n\nDolorem est eius nobis tempore dolores nobis blanditiis. Repellendus molestiae odio rerum reprehenderit voluptas officiis. Assumenda voluptatibus adipisci explicabo ut mollitia. Qui ad ut minima molestiae quas quibusdam dolor. Repellendus et aut et voluptatibus enim minus earum.', 894875, 21, 1680, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1984-03-30 23:13:34', '2022-06-13 09:45:48'),
(29, 4, 'Et iure et.', 'et-iure-et.', 'Porro et quia est itaque tempora. Voluptatem ut consequuntur dicta doloribus dolorem.\n\nMagnam quae vel amet asperiores. Sint tempore ex odio enim. Qui voluptatem qui velit. Possimus esse quia non dicta sed a.\n\nEius nam facilis optio provident vero. Et deserunt explicabo officiis est alias non. At veniam consequatur eligendi quia consectetur consectetur.\n\nTempora excepturi iusto esse optio voluptatum id. Deleniti odit ipsam tenetur unde sint nihil. Est aliquid culpa doloremque nesciunt qui expedita repellendus. Nostrum ex consequatur laborum sunt qui voluptas iusto.\n\nUt ea beatae nisi eaque. Omnis maiores enim molestiae adipisci veritatis. Doloremque et et voluptatem in reprehenderit tempora. Voluptatem sit aliquam repellat et adipisci.', 151597, 49, 4147, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2003-11-29 17:08:48', '2022-06-13 09:45:48'),
(30, 1, 'Veniam est ab et qui.', 'veniam-est-ab-et-qui.', 'Nostrum iste ad repellendus maxime eligendi. Quia nam perspiciatis voluptatem eveniet tempora culpa. Beatae recusandae aliquid cupiditate velit illo. Autem aliquam eum dolorum.\n\nHic animi laudantium accusantium quaerat. Cum distinctio aliquid iure harum qui sit. Enim dolor nemo quia voluptas dolores minima.\n\nEos totam est illo non adipisci dolorem. Dolores necessitatibus dolorum consequatur aliquam quia quia. Dignissimos nostrum alias nam. Dolorem praesentium libero esse corrupti ut quia est illum.\n\nVoluptatem sed distinctio adipisci adipisci. Cumque blanditiis nulla optio ullam et ut. Nisi commodi natus non harum.\n\nLaudantium et reprehenderit et mollitia consequatur minus omnis et. Repudiandae consequuntur quas praesentium voluptatem est quia cum. Magni expedita omnis ducimus. Quo fugit explicabo aliquam eius sit officiis.', 253847, 12, 1799, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-07-25 19:52:30', '2022-06-13 09:45:48'),
(31, 1, 'Veniam animi dolor.', 'veniam-animi-dolor.', 'Dolores aut suscipit cupiditate a voluptas. Suscipit hic tempora sapiente non. Quos qui dolorem et quasi deserunt velit rem optio. Magnam voluptatem quia voluptatibus repudiandae animi facilis eius.\n\nEt tenetur dolore sapiente aut. Quia dolore molestiae autem. Nobis assumenda est ipsa maxime. Voluptatem modi et sunt est enim ad incidunt.\n\nSunt facilis distinctio sint omnis explicabo animi quia sint. Animi minus qui id quia. Eius illum reprehenderit quisquam qui ducimus nihil.\n\nSint vitae et aut provident sapiente. Quaerat vitae molestiae ad eum quod sed. Aut perferendis quo excepturi enim accusamus doloribus deserunt. Reiciendis quae aut sit et ullam at.\n\nEum consectetur dolor nulla beatae exercitationem dolorem qui quia. Veniam porro cum suscipit sed.', 38178, 13, 1029, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1994-09-03 03:00:38', '2022-06-13 09:45:48'),
(32, 5, 'Impedit et vel itaque.', 'impedit-et-vel-itaque.', 'Error quis quia vero. Neque praesentium explicabo sunt ea voluptate necessitatibus eos. Quisquam et voluptatem fuga. Architecto itaque voluptatum non hic nemo natus itaque. Esse ut non laboriosam voluptatem tempora ut quae.\n\nSunt sint dolores quasi eum. Eligendi aliquam illum dolor ut sapiente. Pariatur autem quia harum illum iste nostrum. Incidunt eveniet numquam nulla pariatur sed qui voluptatem. Doloremque ea ipsa in aut reiciendis.\n\nAmet perspiciatis rem voluptatibus officiis. Nisi molestiae dolore ipsa atque dolores provident omnis. Et consequuntur sit distinctio qui rem.\n\nEius velit eos nostrum eligendi ut eum vel. Reprehenderit temporibus consequuntur qui eum. Fugit soluta est autem asperiores. Nostrum alias illum et et vero necessitatibus.\n\nDoloremque fugiat porro ab explicabo eum. Tempora odit nulla rerum et ipsam consequuntur consequuntur eligendi. Eum ut vitae voluptatem eius. Quis ducimus nisi veritatis qui quibusdam.', 325571, 52, 4305, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2018-06-11 20:45:45', '2022-06-13 09:45:48'),
(33, 4, 'Repudiandae vero soluta velit.', 'repudiandae-vero-soluta-velit.', 'Sed dolor sequi deleniti sed voluptatum. Aut veniam dolorum cupiditate debitis. Libero eius dicta commodi sequi et.\n\nVoluptatum cupiditate eaque et. Voluptatum animi omnis nihil qui porro repudiandae. Incidunt et ullam dolore delectus aspernatur. Sed maiores est qui corrupti inventore ipsam qui.\n\nDolorem ipsa consequatur et sequi nisi debitis deserunt officiis. Et vero laudantium explicabo voluptas a quidem voluptatem. Id eligendi voluptatem et cupiditate voluptatem distinctio. Sit voluptas totam autem aliquid et rerum ducimus. Ab illum a et voluptatem.\n\nNatus quo aut molestias placeat. Accusantium iusto qui itaque qui sed natus dolorum. Exercitationem esse dignissimos ut rerum fugiat.\n\nInventore voluptatem quia in blanditiis vel. Ipsa nihil non quis est in cumque qui. Ut cupiditate eum maxime fugiat ut laboriosam odit. Cupiditate est quis molestiae.', 43906, 16, 4151, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1972-10-14 18:41:17', '2022-06-13 09:45:48'),
(34, 2, 'Ab quibusdam distinctio voluptas.', 'ab-quibusdam-distinctio-voluptas.', 'Aspernatur necessitatibus dolor accusantium totam sapiente ut molestias. Ea repellendus amet sit consequatur rerum porro qui. Laborum sapiente omnis animi qui. Aut quis error recusandae qui praesentium nemo tempora.\n\nId et qui aut omnis hic omnis. Fuga explicabo adipisci quae nemo. Ut inventore distinctio sit sit sint. Harum id aliquam pariatur provident cumque voluptas.\n\nOmnis ut quisquam et sit necessitatibus aut. Architecto accusamus numquam dicta quia fugit consequatur sunt accusantium. Eum natus laudantium qui reiciendis sunt quis adipisci. Reiciendis quae eligendi est ad nulla quis non. Soluta officiis quod est est ullam repellendus animi.\n\nNumquam qui pariatur totam animi atque illum. Quae aliquam quia similique qui consequuntur dolores. Aut consequatur earum doloremque consectetur fugit eaque blanditiis. At aperiam sed distinctio dolor et repellat vel.\n\nVoluptate est totam blanditiis et. Reprehenderit voluptatibus enim qui in. Deleniti odit impedit fugit. Molestiae labore eius velit sunt.', 111815, 36, 2599, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-09-21 14:30:23', '2022-06-13 09:45:48'),
(35, 1, 'Odio inventore quo consequatur.', 'odio-inventore-quo-consequatur.', 'Rerum rem tempora quasi totam expedita sit. Nihil sit voluptas dolorem dolorem omnis voluptatem non. Et ut consequatur est nisi sunt eaque expedita.\n\nSuscipit libero commodi id veritatis id repellat sint. Rerum aut autem fugiat aut. Voluptatem architecto et quia ea esse occaecati corrupti. Aspernatur quasi repudiandae recusandae omnis.\n\nVoluptatibus quo itaque eum culpa ipsum cupiditate amet et. Quaerat error et dolores quo error quia non aliquam. Molestiae explicabo et rerum doloribus cum. Et eius a qui impedit fugiat molestiae.\n\nIllo consequuntur quae dolor quo. Esse ut aliquid explicabo modi rerum saepe. Soluta quasi aspernatur unde culpa quasi et. Ut occaecati minima eaque qui et et. Qui voluptas cum omnis libero nulla est.\n\nIllum et voluptas qui voluptatem doloremque. Consequatur architecto recusandae recusandae qui ea ut aut. Nihil molestias at voluptates voluptatem qui tenetur. Esse ducimus ut ab rerum. Minus recusandae voluptatem est corporis optio odio.', 234384, 41, 4948, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-08-13 13:21:39', '2022-06-13 09:45:48'),
(36, 1, 'Suscipit quis tempore.', 'suscipit-quis-tempore.', 'Quia minus minus itaque suscipit sed. Sunt illum optio veritatis sint. Eum ratione commodi accusantium sit ipsa sunt.\n\nQui quae et nobis. Et facilis sapiente voluptatem rerum nihil eum. Illo magni laboriosam in qui rerum. Veniam sunt beatae quos repellendus qui expedita.\n\nEnim dolorum voluptas ab quidem ut ad. Laboriosam dicta deleniti reprehenderit amet iste qui est molestiae. Ducimus soluta incidunt est velit. Quas magnam aliquid itaque doloremque eum.\n\nError doloribus impedit et sed culpa ab nostrum. Non aut possimus ducimus quos quia. Recusandae voluptate nihil nisi quas repudiandae quisquam. Fuga repudiandae enim qui assumenda. Qui aut et nihil cum velit impedit est.\n\nCulpa culpa incidunt quis a nesciunt at facere. Expedita aut qui at eligendi. Non laudantium aspernatur fuga dolores. Animi id eveniet quaerat repellendus doloremque explicabo.', 911253, 8, 1915, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-03-05 00:03:14', '2022-06-13 09:45:49'),
(37, 5, 'Ut quam cum.', 'ut-quam-cum.', 'Totam ut minima ducimus tempore ducimus. Et ducimus et magni nemo. Explicabo qui natus aut. Eveniet mollitia sequi ipsa rerum in vel.\n\nMaxime temporibus aut vel atque. Fuga dolor sapiente repudiandae quis animi repellat. Minima quis inventore quod quis voluptas quibusdam. Voluptatibus ad qui consectetur numquam corporis aliquid ducimus dolor.\n\nEum expedita quasi dolorem sit itaque assumenda. Eveniet ut ex sit ratione odit alias dolores optio. Minima unde sed vitae dolorem rerum cupiditate ullam. Esse blanditiis corporis et facere.\n\nQuo autem nostrum soluta provident. Non qui commodi esse fuga accusamus. Dolorum explicabo expedita voluptate reprehenderit. Est quo voluptas quae quisquam.\n\nCulpa placeat quos accusantium corrupti quo quos facere. Officiis doloribus dolor repellat labore laboriosam quidem adipisci et. Quos quam a aspernatur cum ut illo facere. Neque nemo iusto eveniet magni maiores ut in.', 154710, 1, 1693, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-03-01 13:51:46', '2022-06-13 09:45:49'),
(38, 3, 'Nihil fuga consequatur.', 'nihil-fuga-consequatur.', 'Rem atque non fugiat eum. Facere cumque est rerum excepturi. Dolores consequatur provident doloribus exercitationem accusamus ipsa eligendi. Magni esse velit cum dolores.\n\nEaque dignissimos dolorem atque in corporis repellat repellendus error. Dolor vel quis atque consectetur architecto rerum sed ipsam. Autem consequatur porro hic neque voluptates ratione. Iure totam doloribus neque illum voluptas molestias. Assumenda temporibus veniam ut debitis voluptate est.\n\nDeleniti quo minus ipsum modi. Velit asperiores ipsum impedit. Ipsum quia quam ipsum laudantium in ipsum. Et autem animi iure quia harum ut consequatur enim.\n\nEt quos sed at aut minus facilis. Facere voluptas nisi facilis illum optio eos. Autem molestiae est est ut vel dolore. Dolorum iste ipsam laborum eum corrupti.\n\nLabore illum amet illo saepe enim illo. Provident dignissimos rerum consectetur non enim. Reprehenderit eveniet voluptatem neque dolore sint temporibus ea.', 549701, 58, 2173, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-05-24 11:24:13', '2022-06-13 09:45:49'),
(39, 5, 'Dolor temporibus beatae.', 'dolor-temporibus-beatae.', 'Qui autem est quibusdam. Animi fugit ad sint sed. Sit unde ea nesciunt nesciunt deleniti. Rerum sit voluptatem dolore quia voluptas.\n\nSapiente est magnam sequi et molestias. Dolorem amet enim est ratione exercitationem rem. Quis architecto quas placeat.\n\nIure quos minima laboriosam voluptas qui. Repellendus et fuga sint aspernatur est consectetur a. Quis in dignissimos fugiat ex perferendis qui. Veritatis quidem ipsam quo. Blanditiis neque et sunt laborum occaecati corporis qui.\n\nUllam sunt in doloremque qui. Ut qui in doloribus dolores corporis similique et. Molestiae sit commodi delectus ut consequatur non quisquam. Quam odio velit eligendi itaque cumque omnis occaecati quis.\n\nAut exercitationem consequatur accusamus natus. Rem voluptatibus nihil distinctio molestias in.', 533434, 40, 1518, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1974-03-16 05:37:27', '2022-06-13 09:45:49'),
(40, 1, 'Dolores voluptatem accusantium ex.', 'dolores-voluptatem-accusantium-ex.', 'Odio eius molestiae repellendus unde aut nulla. In et consequuntur voluptatem. Eveniet nesciunt nisi veritatis id quo et delectus. Sed ex ut dolor provident aut tempore inventore eos.\n\nUt ducimus voluptatum itaque sed corrupti in. Vel sequi quis dolor mollitia ut explicabo in. Doloremque dolorem laborum libero aperiam facere.\n\nDolorum ut recusandae libero repellat error quis et. Corrupti necessitatibus nulla nihil nihil veniam qui. Unde ipsa quas laboriosam odit.\n\nCorporis in perferendis ex eveniet laudantium soluta sit. Commodi suscipit voluptatem eos. Rerum modi qui nihil. Asperiores quas veritatis rerum ipsam ut.\n\nEt quos totam ut ut accusantium rerum voluptas. Commodi placeat eius ad. Dicta animi sint est et qui ea voluptas.', 46159, 59, 2760, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-09-10 07:09:17', '2022-06-13 09:45:49'),
(41, 5, 'Molestiae soluta sint incidunt.', 'molestiae-soluta-sint-incidunt.', 'Voluptatibus atque nihil voluptates vel rem officiis. Qui officiis optio est ducimus. Possimus ullam reprehenderit reiciendis velit delectus rerum.\n\nArchitecto velit iure et quae earum sint. Autem aliquam modi dolorem eligendi aspernatur. Fuga iusto neque dolor voluptatem accusamus.\n\nVel porro nesciunt ut quis praesentium suscipit. Distinctio aut et voluptatem aut libero.\n\nMolestiae animi aut dolorem quis perferendis qui voluptas. Aut animi vero a tenetur voluptas officia. Sunt et architecto non nobis. Qui illo culpa quidem iusto molestiae possimus autem.\n\nConsequuntur quibusdam ducimus autem debitis voluptas rerum ea. Omnis amet et dolorum. Ut ipsa impedit non esse ullam est omnis sapiente.', 269014, 58, 1229, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-12-01 07:57:54', '2022-06-13 09:45:49'),
(42, 3, 'Qui quo dolor impedit soluta.', 'qui-quo-dolor-impedit-soluta.', 'Iste aut earum optio quia. Mollitia consequuntur aspernatur autem suscipit qui. Quis vero ex soluta blanditiis aut ad dolore. Qui repellat explicabo dolor cumque praesentium quia.\n\nLaborum laboriosam non voluptas ipsa similique quidem. Et iusto quo voluptates nostrum blanditiis accusamus. Et quibusdam commodi dolor laborum odio eos optio laborum. Laboriosam fugiat officiis sit.\n\nItaque quo totam sed sint. Dolores et debitis ut accusantium. Dolorem asperiores est labore non dolore.\n\nExercitationem illo quis eligendi enim quasi amet velit. Et consectetur voluptatem beatae eos ad voluptate rem. Labore quidem ut dolorem vero. Eveniet officia a veniam reprehenderit.\n\nNostrum fugiat delectus adipisci temporibus. Enim cum atque hic doloribus magnam commodi. Sunt ea itaque alias aut. Illo sunt autem atque.', 366522, 57, 4383, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2016-09-04 08:08:14', '2022-06-13 09:45:49'),
(43, 5, 'Porro in assumenda debitis.', 'porro-in-assumenda-debitis.', 'Aut rem explicabo totam libero suscipit provident sit. Omnis voluptatibus et a perspiciatis culpa. Ipsa quia similique aperiam eum.\n\nNecessitatibus tenetur minima corporis fugiat officiis. Pariatur cum nam vero voluptatem est rerum. Qui reprehenderit aut molestias quae possimus. A recusandae molestiae qui error illo deserunt.\n\nAutem id veritatis blanditiis tenetur sit culpa soluta voluptas. Fugit non odit non alias rerum. Consequatur quia debitis nihil hic aliquam modi sint. Placeat impedit sint sunt aspernatur. Ut possimus repellendus ut rerum ducimus consequatur delectus.\n\nIllum amet nostrum quis voluptatibus. Quae debitis animi consectetur nemo. Non harum voluptate consequuntur ut voluptatem. Quisquam non totam voluptas voluptatibus eum et. Tempore doloremque cumque quia ratione consequuntur ex quasi.\n\nId eum corrupti rerum nesciunt id earum. In reprehenderit voluptatibus consequuntur. Dolorum similique qui et soluta id et maiores.', 718095, 72, 4656, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-02-05 22:10:06', '2022-06-13 09:45:49'),
(44, 5, 'Quia tempore iste qui.', 'quia-tempore-iste-qui.', 'Nemo animi tenetur consequatur illum voluptas. Fuga deserunt quisquam cupiditate autem optio. Pariatur labore qui qui culpa aperiam. Iure impedit qui molestiae porro dolorum.\n\nQui non commodi laudantium est quasi facere numquam nobis. Esse consequatur deleniti accusamus eum non dolorum. Et soluta eum consequatur eum magni rem dolores.\n\nDignissimos vel dolores sed esse impedit optio sapiente porro. Numquam ut corrupti voluptas possimus. Placeat quo veniam fugit dolorem. Illo et eligendi velit est.\n\nIllum magni aliquid et autem saepe et est. Sed omnis tempora qui officiis quae porro et sunt. Ullam magni alias ducimus ex esse voluptas. Ducimus dolorem qui reiciendis quia et itaque.\n\nEx illo laudantium doloribus. Quam et aut cupiditate repellendus sed quia. Nemo incidunt porro mollitia aut possimus.', 90687, 10, 3665, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-02-04 11:00:24', '2022-06-13 09:45:49'),
(45, 2, 'Ea unde qui.', 'ea-unde-qui.', 'Aut ducimus molestiae nobis id ipsam at consequatur. Consequuntur sit sunt consequatur. Iure qui et fuga perspiciatis dolorem deleniti. Est consequuntur laboriosam molestiae et rerum alias sapiente vero. Error facere doloribus earum esse et.\n\nFugit consequatur autem provident dolorem quia est et eum. Numquam illo corporis ratione quia voluptatum. Porro incidunt vel autem velit illo consequuntur.\n\nReprehenderit modi minima quis minus sit. Eligendi nam cupiditate alias soluta ut. Debitis qui dolor laboriosam consequatur officiis. Fugiat eveniet qui adipisci sunt adipisci tempora voluptas illum.\n\nEum molestiae sapiente quos hic non rerum minus. Sit eaque rerum voluptas necessitatibus nostrum voluptas magni. Impedit numquam omnis necessitatibus in aliquid a quo. Ab aspernatur quia ut quam atque id autem.\n\nIllum nihil qui architecto ut eos perferendis labore. Saepe ut et velit nemo. Expedita pariatur qui ut alias odit. Dolorum porro possimus laudantium ducimus ab optio possimus rerum.', 663297, 37, 4182, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1976-03-19 18:29:17', '2022-06-13 09:45:49'),
(46, 4, 'Pariatur id aut.', 'pariatur-id-aut.', 'Atque ipsam eum iure et magni. Sed voluptate itaque est fugit. Atque quisquam quae consequuntur reiciendis autem aspernatur sed.\n\nUt labore nobis atque beatae qui. Ut velit nihil quidem beatae. Repellendus quae ex incidunt. Quia vero ipsum enim aut.\n\nMagni sed saepe ut inventore consequatur dolores est. Sint vel quia tempora delectus quae commodi quod. Quidem placeat eum odit modi corrupti quia. Dolorem voluptate explicabo nobis ut veritatis error a.\n\nDolores sed quo explicabo blanditiis necessitatibus. Similique optio beatae corporis quo pariatur. Eos quia accusamus non et fugiat. Odio eum consectetur nesciunt ratione pariatur.\n\nNon eos quia nemo doloribus occaecati incidunt. Doloribus ipsa quaerat qui deserunt eligendi eum velit.', 812159, 52, 3090, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1973-11-07 20:41:27', '2022-06-13 09:45:49'),
(47, 2, 'Sapiente sint amet aut.', 'sapiente-sint-amet-aut.', 'Dicta illo nam ut eos. Sint dolorem blanditiis quam perspiciatis distinctio delectus fugit qui. Cumque quos alias repellat laboriosam mollitia. Nihil doloremque laudantium et aut vel sed aut.\n\nMaiores rerum voluptatem praesentium aperiam harum exercitationem sunt. Et molestias aliquam nulla sit qui id. Adipisci culpa rerum excepturi rem hic ut.\n\nNostrum autem adipisci sed dolor eveniet quis necessitatibus. Distinctio omnis enim cum reprehenderit. Excepturi sint dolores recusandae quis beatae maiores aut. Non voluptas ut quasi reprehenderit. Temporibus asperiores qui in dolorem et dolorum dolor numquam.\n\nIpsam quia voluptas at est. Earum quia laudantium ducimus reiciendis quidem necessitatibus maiores. Nemo dolor et a iste.\n\nSapiente possimus laudantium eos repellat voluptas quibusdam. Est quaerat officia amet et ut. Omnis itaque culpa sed quia tenetur minima et.', 295612, 65, 1497, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1972-09-30 16:20:01', '2022-06-13 09:45:49'),
(48, 5, 'Aperiam facilis.', 'aperiam-facilis.', 'Aut nostrum illum voluptatum. Vel quo nostrum velit est fugit ea totam. Cumque fugiat explicabo est expedita dolore. Delectus doloribus voluptatem repudiandae error porro.\n\nDeleniti numquam sunt ea voluptates. A est quia recusandae laborum quibusdam modi. Omnis ipsam non consequatur ipsa voluptatem quia nam.\n\nQuae doloremque et magnam magnam. Tempore pariatur quidem error quo. Qui et veritatis exercitationem id molestias debitis.\n\nEt velit dignissimos eligendi unde quia asperiores dolores. Iusto rerum officia rerum quis non beatae. Tempora libero asperiores sed voluptatem odit ut dolor ratione. Autem quia incidunt est sunt necessitatibus vel unde.\n\nIllum aut praesentium placeat commodi voluptas autem eum rem. Assumenda a placeat quis sapiente voluptatem. Voluptatem aut et error quo. Dicta incidunt dolores dolor sed quisquam ipsum laborum.', 301198, 17, 4376, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2016-05-27 12:41:28', '2022-06-13 09:45:49');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `detail`, `price`, `discount`, `weight`, `stock`, `image_1`, `image_2`, `image_3`, `sold`, `created_at`, `updated_at`) VALUES
(49, 1, 'Omnis mollitia omnis.', 'omnis-mollitia-omnis.', 'Provident nihil consequatur et laudantium dolores. Perspiciatis quibusdam expedita qui cupiditate. Sapiente odio ab accusamus quo aperiam. Consectetur quia quam ut et.\n\nAccusamus in cum odit voluptatem. Asperiores asperiores optio perspiciatis ea dolor dolorem non sapiente. Autem inventore non ut iure placeat. Vitae suscipit hic cupiditate. Eos id optio deserunt molestias.\n\nMinus ex dolores suscipit quasi. Labore animi commodi ipsum odio et.\n\nEst quia earum sapiente sed accusantium et qui itaque. Fugiat iusto deserunt quisquam velit. Quas tempore aut fuga magnam officiis.\n\nEt quia aliquam sint quas. Molestiae atque voluptatem et iusto reiciendis laborum ipsam.', 32939, 1, 2230, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1998-08-19 07:22:58', '2022-06-13 09:45:49'),
(50, 5, 'Itaque quaerat nemo dolorem.', 'itaque-quaerat-nemo-dolorem.', 'Sed corporis sed aperiam in quas. In illo aut tempora aliquid sequi omnis dolore. Id voluptatum aut veniam id. Placeat sit dolor temporibus fugit facilis delectus.\n\nVoluptatem laudantium architecto hic quae qui in at. Ad voluptatem repudiandae sint aut consequuntur. Qui sed beatae iste a occaecati. Voluptatibus corporis ut rerum consequatur et atque qui. Quas voluptatem debitis et est dolor repellat ut.\n\nAut est cupiditate reprehenderit commodi adipisci sint. Maxime dolorem qui est suscipit. Adipisci et quod aut aliquid commodi ipsam consectetur.\n\nCulpa nisi exercitationem dolor debitis. Autem maxime doloremque ab unde consequatur. Ut corporis rem optio consequatur asperiores facere ipsum natus.\n\nMolestiae reiciendis labore itaque necessitatibus. Odio perferendis dicta illo quasi ut. Minus at ducimus sed dicta. Qui debitis nesciunt dolorum sunt.', 81382, 50, 4832, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1984-03-29 05:44:38', '2022-06-13 09:45:49'),
(51, 1, 'Impedit sed totam vitae.', 'impedit-sed-totam-vitae.', 'In corrupti accusantium iure voluptatibus dignissimos est. Dicta molestiae iure in dolorum consequuntur soluta. Reiciendis maxime odio quidem consequatur.\n\nPerferendis amet ut sunt. Alias harum aut consectetur id qui similique. Doloremque est vero ut aut autem debitis incidunt.\n\nDebitis velit nobis sit debitis. Quod et omnis et totam alias. Ullam voluptas reprehenderit tenetur reprehenderit nisi ut omnis.\n\nRerum et qui quis ipsa omnis iste. Non similique occaecati incidunt ratione esse. Aut fugit voluptatem deserunt earum autem. Earum minima non veniam deserunt illo.\n\nId quidem non quibusdam est aut. Dolore rem est nemo necessitatibus. Praesentium maiores est saepe et praesentium nostrum. Temporibus in nulla molestiae quia doloremque sed.', 746459, 16, 3235, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-07-15 12:45:53', '2022-06-13 09:45:49'),
(52, 5, 'Dolores est repellendus.', 'dolores-est-repellendus.', 'Cupiditate animi autem ut consequatur nihil architecto voluptatem. Vero pariatur quia tempore. Nihil quae modi consequuntur officia.\n\nDolores non error excepturi aliquam perspiciatis. Dolores ipsam consequatur et qui nihil ea.\n\nEx ut quia neque pariatur. Et voluptas aut modi quia dolore aut. Cupiditate aut iste iure ea. Sequi quasi error sit odit.\n\nEnim tenetur voluptate incidunt ab odit. Exercitationem error in ullam quo. Tempora non iusto accusantium vel facere nemo nisi. Excepturi ut dolore consequatur et eos illo.\n\nExercitationem magni officia ea veniam totam. Quia iusto similique qui vero ipsum architecto. Nostrum asperiores eius aspernatur quod non. Omnis est quod id exercitationem beatae.', 341180, 24, 2480, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2003-03-10 17:52:01', '2022-06-13 09:45:49'),
(53, 4, 'Quia dignissimos dolorum velit.', 'quia-dignissimos-dolorum-velit.', 'Sunt omnis ut corporis maiores dolor neque maxime. Accusantium aliquid mollitia doloremque cum iste suscipit ab. Voluptas odio nostrum reprehenderit ratione consequatur nulla perferendis.\n\nNulla qui expedita dolore minima. Et dolor accusamus dolor qui. Libero corrupti nihil cupiditate laudantium incidunt culpa.\n\nIpsum harum quos tempora. Aut est quam tempore recusandae facere iste. At rerum magnam enim et. Et sint expedita sapiente rerum in architecto.\n\nDebitis ipsum facere et et omnis ut. Placeat quia maxime necessitatibus sit. Assumenda modi perspiciatis voluptatum qui consequatur non qui.\n\nBeatae consequatur rerum provident ipsa minima magnam sunt. Enim aut aut error sint occaecati esse aut. Rerum quaerat velit quia quasi quis nam.', 984994, 59, 1251, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1975-10-17 06:43:52', '2022-06-13 09:45:49'),
(54, 1, 'Et iusto ut.', 'et-iusto-ut.', 'Suscipit iusto optio nesciunt. Veritatis dolores nihil ut necessitatibus. Tempora odit debitis ullam molestiae sed quod.\n\nAperiam tempora aut officiis illum. Ad temporibus sed autem ullam aut velit quia.\n\nNon consequatur optio facilis reiciendis itaque. Et exercitationem quam nobis ea in sed esse. Iure in sunt libero enim quaerat. Magnam id et voluptas sit dolores.\n\nQuaerat in nulla et voluptate animi provident. Impedit sed ullam quasi rem. Ad dignissimos commodi qui nihil porro molestias.\n\nUt reiciendis a aspernatur quia in. Nisi et iste minima. Possimus ipsum quas voluptatum corporis aperiam alias. Nemo sunt est cum.', 991154, 65, 1658, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-05-30 13:55:19', '2022-06-13 09:45:50'),
(55, 3, 'Quae sunt modi et.', 'quae-sunt-modi-et.', 'Deserunt aut ad sed laboriosam. Dolor fugiat ex commodi amet vel. Aperiam et rerum repudiandae sed voluptatem odio reprehenderit.\n\nNihil quia quis autem dicta repudiandae. Aspernatur ipsum architecto voluptatem voluptatem unde error neque eos. Sed consequatur nesciunt qui sit quas.\n\nError qui repellendus dolorem. Eum repellat sint hic minus quia. Sunt id veritatis inventore quo.\n\nEligendi quia illo perspiciatis assumenda harum rerum ea. Necessitatibus autem ut dolores qui impedit. Quia quasi officiis laboriosam fugit. Velit dolor quis sunt aut qui.\n\nVoluptas voluptatum aut ratione natus et ipsum a. Minus enim aut eum harum fugit. Saepe ex velit quasi inventore.', 280076, 33, 4208, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2005-07-18 21:08:21', '2022-06-13 09:45:50'),
(56, 2, 'Odit maiores quae libero.', 'odit-maiores-quae-libero.', 'Sint aliquam omnis nulla voluptatum quae quasi itaque. Commodi commodi id adipisci earum dolor molestias similique repellat. Et ducimus voluptatem sed. Aut esse et consequuntur ipsa asperiores minus.\n\nNihil nemo quas autem adipisci et et quia. Ea sint et omnis voluptatem soluta quisquam molestiae aut. Laboriosam enim quasi repellendus aut aliquid. Optio illo ipsa minima vel dignissimos autem amet.\n\nAmet ducimus eveniet rerum pariatur maxime nesciunt. Similique voluptatum in molestiae mollitia. Minima eaque nam debitis eos omnis possimus.\n\nEt pariatur doloremque laboriosam recusandae. Iste doloremque dolorem aspernatur nulla praesentium alias repudiandae. Rerum ipsa quia nihil.\n\nSunt ut eius dolorem voluptatum vel explicabo odit quasi. Id nihil officia voluptatem. Vero incidunt fugit sed eligendi neque inventore. Laboriosam voluptates at quis veritatis rerum repudiandae earum.', 859711, 18, 4994, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-06-27 12:47:16', '2022-06-13 09:45:50'),
(57, 4, 'Unde et maxime iure.', 'unde-et-maxime-iure.', 'Tempore consectetur error dolores qui architecto nihil. Vel non tempora maiores ipsam quia qui doloribus. Quas numquam ipsa maiores dolorum sunt sunt corrupti.\n\nCommodi nihil adipisci magnam earum quia. Ratione expedita rerum dolorum sunt minima nesciunt expedita. Voluptatem alias enim blanditiis earum doloribus magnam.\n\nPorro dignissimos assumenda voluptas dolor commodi enim iusto accusantium. Odit sunt dolores itaque. Voluptatem recusandae et tempora nostrum in ea harum. Sunt facere aperiam et occaecati aut.\n\nNulla distinctio quia ab provident. Consequuntur molestias quaerat unde dolorem assumenda. Magni omnis culpa et vitae repudiandae est.\n\nPorro soluta architecto porro consequatur. Repellendus aut qui distinctio quis blanditiis nesciunt repellendus iure.', 373576, 11, 3974, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-03-19 03:48:18', '2022-06-13 09:45:50'),
(58, 4, 'Voluptatem quo et.', 'voluptatem-quo-et.', 'Et harum sapiente itaque voluptatem. Aut voluptatem ea quia ratione. Voluptates occaecati enim molestiae nihil vero illum.\n\nOdio ab doloribus ex et sit qui id. Vel impedit veritatis beatae molestias dignissimos omnis architecto. Placeat explicabo atque laboriosam fugiat tempore suscipit voluptas.\n\nAut ducimus quo ad nemo error totam. Magnam qui commodi commodi non libero facilis ut dolorum. Earum at quia eum architecto dolorem ipsam. Sit fuga et explicabo enim.\n\nEst sint est aut earum voluptas nam non. Nobis nostrum pariatur blanditiis. A repudiandae ea architecto velit et aspernatur recusandae optio. Eaque qui ut expedita aut quia magni.\n\nAsperiores beatae aut nulla accusantium enim minus rerum. Assumenda quia sed aliquid et praesentium quo qui. At voluptatem non ab aperiam.', 125672, 48, 1460, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-04-29 09:11:39', '2022-06-13 09:45:50'),
(59, 4, 'Exercitationem sint quis.', 'exercitationem-sint-quis.', 'Placeat aperiam doloribus ut et. Ea et inventore consequatur. Rerum deserunt quasi culpa cumque atque.\n\nMolestiae est consequuntur aut. Id quia et omnis enim consectetur. Qui aut ut distinctio libero.\n\nEt officiis aut eum architecto. Aut ipsa officia voluptatem quaerat ipsum natus.\n\nError sit tempora aut itaque est libero voluptatum illum. Rerum aut illo at sed ut minus. Laudantium repellendus cumque sit et expedita et distinctio.\n\nNisi omnis et magni rerum. Possimus rerum enim ea optio culpa tempora. Consequatur voluptates maxime beatae corrupti sed tempora assumenda.', 677326, 60, 3365, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-04-04 14:39:55', '2022-06-13 09:45:50'),
(60, 5, 'Ipsam harum nihil.', 'ipsam-harum-nihil.', 'Quos pariatur impedit nobis odit recusandae. Temporibus sequi sed eaque iure nemo ut perspiciatis. Id eveniet distinctio architecto ea natus molestiae temporibus modi. Corporis omnis provident commodi ullam consectetur quia.\n\nUt et ad est aut consequatur voluptate vel. Maiores id qui non eum suscipit. Numquam nihil quis modi nulla numquam quis ex.\n\nNihil eum quia enim et reprehenderit sed magni. Eveniet odit quas libero doloremque sit laborum cumque. Perferendis est et quia numquam ea ducimus.\n\nEst ipsa dicta laborum odio sed aliquid. Sit atque minima aperiam aut sint debitis ex. Earum culpa consequatur quam natus cupiditate quisquam quos. Quam facere numquam praesentium dignissimos.\n\nSed autem fugit in facere. Est quasi aut voluptas dolorem dolor dolores. Deserunt qui eos culpa est sit labore sit nihil.', 996187, 73, 3766, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2021-03-11 20:36:47', '2022-06-13 09:45:50'),
(61, 5, 'Voluptatem sint facere omnis.', 'voluptatem-sint-facere-omnis.', 'Enim molestias possimus reprehenderit omnis eos. Quia et dolor debitis quasi culpa architecto. Libero quos et aut ut delectus alias. Nobis porro voluptate recusandae laudantium facere culpa.\n\nEx iste quae natus dicta repellendus iure inventore et. Voluptas quod id repudiandae vero occaecati ipsa voluptatibus. Ex iste at excepturi earum illo debitis.\n\nRecusandae consequatur velit sit qui soluta. In enim omnis consequatur ut. Porro est esse expedita maxime minima saepe dolorum. Commodi iure voluptatem perspiciatis vero dolore illum.\n\nBlanditiis commodi dicta qui non debitis rerum. Dolorem eum sed nesciunt ut eaque corporis voluptas. Incidunt quis ad eos ut nesciunt deleniti. Hic quasi fuga laboriosam voluptas atque et quaerat fugiat.\n\nQuis hic saepe neque eveniet voluptatem. Nulla eligendi sit quis sed et in. Et rerum suscipit eius recusandae quaerat earum non exercitationem.', 694851, 46, 1542, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1975-12-13 19:42:27', '2022-06-13 09:45:50'),
(62, 1, 'Provident eveniet omnis rerum.', 'provident-eveniet-omnis-rerum.', 'Quia aut fuga et et dolorum quos modi. Molestiae molestiae rerum omnis debitis sit assumenda rerum. Voluptas eaque est non expedita.\n\nEum ducimus voluptates eum vero. Quia dolor est nihil eaque error recusandae voluptas. Omnis eum est nostrum qui reiciendis et qui. Omnis earum distinctio eaque necessitatibus. Distinctio hic eum ut eius repellat error iste.\n\nEos et qui tenetur similique. Voluptate dolorum soluta corporis rerum. Libero quam voluptate repellat expedita.\n\nUt voluptatibus facere aut distinctio sed quia. Qui reiciendis molestias sint aut sit. Quae et et odit officia et. Quo voluptatem rerum perferendis optio.\n\nQuisquam explicabo ut minus. Et eius voluptas earum laborum dolorem deserunt. Vero sed ut impedit dolor ab qui repudiandae. Omnis quod vero fugiat cum porro.', 965058, 7, 4372, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1996-05-09 20:32:42', '2022-06-13 09:45:50'),
(63, 5, 'Qui dolor rem accusamus.', 'qui-dolor-rem-accusamus.', 'Maiores voluptatem maxime sunt dolor eum tenetur sed eum. Ex id rerum voluptas sit dolorum ut voluptate. Temporibus eligendi harum sint quia est doloribus temporibus dolore. Minus aspernatur totam ut nostrum cum et.\n\nDebitis eum reprehenderit dolores sed fuga nihil natus qui. Eveniet eos ut quas provident.\n\nReiciendis delectus dolor nemo dolorem. Vel est laborum qui quaerat. Nesciunt cum dolor corrupti et.\n\nPlaceat expedita sit dolor minima. Magnam asperiores ut molestiae voluptatem aliquid. Et assumenda ducimus quos ab omnis. Deleniti sapiente eum numquam sequi.\n\nVeniam voluptatem reprehenderit neque id consequatur. Quam doloribus eveniet esse et velit. Et ex sequi et quaerat culpa consequatur. Amet et laborum laudantium ipsa commodi odit.', 23539, 18, 1022, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2016-05-20 00:53:03', '2022-06-13 09:45:50'),
(64, 3, 'Repellat exercitationem similique voluptatem.', 'repellat-exercitationem-similique-voluptatem.', 'At necessitatibus vitae culpa eum voluptatem deserunt. Aut et fugiat alias culpa. Quasi sed ea quo nisi laboriosam.\n\nRepellendus dolores omnis dolores pariatur aut. Doloribus perspiciatis nihil repudiandae exercitationem. Animi et harum nobis id consectetur cupiditate. Qui non aut amet ex blanditiis quia quasi. Dolor blanditiis quaerat reprehenderit non doloremque laborum reprehenderit.\n\nUt vel ut est expedita esse nulla. Ex perferendis nesciunt quia incidunt maxime et et. Adipisci magnam molestiae quia voluptatem qui fugiat. Est pariatur harum modi. Accusamus earum ducimus facilis odio.\n\nIpsum possimus consectetur omnis id. Qui porro id sit consequatur dolore harum. Dolores quisquam non delectus sint ad.\n\nEt aut illo nesciunt odio voluptate in eius. Ab eveniet magnam veritatis voluptas. Maiores suscipit autem soluta error neque.', 691912, 33, 2417, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2004-04-23 00:55:36', '2022-06-13 09:45:50'),
(65, 4, 'Aspernatur ea.', 'aspernatur-ea.', 'Error incidunt at possimus nulla voluptatum doloribus quibusdam. Molestiae corrupti et et. Facere eum sunt delectus sed ab inventore.\n\nEa aut animi itaque animi similique eos. Quo quibusdam veritatis aliquam vitae eaque earum. Ratione nostrum omnis est excepturi. Aperiam quibusdam vel quisquam.\n\nProvident ut id omnis delectus voluptatum velit reiciendis qui. Sed ut dolor ea esse corrupti quod. Sed in rem tenetur et eum iste natus. Quaerat esse minima et eaque.\n\nEos dolor qui culpa consequatur possimus. Amet quia distinctio ducimus rerum qui ipsum. Ut repellat qui architecto distinctio animi natus.\n\nQuia iure ut dolor. Non recusandae esse debitis cumque distinctio dolorum. Eligendi qui nemo fugiat aut sequi facere rerum.', 983636, 32, 2396, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2018-09-18 21:15:43', '2022-06-13 09:45:50'),
(66, 2, 'Est qui libero.', 'est-qui-libero.', 'Deleniti impedit ea et laborum. Aut tempora ad doloremque adipisci et qui ut consectetur. Quasi facilis modi nihil dolores. Tenetur rerum et tenetur qui.\n\nTemporibus sed reprehenderit quae consectetur nemo. Fuga alias et tenetur hic. Expedita vel ad earum voluptatem dolores tempore. Rerum optio consequatur et veritatis sit.\n\nQui eos dolor commodi distinctio. Dolores adipisci ut delectus quam. Sed id quia incidunt numquam. Aut dolor nam eveniet dolor.\n\nUt est vero rerum. Esse unde nulla nihil odit.\n\nAut totam iste ut unde quis sunt optio. Voluptatem cupiditate temporibus praesentium alias ducimus. Enim accusamus corrupti et similique. Voluptatum molestias voluptatem et modi unde.', 924028, 61, 1929, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1987-02-19 20:54:49', '2022-06-13 09:45:50'),
(67, 4, 'Veritatis est quidem saepe beatae.', 'veritatis-est-quidem-saepe-beatae.', 'Quis non qui dicta eaque. Incidunt et nemo et sunt. Et id quo assumenda cupiditate id placeat.\n\nVoluptas voluptatem repudiandae ut tenetur rem et similique et. Cupiditate quod voluptatibus dignissimos harum eveniet dolores commodi non. Nihil nihil blanditiis debitis iste fugit et.\n\nNumquam architecto quis consequatur ab aut rerum velit. Laboriosam quis magni et ducimus ut molestias. Vero enim nihil pariatur suscipit voluptatem illo. Voluptate omnis necessitatibus deleniti eos voluptatum.\n\nEligendi eveniet laboriosam quo iusto omnis suscipit voluptatem incidunt. Aspernatur ut sunt nulla ipsum excepturi consequatur. Ut enim accusantium molestiae dolor ullam eius.\n\nSit recusandae ullam provident minus a. Corrupti vero nulla asperiores aut voluptas libero. Ut voluptate non incidunt repellendus non culpa qui. Voluptas quo amet ipsa dolorem eligendi veniam et impedit.', 63691, 68, 4251, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1991-10-13 07:08:23', '2022-06-13 09:45:50'),
(68, 4, 'Autem est consequatur.', 'autem-est-consequatur.', 'Dolorem quis magni alias. Non dignissimos quia quas aut. Omnis voluptatem voluptatem nisi beatae vel laborum. Quis odio sapiente harum dolorem dolore aspernatur.\n\nFugit quibusdam accusamus minus iusto. Quaerat eveniet a excepturi omnis rem aut. Beatae sunt non dolor. Voluptas quae perferendis nesciunt et quaerat vel. Ut quasi sed nesciunt ea.\n\nQuas eum illo dolorem dolorem error ipsam eum aperiam. Nihil nisi ipsam ad aliquid sint iure ut. Temporibus totam aliquid sed et quia vero. Voluptates dolores eius molestiae id illo ducimus et.\n\nAccusamus eius dolores molestiae nobis accusantium qui. Quas ut fuga aperiam. Ex molestias blanditiis necessitatibus et magnam ut consequuntur.\n\nEnim at deserunt quia et. Eum enim sit quidem aut illo ut a.', 361878, 6, 3463, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-01-28 11:09:25', '2022-06-13 09:45:51'),
(69, 2, 'Consequatur quibusdam quis sed est.', 'consequatur-quibusdam-quis-sed-est.', 'Laborum ut voluptas sed iure consequatur. Quaerat sed modi ex omnis. Odit iste tempora beatae deserunt optio. Doloribus voluptas qui et possimus quas quidem nobis.\n\nMolestiae possimus consequatur est rem vero qui suscipit. Vero molestiae nihil ex perferendis aut et qui quis. Ipsam illum facere reprehenderit praesentium consequatur rerum.\n\nIure ut aut perspiciatis beatae. Molestiae saepe libero possimus expedita quo numquam qui odio. Quas culpa odit non.\n\nQuia omnis sint ab necessitatibus ab. Odio rerum cumque tempora qui sunt distinctio aut. Id impedit quia omnis voluptatem.\n\nEaque repudiandae reiciendis nesciunt iste explicabo repellendus. Pariatur quasi voluptatem cupiditate.', 547561, 74, 2706, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1977-02-03 17:28:15', '2022-06-13 09:45:51'),
(70, 2, 'Sunt ut rem voluptatem doloremque.', 'sunt-ut-rem-voluptatem-doloremque.', 'Quibusdam aspernatur nisi inventore illo fugit illo eius. Voluptatem facere excepturi labore eos possimus. Laborum repudiandae rerum sed qui debitis. Ratione provident adipisci sunt dignissimos earum.\n\nUt voluptatibus enim dolores perferendis quibusdam eaque rerum. Aspernatur sed ratione distinctio et. Et id error voluptates et omnis ullam. Officiis architecto quae voluptates in recusandae qui soluta.\n\nTotam deserunt quasi sed dolorem et vero molestiae. Nihil autem aut nihil et. Facilis qui velit beatae necessitatibus eum voluptatum.\n\nQuia beatae ea perferendis nam sunt molestiae est. Dolorum qui quae quidem et molestiae aut sunt. Porro rerum earum dolor animi tempora adipisci at. Dolorem aliquam rem facere enim delectus nesciunt odit.\n\nDelectus ullam optio tempore excepturi veritatis natus nesciunt. Vero omnis vel in quisquam odio. Consequuntur eum voluptatem ipsam reprehenderit voluptate et consequatur.', 635437, 74, 2663, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1994-08-13 23:07:48', '2022-06-13 09:45:51'),
(71, 2, 'Voluptatem aperiam.', 'voluptatem-aperiam.', 'Harum eum tempora ut pariatur. Aperiam sint blanditiis cum id. Dolorum saepe laboriosam rerum voluptatibus voluptas.\n\nFacilis ipsam consequatur dolore deleniti quaerat optio culpa. Consequatur tenetur voluptates pariatur asperiores numquam consequatur totam. Blanditiis qui distinctio doloribus mollitia eveniet accusantium laudantium.\n\nVel dolor non ipsa quia sapiente. Eligendi animi non aliquid. Animi optio tenetur dolores veritatis doloremque aut esse.\n\nSed ut voluptas accusantium. Quam et aut provident. Assumenda eum ex fuga et provident dolores.\n\nSit laudantium non et quasi. Eum ut corporis et explicabo. Et quibusdam corporis delectus consectetur. Ut quo eaque iste culpa.', 91320, 58, 1625, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2013-03-11 23:29:34', '2022-06-13 09:45:51'),
(72, 4, 'Labore voluptas nam.', 'labore-voluptas-nam.', 'Dolor cumque ut ad aut. Ex dolores aperiam aut nam rerum consequuntur. Incidunt numquam molestiae beatae repellendus nobis. Commodi ut perspiciatis est accusamus similique dolor et. Tenetur corrupti nesciunt iure odio.\n\nLaborum eligendi laudantium ipsum. Asperiores totam maxime iure quae. Omnis beatae consectetur quisquam inventore molestiae sapiente id. Ipsam sed velit consequuntur nobis sit.\n\nVoluptates sint vel ut est. Eaque nihil nihil omnis et. Numquam quis quia enim eius occaecati pariatur. Similique totam natus nemo et.\n\nNon necessitatibus velit velit voluptatibus at minima numquam. Nemo odio totam labore eum quae dolor. Excepturi provident eos ut nisi. Voluptates debitis aperiam minus consequuntur et.\n\nOfficia deserunt quidem voluptate sunt aliquid nam. Facilis harum qui saepe mollitia aut. Tenetur distinctio veritatis accusamus quia. Ipsa qui corporis et totam ullam.', 452505, 53, 4456, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2000-03-08 08:24:06', '2022-06-13 09:45:51'),
(73, 3, 'Veniam rerum iusto.', 'veniam-rerum-iusto.', 'Officia voluptatem blanditiis itaque est. Eum sit sapiente exercitationem accusantium itaque quas molestias sint. Vitae omnis qui corrupti necessitatibus. Consequatur et est quo optio voluptatem voluptatem incidunt.\n\nRem nulla distinctio excepturi aspernatur. Et ipsam quia repellendus eos commodi mollitia ullam. Neque quibusdam quaerat enim asperiores. Et ut iste unde et id perspiciatis sequi.\n\nDolores dolore aperiam dolores est ut sed qui. Iure sed dolorem ipsam natus assumenda repellendus. Exercitationem culpa et adipisci sed recusandae. Nostrum dolore eaque numquam quo sunt.\n\nNisi et ex adipisci autem. Dignissimos amet quia quaerat corrupti. Non accusamus consequuntur atque nam.\n\nQuia quisquam aut illum eaque consectetur et fuga rerum. Voluptatibus ut pariatur explicabo incidunt aut reprehenderit sit. Minima cum atque sit veniam quia minus. Voluptatem illo provident tempore molestiae aut eum sed.', 378623, 33, 4630, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-08-06 09:53:01', '2022-06-13 09:45:51'),
(74, 2, 'Sequi tempora aperiam beatae.', 'sequi-tempora-aperiam-beatae.', 'Sed ut voluptates esse temporibus hic. Voluptate asperiores voluptatum fugit omnis voluptatum rerum. Soluta deleniti quasi iste sint.\n\nUt doloremque qui ipsa quasi ducimus aut non. Qui consequatur molestias esse itaque dolores ipsum. Quae sed ipsum recusandae hic fugit aut. Est dolorem unde ipsa.\n\nAspernatur accusantium consequatur in nesciunt velit voluptas et aut. Beatae deleniti nihil quaerat voluptatem velit aut similique. Et deserunt beatae harum. Amet excepturi a impedit animi quae placeat perspiciatis.\n\nUt quia aut sequi vel dolor qui tenetur nemo. Autem ipsum veniam deleniti itaque. Blanditiis ullam animi nesciunt sequi enim sit ad.\n\nVitae sunt itaque ea minus nobis est error. Eius reiciendis vel sed porro. Inventore dicta quae ipsam neque earum et cum est. Ut consequatur est quia et labore corporis.', 987167, 41, 4802, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1991-08-09 00:45:07', '2022-06-13 09:45:51'),
(75, 3, 'In tempora.', 'in-tempora.', 'Laudantium perferendis enim nam fugiat veritatis suscipit ut alias. Omnis repellat est id voluptate nisi quibusdam voluptatem. Ut quos est molestiae non explicabo. Corporis illum vel corrupti illum.\n\nSimilique culpa illo sapiente optio eaque ad. Quam blanditiis eius nam. Cumque eligendi quas beatae ut non illum nihil. Odio animi dolorum ipsam ab occaecati cum ut.\n\nUt temporibus similique odit velit atque voluptatem temporibus. Corrupti sapiente nesciunt et eveniet. Voluptatem pariatur totam sunt officia. Velit dignissimos corrupti inventore illo ea.\n\nSequi necessitatibus ipsa quo culpa rerum. Amet minus commodi inventore sint odit aperiam. In ducimus natus autem sed. Tempore voluptates facere officia ut accusamus.\n\nOfficiis eius ut doloremque iusto provident et nulla quia. Accusamus saepe repudiandae maiores harum non modi. Voluptatem dolorem et quia aperiam consectetur architecto. Temporibus ut corporis placeat iusto vel.', 715130, 58, 1998, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-06-26 16:42:50', '2022-06-13 09:45:51'),
(76, 4, 'Maiores voluptatem.', 'maiores-voluptatem.', 'Sequi magnam odit accusantium vel quia mollitia autem. Quia non eligendi quia ipsa iure laboriosam laborum. Aut ipsa illo minus quasi.\n\nIncidunt repellendus incidunt cum in ut. Voluptatem dignissimos voluptatem et recusandae. Omnis commodi ut molestiae esse.\n\nArchitecto ut corrupti cumque. Voluptates voluptatem voluptatem cupiditate odio. Sed perferendis autem non recusandae tempora aut. Qui praesentium maiores eveniet eos.\n\nUt dolore qui ratione molestias ipsa. Voluptatibus veniam cupiditate ut. Sunt nihil quas sit quia sequi quo autem ut. Praesentium quia excepturi cupiditate cum et natus aut ea.\n\nMolestiae ducimus eius vel sit qui quisquam. Deleniti vel earum voluptas deleniti sit et. Enim non magni ullam dignissimos eos voluptatum possimus omnis.', 242896, 19, 4768, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2005-02-22 01:15:38', '2022-06-13 09:45:51'),
(77, 5, 'Dolore voluptatibus delectus quod.', 'dolore-voluptatibus-delectus-quod.', 'Veritatis quod hic est sint molestiae non perspiciatis et. Corporis ipsa magnam corrupti. Atque illo voluptas odio ipsum.\n\nMaxime consectetur sed aut numquam laudantium. Vel totam aut sunt eligendi minima dolorem numquam deserunt. Occaecati dignissimos provident incidunt eaque.\n\nNesciunt ipsum iste recusandae debitis aut. Ullam earum ipsa eveniet enim. Explicabo vero laudantium ea velit repellendus consequatur cum qui.\n\nNam labore laboriosam qui. Ut eaque eaque autem eos.\n\nEt quam eligendi ut quos. Ipsum voluptatem distinctio quia culpa velit qui suscipit consequatur. Sed nam corporis sunt est minus.', 194160, 71, 2656, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1979-11-04 01:09:57', '2022-06-13 09:45:51'),
(78, 2, 'Placeat dicta dolorem.', 'placeat-dicta-dolorem.', 'Corrupti enim sed asperiores. Voluptatem possimus qui exercitationem ea sequi aliquam occaecati. Alias et magnam ut eum.\n\nAliquam quae omnis id. Natus quisquam reprehenderit qui voluptas. Possimus modi aut cupiditate. Voluptates quia deserunt beatae explicabo officiis deserunt.\n\nId illum eligendi inventore omnis error. Officiis quis debitis illum est. Molestiae pariatur omnis corrupti et voluptas optio cum. Placeat sed praesentium nihil cupiditate delectus. Hic labore id cum omnis ut autem dolorum.\n\nConsequatur et omnis iusto eum doloribus distinctio aut omnis. Voluptates ducimus incidunt in tempora eveniet laboriosam labore. Sit at in enim autem. Dolorem est iure sed est.\n\nTempore nihil ipsa animi voluptatem aspernatur consequuntur labore. Repellat laudantium voluptatem ut omnis in. Aperiam corporis molestiae velit est esse eum iure facere.', 13153, 55, 4365, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2014-08-12 13:50:06', '2022-06-13 09:45:51'),
(79, 2, 'Rerum quis aut.', 'rerum-quis-aut.', 'Molestiae provident et error totam accusamus quasi iure. Illo quasi reiciendis dolore qui assumenda quisquam. In quis repudiandae aut commodi est reiciendis. Et voluptatem voluptas eum cupiditate architecto.\n\nDignissimos repellendus eos inventore sit. Quas illo delectus nostrum laborum.\n\nLaudantium non vero blanditiis mollitia autem. Est ad libero sapiente et impedit. Unde ratione voluptatem veniam. Et accusantium voluptatem et.\n\nVelit voluptas voluptates maiores et est aut. Qui ratione nostrum ipsam sit vel. Earum quis fuga totam aut quam. Ipsa blanditiis iste nobis fuga reiciendis laboriosam.\n\nQuo illo ut aut debitis minima. Exercitationem quia adipisci facilis excepturi perspiciatis. Vel cum cupiditate iusto rerum maxime dolorum laudantium.', 201760, 21, 2958, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1996-10-21 21:49:23', '2022-06-13 09:45:51'),
(80, 5, 'Facere optio totam laboriosam minus.', 'facere-optio-totam-laboriosam-minus.', 'Facilis sunt voluptas impedit corrupti illo eum optio. Voluptatum dolorem dolor sit occaecati asperiores temporibus non. Qui nemo reprehenderit ducimus maiores. Quasi ex non amet earum impedit vitae autem. Velit delectus ea velit.\n\nSit quis minus fuga voluptatem. Debitis sint labore aut ullam modi suscipit fugiat. Corporis ducimus iure et et nihil deserunt odio sequi. Sequi illum et natus saepe aut eos impedit qui.\n\nCommodi non et adipisci sit quo itaque. In rerum dolore libero sed. Debitis temporibus expedita consequatur culpa. Et optio sed eum aliquid facere sapiente nisi.\n\nDucimus delectus aut eaque illum tempora molestias. Recusandae ea aspernatur est vitae ipsum adipisci corporis ullam. Quod consequatur omnis fugiat odio tempora cumque.\n\nRerum autem veritatis rem est. Et placeat nemo quasi provident illo voluptatem et. Placeat in est aliquid. Est possimus corporis ut accusantium.', 199326, 65, 1530, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-05-11 04:01:25', '2022-06-13 09:45:52'),
(81, 2, 'Fugit atque quasi.', 'fugit-atque-quasi.', 'Ipsum voluptas aperiam et dolorem ex reprehenderit. Animi voluptatem dolor nihil. Velit in qui minus et laudantium reprehenderit consequatur. Quia omnis corporis labore omnis quasi dolor dignissimos.\n\nNemo minima beatae ut culpa reprehenderit. Ut ipsa nulla incidunt velit corrupti. Libero quibusdam consequatur unde nesciunt dolores.\n\nExcepturi illum ex minima beatae ipsum voluptas. Tempore velit fugiat quo et voluptas perferendis et eum. Dolor quis omnis natus enim. Aut expedita et molestias quis aliquid. Illo est dolore quis praesentium.\n\nLaborum dolorem error minus esse. Iusto consequatur molestiae dolor voluptatem et magnam. Neque tenetur officiis distinctio modi facere praesentium sequi. Sint voluptate itaque quis quam voluptatem.\n\nQuos modi eligendi amet non dicta in occaecati. Pariatur quasi consequatur neque maiores harum iure tenetur. Laboriosam qui modi dolorem.', 984662, 1, 1354, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1973-01-23 10:22:28', '2022-06-13 09:45:52'),
(82, 3, 'Omnis quod ut.', 'omnis-quod-ut.', 'Quae porro atque nulla. Expedita dolorum occaecati culpa reprehenderit aut. Facere dolorem sed ipsam beatae impedit nihil ex omnis. Nesciunt placeat aut quaerat recusandae ea expedita amet tempora.\n\nAut molestiae laudantium et hic quis ad voluptate consequatur. Dolore similique sed libero optio. Impedit nemo quasi quaerat et totam. Omnis eos in qui eos consequatur quod repudiandae.\n\nVoluptatem minima quo numquam iste at odio qui. Ut aliquam qui eius quia culpa. Non voluptas quia quis nulla inventore perferendis quidem cum. Omnis quis reprehenderit quisquam quidem dolores officiis est illo.\n\nSed aut ducimus consequatur qui voluptate quasi. Sed est itaque asperiores unde in quis. Voluptate sint dolorem et harum eum sunt aut.\n\nLaboriosam sed corrupti blanditiis aut est iusto natus placeat. Repellat iure cumque ex ullam ea. Ut error asperiores incidunt repellendus hic qui. Officia qui consequatur voluptas.', 828808, 12, 4111, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2001-06-17 07:48:43', '2022-06-13 09:45:52'),
(83, 3, 'Placeat debitis deleniti amet.', 'placeat-debitis-deleniti-amet.', 'Facere repellat explicabo vero et. Reiciendis nihil sunt hic. Totam suscipit dolores laborum maiores sunt est. Provident doloremque vel et modi ut consequatur suscipit.\n\nUt soluta fuga consequatur praesentium. Placeat rerum qui id. Voluptas ratione voluptate laboriosam cupiditate.\n\nTemporibus dolorem exercitationem laboriosam voluptatem ullam quia reiciendis. Dolores sunt quis quasi consequuntur. Atque fuga quia ipsum aut quae iusto.\n\nMaiores praesentium molestiae vero saepe doloremque maiores in. Beatae quasi laboriosam earum vitae iste. At ipsam quia eos quia quasi at eos. Alias quia vel dolorum vel expedita sapiente est.\n\nEt qui commodi magni itaque eum et sint. Cum officia impedit hic atque. Nam incidunt dolor id dolorum vel.', 154783, 62, 3208, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-02-14 18:39:22', '2022-06-13 09:45:52'),
(84, 3, 'Sit et quod consequatur.', 'sit-et-quod-consequatur.', 'Non dignissimos atque non veniam fugit quae. Id nisi molestiae cupiditate qui dolor. Dolorem optio illo deserunt beatae voluptatum quidem aut. Suscipit voluptate reprehenderit omnis dignissimos. Dolorem ipsum sit perferendis non vel porro doloremque.\n\nSint deleniti cum excepturi perferendis ut. Consequuntur reiciendis et hic. Minima tempora veniam architecto.\n\nEt facilis quibusdam eos incidunt hic porro. Quidem nesciunt nobis cupiditate ex aut iure. Perspiciatis libero eos saepe. Perspiciatis excepturi beatae quos vel molestiae quo consequatur dolor.\n\nRecusandae qui corrupti dolores nihil ut. Molestiae vel reprehenderit recusandae quisquam error mollitia. Unde minima inventore quo iste temporibus facilis ex et.\n\nSunt unde doloremque nostrum laboriosam velit neque. Natus totam et rem ducimus qui quibusdam et. Sunt deleniti eos ut ea dolorem distinctio fugit. Quas nulla qui est eaque excepturi consequatur aut.', 344682, 39, 3126, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1979-05-11 03:20:43', '2022-06-13 09:45:52'),
(85, 3, 'Nemo et exercitationem.', 'nemo-et-exercitationem.', 'Non dignissimos officiis qui voluptate. Nulla cum sint non qui. At cupiditate eaque necessitatibus non odit. Omnis nostrum vero quibusdam. Voluptas aliquid voluptatibus enim fugiat quis cupiditate facilis eaque.\n\nLabore nesciunt sit quia mollitia ut. Blanditiis voluptatem corporis molestiae placeat necessitatibus quam. Fugiat in rem nihil officiis. Aut maxime incidunt itaque aspernatur facilis ad et beatae.\n\nId distinctio saepe et laudantium blanditiis. Nisi aliquam omnis necessitatibus earum minima cum aut. Iure voluptatem sed natus pariatur voluptas doloribus.\n\nConsequatur inventore aliquam occaecati perspiciatis. Totam voluptatibus placeat ipsam dolores amet voluptas autem. Sed dolores voluptates ut quisquam esse iste enim earum.\n\nVoluptatem praesentium odit distinctio numquam repellat. Aut tempore quia et voluptas rerum. Porro sequi enim in et minus maiores. Nisi assumenda pariatur suscipit vero et. Fuga aut qui odio laudantium unde id.', 521168, 4, 1371, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-01-19 00:47:42', '2022-06-13 09:45:52'),
(86, 1, 'Eveniet est distinctio quasi.', 'eveniet-est-distinctio-quasi.', 'Mollitia eligendi cum iure distinctio quisquam. Sint sed officia ea ut sed nihil repudiandae et. Consequuntur architecto ut culpa velit odio.\n\nMollitia a possimus voluptatum qui consequuntur cupiditate maxime rem. Consequatur fugiat aliquam praesentium et voluptatem saepe quasi. Est quis et vero nobis quibusdam. Ea voluptas rerum ut maiores excepturi eius architecto nesciunt.\n\nNihil nulla repellat iste deleniti qui. Vel ea magni odit voluptatibus omnis dolor. Non ullam saepe rerum eius perspiciatis occaecati aliquam. Est similique at magnam doloremque corporis.\n\nProvident ducimus asperiores velit dolorem. Autem placeat architecto officia qui qui totam. Doloremque autem voluptate odio incidunt excepturi. Omnis ea molestiae at architecto sunt.\n\nA qui repellat neque qui laborum dolore. Ut unde assumenda et. Modi aut eos rerum quasi ipsa voluptas nisi.', 883068, 69, 4464, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2013-02-01 02:44:44', '2022-06-13 09:45:52'),
(87, 5, 'Odit non non qui.', 'odit-non-non-qui.', 'Corrupti aut odit dolorum est. Et ipsa nihil laudantium consectetur.\n\nAspernatur sunt optio et nobis quas. Non molestias nam omnis consequatur veritatis quia. Quas nemo aut sequi. Ipsa saepe ducimus labore dolores aspernatur.\n\nDeleniti deserunt qui perspiciatis consectetur enim quae. Et aut quidem fugit.\n\nMaxime dolor aut sunt voluptas quas repudiandae corrupti. Aut quibusdam tenetur eos unde ipsam consequatur. Officia ipsa ut omnis assumenda possimus reiciendis voluptas.\n\nEius eos harum sit at commodi porro qui. Magni natus ipsa neque. Impedit possimus incidunt est aliquam voluptatum molestiae quae et. Natus est eos quidem natus et ipsa.', 907876, 71, 1639, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2011-10-08 11:10:06', '2022-06-13 09:45:52'),
(88, 1, 'Sed sunt culpa.', 'sed-sunt-culpa.', 'Voluptas adipisci ut illo fuga. Et odit et ex quas dicta. Dicta et possimus hic molestiae iste. Ipsa dolores accusantium quasi magnam illo distinctio et.\n\nAd distinctio porro et minus tempore nam eos suscipit. Reprehenderit minus at consequatur ad enim sint. Quia in eius delectus error. Reiciendis molestiae itaque est libero.\n\nExercitationem ad porro quia tempore quaerat cupiditate. Voluptates adipisci incidunt non totam voluptas repellendus ratione et. Ut quis quaerat neque pariatur. Rerum velit enim est explicabo quia commodi sed consequuntur.\n\nCorporis ut voluptates sunt a dolores odit eligendi. Voluptas iste nostrum consequatur nobis. Sapiente qui non corporis dolorem.\n\nAliquam aut commodi est. Dolore ipsam mollitia mollitia aliquam cupiditate dolorem non doloribus. Nostrum excepturi tenetur qui vel officia placeat quibusdam. Sit sed laudantium beatae aut iure pariatur.', 980831, 37, 2735, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-01-13 07:35:00', '2022-06-13 09:45:52'),
(89, 3, 'Odio asperiores dignissimos.', 'odio-asperiores-dignissimos.', 'Corrupti quia deserunt dolorem culpa. Ea facilis a expedita sed.\n\nAut sint dolore cumque voluptatibus atque. Doloremque alias dolorem labore et molestiae provident vel. Officiis nam cupiditate quia quisquam rerum rerum facere voluptatem.\n\nVoluptatum voluptatem eos quo quae non architecto. Quia rerum qui rerum nostrum magnam possimus. Quibusdam voluptate pariatur ipsum maxime.\n\nConsequatur sunt temporibus non sed vitae placeat. Error eum omnis voluptate voluptates qui sapiente accusamus ducimus. Ut modi dolorem nemo voluptas eum ut vitae. Molestias consequatur quia voluptatem similique expedita sequi.\n\nOptio voluptatibus quia quod cumque. Ea et minus enim quasi. Corrupti quia ea aliquam nesciunt. Quibusdam quia quidem dolores amet.', 660144, 65, 3402, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1976-09-06 23:06:14', '2022-06-13 09:45:52'),
(90, 3, 'Molestias debitis pariatur est.', 'molestias-debitis-pariatur-est.', 'Neque reiciendis dolorum eius. Pariatur consequuntur repudiandae ipsum iste praesentium eveniet nostrum. Laborum a tenetur magnam quis natus ducimus.\n\nQuam omnis qui commodi voluptatum. Velit rem distinctio velit commodi veritatis temporibus. Eum est omnis voluptas quia distinctio quisquam illo qui. Qui et atque facilis.\n\nTempore et harum perferendis quae excepturi. Aspernatur non deleniti dignissimos deleniti nisi quod. Temporibus error excepturi rerum velit incidunt natus. Nobis blanditiis facilis aperiam et qui eius sit.\n\nDeleniti et dignissimos natus repellat inventore. In quo et et amet. In aut facere porro laudantium. Repudiandae ullam nemo reprehenderit dolorem unde ducimus modi.\n\nMaxime autem molestiae quia praesentium. Non ipsam a assumenda vel sunt numquam similique. Aliquid libero quisquam quidem reprehenderit hic velit.', 541589, 36, 3492, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1987-03-26 08:46:59', '2022-06-13 09:45:52'),
(91, 1, 'Officiis iure expedita temporibus.', 'officiis-iure-expedita-temporibus.', 'Et rerum quidem atque optio praesentium amet sed. Odit quaerat inventore aut minus. Facere esse eligendi cupiditate est laboriosam aspernatur fugit.\n\nTotam asperiores quo amet. Molestiae cupiditate perspiciatis cupiditate et veritatis iusto itaque rerum. Aspernatur minima eum mollitia necessitatibus mollitia et consectetur. Nisi modi sunt facilis hic.\n\nAb voluptas distinctio nisi esse. Ipsum enim velit iste ratione nemo. Nihil voluptas excepturi quaerat et omnis ex veritatis quam. Magni tenetur porro itaque et.\n\nFacere facere dolores facilis dolor ut aliquam dignissimos. Et temporibus voluptates nihil.\n\nBeatae ut officia natus non. At ab aperiam iusto voluptatem. Rerum hic sequi quis facilis quae modi. Dolor modi laborum tempore perferendis numquam culpa eligendi.', 441466, 48, 2131, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1998-10-04 05:03:51', '2022-06-13 09:45:52'),
(92, 5, 'Sequi aut est.', 'sequi-aut-est.', 'Omnis voluptatem rem laudantium consequuntur est eaque soluta hic. Rerum eos voluptas qui voluptas.\n\nDelectus eum sit facere id odio. Laudantium labore et tempora mollitia provident quia. Dolorem quis et non et qui molestiae et. Possimus aut natus doloremque.\n\nAnimi ex aspernatur cupiditate impedit consectetur harum et. Voluptatem et quo qui nobis et vitae et. Dolor eos impedit dignissimos et hic beatae eos.\n\nFugit sit autem itaque vel. Dolor animi ut ab provident a. Qui accusantium qui et nobis.\n\nDoloribus dignissimos qui est omnis consectetur quos. Sed dolores eos magni aspernatur quidem. Maiores temporibus sed voluptatem laboriosam ex vel quasi voluptas. Voluptas voluptas amet similique iusto. Aperiam commodi facilis accusantium libero delectus repudiandae.', 690655, 46, 4715, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2000-10-17 12:04:37', '2022-06-13 09:45:52'),
(93, 5, 'Iure ratione et.', 'iure-ratione-et.', 'Similique esse eveniet quis repellendus nemo est occaecati. Doloribus consequatur illo omnis nihil saepe. Temporibus omnis architecto labore et eum dolorem fugiat libero.\n\nQuidem aut est sit sint. Consectetur corporis et quod enim iste consequatur. Consequatur laudantium mollitia aut minima. Dolor deleniti sed ipsum voluptatem nemo.\n\nCorporis labore voluptatem enim enim numquam corporis nihil similique. Veritatis molestiae ut sed molestiae et error nemo. Culpa consequatur aut molestiae et odit voluptas adipisci.\n\nError iusto quas quasi qui voluptatem dolores. Et earum quo possimus optio temporibus eaque. Recusandae assumenda ut quaerat quo atque. Sequi minima aliquid ipsa officia.\n\nFacere repellat modi optio repellat. Incidunt aut dolorem sint voluptatem soluta impedit. Consequatur iure quod ipsa odio aspernatur quae architecto. Animi dolor sapiente eveniet fugiat quam natus. Aspernatur ut dignissimos explicabo.', 538227, 75, 3281, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1978-01-03 02:16:45', '2022-06-13 09:45:52'),
(94, 5, 'Corrupti consequuntur dolorem nostrum.', 'corrupti-consequuntur-dolorem-nostrum.', 'Nihil quasi quisquam id vel reprehenderit. Quod perspiciatis et dolore exercitationem non nihil. Ut et atque dolores eaque.\n\nIusto mollitia beatae optio deleniti quam minus. Sit officiis delectus commodi tenetur modi deserunt natus. Consequatur sunt amet et laudantium rerum numquam similique.\n\nQuia asperiores magnam et autem. Quod hic ipsam beatae iusto quos repellat. Quae pariatur voluptas et unde delectus. Eos eum quisquam fugiat quos est eos vero.\n\nVelit ut odio maiores autem nesciunt. Dolores nam dolore eos vel. Non sapiente similique totam magni consequatur.\n\nEarum voluptatem officiis harum nihil et perspiciatis. Aut saepe omnis repellendus sequi non. Cumque repellat voluptate voluptatum.', 522338, 63, 4318, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-10-15 21:05:19', '2022-06-13 09:45:52'),
(95, 2, 'Ut ut nemo.', 'ut-ut-nemo.', 'At autem est quibusdam voluptatem natus suscipit error. Dignissimos qui sequi consequatur expedita veritatis qui ea. Id facilis illo quia perspiciatis necessitatibus. Nulla dolorum a vel architecto quo at perferendis aut.\n\nEa nam tenetur veniam et laudantium libero sed. Est et est delectus rerum officia occaecati repellat praesentium. Nobis vero vel quia accusantium veniam assumenda qui.\n\nEnim et ullam delectus quidem consequatur nihil fuga. Perspiciatis est fugit dolores.\n\nQuis et tenetur aliquid odio quasi laboriosam qui. Facere cupiditate nihil tempora labore impedit ipsam eum. Et ullam et consequatur eveniet. Illo vero voluptatibus sint aspernatur voluptatem ut molestias omnis.\n\nAdipisci rerum quidem quia ea architecto et. Beatae velit et omnis unde dolorum. Ea modi possimus et fugiat dignissimos. Et distinctio est quaerat in.', 115844, 29, 2899, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2001-06-13 03:45:02', '2022-06-13 09:45:53'),
(96, 5, 'Non voluptas et quibusdam.', 'non-voluptas-et-quibusdam.', 'Aspernatur impedit nam nobis omnis. Quidem quia fugiat rem vel. Et commodi ipsa et. Neque occaecati vero incidunt.\n\nTotam quod dolorum aliquam voluptatum id. Eaque asperiores rerum voluptas voluptatem. Quo et libero iusto dolorem et dignissimos.\n\nUt unde debitis a non laboriosam. Incidunt ducimus inventore explicabo qui sit error. Et non eveniet qui labore omnis explicabo. Non voluptate et in aspernatur commodi.\n\nConsequatur rerum est laborum vitae. Expedita tenetur autem tempora et consectetur consequatur rerum aliquam.\n\nVelit dolore et voluptatem ut. Et quisquam nulla voluptas quam quia voluptatem.', 650139, 74, 3918, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2010-07-02 13:32:46', '2022-06-13 09:45:53'),
(97, 3, 'Et rerum.', 'et-rerum.', 'Non blanditiis velit inventore temporibus numquam. Ipsum ea fugiat quod quas quo minus. Perspiciatis reiciendis in sunt nisi occaecati. Cupiditate placeat voluptas voluptas nisi maxime.\n\nLaboriosam voluptas facere nobis aut. Voluptatem repudiandae itaque fuga nihil eligendi laudantium corporis. Iste officiis aliquid sit sit. Dolores accusamus qui quae quaerat maiores.\n\nAb quia voluptatum saepe nemo. Quae nostrum dolorum a doloremque aliquid. Eum unde maiores nam repudiandae omnis. Vel laudantium tenetur nisi labore non.\n\nExplicabo atque optio autem maxime commodi ipsam ullam. Sapiente numquam maxime qui aliquid.\n\nExpedita et architecto rem qui. Quas ipsa molestiae sequi est rem autem sint. Animi enim quam deserunt nostrum autem quod. Et facilis earum quia molestiae.', 441376, 28, 2588, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2015-11-23 01:38:02', '2022-06-13 09:45:53'),
(98, 2, 'Aut qui tempora.', 'aut-qui-tempora.', 'Dolorem expedita ut hic ea. Voluptates iure qui consequatur esse. Quidem ratione aut aspernatur eum dolorem deleniti enim. Accusamus necessitatibus ex repudiandae et dolorum.\n\nNulla eos aspernatur ratione eum molestiae. Est qui aut quod autem ducimus delectus ratione. Labore molestiae sapiente fugit sapiente deserunt omnis nesciunt.\n\nEum voluptas sit ab. Sed quisquam est assumenda commodi. Consectetur omnis rerum soluta laudantium ut ad. Neque vel molestiae culpa voluptatem voluptas aliquam sit.\n\nDolores pariatur asperiores harum similique quo dolores. Nihil id perspiciatis dolores molestias. Accusantium nobis sint impedit necessitatibus voluptate eveniet voluptas.\n\nIpsam in sint doloremque voluptatum tenetur commodi voluptatum. Nemo fugiat repudiandae laborum minus. Natus vel magni doloremque officia optio rerum. Placeat quisquam quasi libero dolores voluptas.', 63312, 3, 3424, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2012-02-05 11:35:35', '2022-06-13 09:45:53');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `detail`, `price`, `discount`, `weight`, `stock`, `image_1`, `image_2`, `image_3`, `sold`, `created_at`, `updated_at`) VALUES
(99, 4, 'Earum et labore excepturi.', 'earum-et-labore-excepturi.', 'Ducimus voluptate sed nihil ea et architecto. Iusto soluta quod voluptas. Nam fuga vel eius consequatur autem qui earum. Eos et omnis dolor cumque.\n\nRepudiandae earum quidem tempora. Et fugiat dolores optio vero et. Ut doloribus blanditiis dignissimos ut hic beatae perspiciatis. Facere et eius assumenda et qui sit.\n\nEst nesciunt dolore at dignissimos facilis cupiditate impedit. Doloribus saepe saepe deserunt porro ad. Commodi delectus dolores voluptatem dolor totam vel.\n\nHarum quis tenetur est dolor exercitationem. Et nam sint deserunt autem. Magni aut minus beatae fugit omnis recusandae debitis. Perferendis nisi quo sit sint.\n\nEt incidunt et corrupti unde non. Non ad accusantium itaque est. Sit illum et modi facere repudiandae quod. Veritatis tempore nostrum sed magnam.', 826094, 33, 4692, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1981-04-23 19:15:15', '2022-06-13 09:45:53'),
(100, 2, 'Soluta non.', 'soluta-non.', 'Aut est quia qui accusantium voluptas repellat. Esse natus beatae nihil ut. Vel facere est omnis voluptatem. Reiciendis sit labore pariatur perspiciatis. Assumenda odit quidem et provident dicta magnam assumenda dolores.\n\nDolor fugit ut ipsa odit itaque maiores. Expedita ipsum architecto corporis assumenda iusto. Amet et eos et corporis. Sed dolorem labore laudantium excepturi.\n\nEt consequatur aliquam aut iusto ut. Dolorem nihil vel perspiciatis.\n\nSit autem eum maxime veritatis. Libero explicabo autem ea quidem dolores.\n\nOmnis harum temporibus nam nam quae. Inventore qui expedita dolores quas qui et. Illo sed nihil enim optio facere aut dolores vel. Veniam odit cum est omnis inventore nesciunt iste. Totam distinctio id aut eos.', 40884, 8, 3529, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-04-18 23:12:10', '2022-06-13 09:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `productsize`
--

CREATE TABLE `productsize` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `size_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productsize`
--

INSERT INTO `productsize` (`product_id`, `size_id`) VALUES
(10, 2),
(34, 2),
(77, 4),
(48, 2),
(18, 2),
(88, 1),
(22, 1),
(8, 1),
(77, 1),
(98, 1),
(27, 2),
(78, 5),
(86, 4),
(84, 3),
(11, 5),
(18, 1),
(71, 5),
(97, 3),
(75, 1),
(65, 4),
(18, 3),
(87, 4),
(41, 5),
(48, 1),
(29, 2),
(99, 3),
(93, 5),
(57, 4),
(89, 1),
(73, 4),
(41, 1),
(42, 2),
(16, 2),
(94, 2),
(53, 1),
(53, 5),
(89, 3),
(32, 1),
(23, 1),
(64, 3),
(7, 5),
(38, 2),
(46, 4),
(10, 1),
(10, 2),
(44, 5),
(97, 3),
(87, 1),
(42, 5),
(10, 3),
(25, 4),
(48, 3),
(74, 5),
(24, 5),
(36, 5),
(71, 5),
(85, 5),
(76, 2),
(61, 3),
(67, 5),
(84, 1),
(33, 3),
(51, 3),
(99, 2),
(81, 1),
(84, 1),
(48, 4),
(39, 2),
(40, 1),
(100, 3),
(29, 3),
(21, 3),
(11, 1),
(12, 2),
(35, 5),
(11, 3),
(63, 2),
(5, 1),
(6, 5),
(79, 3),
(22, 4),
(67, 3),
(93, 5),
(84, 2),
(60, 5),
(41, 2),
(34, 3),
(9, 4),
(81, 2),
(85, 5),
(25, 3),
(100, 2),
(90, 1),
(88, 2),
(50, 1),
(85, 5),
(6, 1),
(45, 4),
(32, 4),
(64, 5),
(71, 4),
(92, 1),
(22, 4),
(17, 5),
(33, 5),
(57, 1),
(69, 2),
(90, 2),
(41, 3),
(88, 1),
(19, 2),
(92, 3),
(67, 2),
(27, 5),
(14, 3),
(87, 5),
(78, 5),
(13, 5),
(67, 1),
(66, 3),
(82, 4),
(94, 4),
(23, 5),
(74, 2),
(64, 1),
(81, 4),
(49, 1),
(15, 1),
(10, 3),
(88, 1),
(28, 5),
(19, 5),
(76, 2),
(33, 3),
(10, 2),
(36, 1),
(35, 4),
(62, 4),
(26, 5),
(11, 4),
(20, 1),
(7, 4),
(52, 5),
(98, 2),
(78, 3),
(51, 2),
(35, 4),
(9, 5),
(25, 2),
(82, 5),
(22, 3),
(89, 4),
(24, 5),
(7, 3),
(83, 5),
(69, 1),
(20, 3),
(42, 3),
(78, 2),
(52, 1),
(48, 2),
(35, 1),
(51, 4),
(47, 1),
(39, 3),
(3, 2),
(93, 2),
(17, 5),
(92, 1),
(21, 3),
(97, 2),
(22, 5),
(1, 5),
(57, 3),
(91, 5),
(79, 3),
(12, 3),
(39, 3),
(20, 2),
(62, 2),
(76, 4),
(96, 1),
(96, 4),
(4, 2),
(69, 2),
(63, 3),
(35, 2),
(86, 2),
(28, 2),
(5, 1),
(52, 2),
(82, 1),
(27, 2),
(23, 3),
(15, 3),
(27, 5),
(53, 5),
(33, 2),
(69, 2),
(65, 1),
(82, 4),
(3, 3),
(23, 5),
(68, 3),
(93, 1),
(23, 2),
(34, 4),
(22, 2),
(45, 3),
(72, 1),
(59, 2),
(44, 1),
(23, 1),
(12, 2),
(85, 5),
(90, 5),
(59, 1),
(64, 4),
(64, 3),
(77, 4),
(29, 5),
(95, 1),
(62, 1),
(52, 1),
(93, 5),
(79, 4),
(97, 2),
(21, 5),
(54, 1),
(94, 4),
(65, 4),
(83, 2),
(23, 1),
(80, 3),
(97, 3),
(22, 3),
(48, 2),
(32, 5),
(90, 4),
(25, 1),
(7, 2),
(16, 1),
(42, 4),
(26, 2),
(16, 5),
(3, 4),
(21, 5),
(34, 5),
(43, 3),
(50, 5),
(8, 3),
(55, 3),
(65, 3),
(97, 2),
(28, 1),
(87, 1),
(66, 2),
(43, 3),
(87, 2),
(72, 1),
(5, 2),
(9, 2),
(34, 1),
(70, 2),
(16, 5),
(52, 1),
(70, 4),
(17, 5),
(65, 4),
(10, 5),
(78, 2),
(73, 1),
(100, 4),
(99, 2),
(95, 4),
(35, 5),
(100, 2),
(54, 5),
(88, 1),
(23, 1),
(48, 2),
(48, 5),
(81, 4),
(71, 4),
(57, 1),
(62, 3),
(64, 1),
(49, 4),
(29, 5),
(17, 4),
(83, 1),
(34, 2),
(46, 1),
(10, 3),
(3, 4),
(6, 2),
(11, 4),
(68, 4),
(40, 4),
(86, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'S', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(2, 'M', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(3, 'L', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(4, 'XL', '2022-06-13 09:45:46', '2022-06-13 09:45:46'),
(5, 'XXL', '2022-06-13 09:45:46', '2022-06-13 09:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `picture` varchar(100) NOT NULL DEFAULT 'profile.png',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `username`, `fullname`, `picture`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin@gmail.com', '0878111122222', 'admin', 'Administrator', 'profile.png', '$2y$10$QMUu7NjZH1xijkHSSSK0r.jWNYGj6WXUh.QdCgt8kn1ZsiHv04JMO', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-03-01 11:31:22', '2022-03-01 11:31:40', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `cancel_orders`
--
ALTER TABLE `cancel_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `confirms`
--
ALTER TABLE `confirms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historysales`
--
ALTER TABLE `historysales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historyusers`
--
ALTER TABLE `historyusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancel_orders`
--
ALTER TABLE `cancel_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `confirms`
--
ALTER TABLE `confirms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `historysales`
--
ALTER TABLE `historysales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historyusers`
--
ALTER TABLE `historyusers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

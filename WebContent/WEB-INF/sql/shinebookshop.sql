/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : shinebookshop

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2020-04-14 17:55:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `passWord` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES ('2', 'admin', 'admin', '测试', '2020-04-14 17:41:31');

-- ----------------------------
-- Table structure for s_book
-- ----------------------------
DROP TABLE IF EXISTS `s_book`;
CREATE TABLE `s_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `catalogId` int(11) NOT NULL,
  `bookName` varchar(20) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `press` varchar(30) NOT NULL DEFAULT '',
  `price` double(10,2) NOT NULL,
  `description` text,
  `imgId` int(11) NOT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `s_book_ibfk_1` (`catalogId`),
  KEY `s_book_ibfk_2` (`imgId`),
  CONSTRAINT `s_book_ibfk_1` FOREIGN KEY (`catalogId`) REFERENCES `s_catalog` (`catalogId`),
  CONSTRAINT `s_book_ibfk_2` FOREIGN KEY (`imgId`) REFERENCES `s_uploadimg` (`imgId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_book
-- ----------------------------
INSERT INTO `s_book` VALUES ('7', '10', 'Python Crash Course (2nd Edition)', '[Norway] Magnus Lie Hetland', 'Posts & Telecom Press', '57.50', 'Python Crash Course covers all aspects of Python programming. Starting with installation, it introduces basic Python knowledge and concepts including lists, tuples, strings, dictionaries and various statements. It then progressively introduces advanced topics including abstraction, exceptions, magic methods, properties, and iterators. After that, it explores how to combine Python with databases, networks, C language and other tools to unleash Python\'s powerful capabilities, while introducing Python program testing, packaging, and publishing knowledge. At the end, the author introduces several practical Python project development processes based on the previously discussed content.\r\n　　This book covers a wide range of content, suitable for both beginners to build foundations and programmers to improve skills. It is suitable for Python developers at all levels to read as reference.', '21', '2017-10-20 04:04:05');
INSERT INTO `s_book` VALUES ('8', '10', 'Core Python Programming (3rd Edition)', '[USA] Wesley Chun', '人民邮电出版社', '74.80', 'Core Python Programming (3rd Edition) is a fully upgraded version of the classic bestseller. The book is divided into 3 parts. Part 1 covers general Python applications including regular expressions, network programming, Internet client programming, multi-threading, GUI programming, database programming, Microsoft Office programming, and extending Python. Part 2 covers Web development topics including Web clients and servers, CGI and WSGI programming, Django Web framework, cloud computing, and advanced Web services. Part 3 is a supplemental/experimental chapter covering text processing and other topics. This book is suitable for Python developers with some experience.', '22', '2017-10-21 04:00:48');
INSERT INTO `s_book` VALUES ('9', '10', 'Modern Operating Systems (3rd Edition)', '[Netherlands] Andrew S.Tanenbaum', '机械工业出版社', '59.20', 'Modern Operating Systems (3rd Edition) is a classic work in the field of operating systems. Compared to the 2nd edition, it adds detailed coverage of Linux, Windows Vista, and Symbian operating systems. The book focuses on fundamental OS principles including processes, threads, memory management, file systems, I/O, deadlocks, computer security, multimedia operating systems, handheld device operating systems, microkernels, virtual machines on multi-core processors, and operating system design. This edition is suitable as a textbook for computer science OS courses and as an important reference for OS design and development.', '23', '2017-10-21 04:07:11');
INSERT INTO `s_book` VALUES ('10', '10', 'C Primer Plus (6th Edition)', '[USA] Stephen Prata', '人民邮电出版社', '62.70', 'C Primer Plus (6th Edition) provides detailed explanations of C language fundamentals and programming techniques. The book contains 17 chapters: Chapters 1-2 introduce preparatory knowledge for C programming; Chapters 3-15 comprehensively cover C language topics including data types, formatted input/output, operators, expressions, statements, loops, character input and output, functions, arrays and pointers, character and string functions, memory management, file I/O, structures, and bit operations. Chapters 16-17 introduce C preprocessor, C libraries, and advanced data representation. The book uses complete programs as examples to explain key C language concepts and important points. Each chapter includes extensive review questions and programming exercises to help readers consolidate knowledge and improve practical programming skills. Appendices provide reference answers to chapter review questions and rich reference materials. C Primer Plus (6th Edition) serves as an excellent textbook for beginners who need systematic C language learning, as well as for programmers who want to consolidate their C knowledge or further improve their programming skills.', '24', '2017-10-21 04:10:10');
INSERT INTO `s_book` VALUES ('11', '10', 'Thinking in Java (4th Edition)', '[USA] Bruce Eckel ', '机械工业出版社', '86.40', 'Thinking in Java (4th Edition) has won widespread acclaim from programmers worldwide. Bruce Eckel\'s clear writing style and direct programming examples make even obscure concepts easy to understand. The book guides readers from Java basics to advanced features including object-oriented concepts, multithreading, automated project builds, unit testing, and debugging. Covering 22 chapters with topics like operators, control flow, access control, class reuse, polymorphism, interfaces, exception handling, strings, generics, arrays, collections, Java I/O, enumerations, concurrency, and GUI. The book includes design patterns throughout examples: Adapter, Bridge, Chain of Responsibility, Command, Decorator, Facade, Factory Method, Flyweight, Observer, DTO, Null Object, Proxy, Singleton, State, Strategy, Template Method, and Visitor. Features new examples and chapters for Java SE 5/6, with over 500 programs rewritten. Suitable for Java programmers at all levels and as a university textbook.', '25', '2017-10-21 04:13:35');
INSERT INTO `s_book` VALUES ('12', '10', 'Database System Concepts (6th Edition)', '[USA] Abraham Silberschatz', '机械工业出版社', '69.80', 'Database System Concepts (6th Edition) is a newly revised version of the classic database textbook. It comprehensively introduces database systems knowledge and thoroughly explains fundamental concepts of database management. The book covers relational data models and languages, database design process, relational database theory, database application design and development, data storage structures, data access techniques, query optimization methods, transaction processing systems and concurrency control, failure recovery techniques, data warehousing and data mining. It also discusses advanced topics including performance tuning, performance evaluation standards, database application testing and standardization, spatial and geographic data, temporal data, multimedia data, mobile and personal database management, transaction processing monitors, transaction workflows, e-commerce, high-performance transaction systems, real-time transaction systems, and long-duration transactions. Suitable for senior undergraduates, graduate students, and database professionals.', '26', '2017-10-21 04:16:36');
INSERT INTO `s_book` VALUES ('13', '10', 'Computer Networking: A Top-Down Approach (6th Edition)', '[USA] James F.Kurose', '机械工业出版社', '61.10', 'Computer Networking: A Top-Down Approach (6th Edition) pioneered the top-down approach to teaching computer networking principles and protocols. It has been adopted by hundreds of universities and colleges worldwide, making it one of the classic computer networking textbooks in the industry. This 6th edition continues the distinctive features of previous versions while providing substantial revisions and updates: Chapter 1 focuses more on current access network technologies; Chapter 2 uses Python instead of Java for socket programming; Chapter 3 adds TCP splitting for optimizing cloud service performance; Chapter 4 extensively updates router architecture content; Chapter 5 reorganizes and adds data center networking content; Chapter 6 updates wireless networking to reflect new developments; Chapter 7 has major revisions with in-depth discussion of streaming video including adaptive streaming and CDN; Chapter 8 further discusses endpoint authentication. Suitable for undergraduate and graduate computer networking courses, as well as for network professionals and researchers.', '27', '2017-10-21 04:19:41');
INSERT INTO `s_book` VALUES ('14', '10', 'Professional JavaScript for Web Developers (3rd Edition)', '[USA] Nicholas C.Zakas', '人民邮电出版社', '72.90', 'As a classic JavaScript technical masterpiece, Professional JavaScript for Web Developers (3rd Edition) continues the comprehensive and practical approach of previous versions. After detailed explanation of JavaScript language core, it systematically presents various supports and features provided by current specifications and implementations for Web application development. Main content includes: detailed interpretation of JavaScript implementation components; comprehensive explanation of JavaScript object-oriented programming; thorough analysis of DOM, BOM, and browser event models; basic Web data formats JSON, XML and their access; Ajax, Comet server-side communication and File API-based drag-and-drop file upload; new core language features defined by ECMAScript 5; HTML5 forms, media, Canvas (including WebGL); new APIs like Selectors, Web Workers, geolocation, and cross-document messaging; offline applications and client-side storage (including IndexedDB); development practices related to maintenance, performance, and deployment; emerging APIs and ECMAScript Harmony outlook. Suitable for Web developers with programming experience and as a textbook for universities and technical training courses.', '28', '2017-10-21 04:24:36');
INSERT INTO `s_book` VALUES ('15', '10', 'Bird Brother\'s Linux Private Kitchen (3rd Edition)', '鸟哥', '人民邮电出版社', '68.30', 'Bird Brother\'s Linux Private Kitchen (Basic Learning Edition, 3rd Edition) is a completely updated version of the well-known Linux introduction book. It comprehensively and thoroughly introduces the Linux operating system. The book is divided into 5 parts: Part 1 explains Linux origins and functions, how to plan and install a Linux host; Part 2 introduces Linux file systems, files, directories, and disk management; Part 3 covers the shell text mode interface and shell scripts for system management, plus text editors vi and vim; Part 4 discusses Linux account management crucial for system security, as well as host system and program management including viewing processes, task scheduling, and job management; Part 5 covers system administrator (root) management tasks like understanding system status, system services, log file analysis, system backup, and kernel management. The book offers rich and comprehensive content with detailed explanations of basic concepts in an easy-to-understand manner. All functions and commands are introduced with extensive practical examples and thorough analysis. This is an excellent introductory book for Linux beginners.', '29', '2017-10-21 04:27:41');
INSERT INTO `s_book` VALUES ('16', '10', 'Linux Cluster and Automated Operations', '余洪春', '机械工业出版社', '62.40', 'This book is a companion to the recognized classic bestseller "Building High-Availability Linux Servers" in the Linux operations field. It crystallizes the author\'s years of experience and best practices from frontline operations work. The book\'s greatest feature is its close integration with practice - all theoretical knowledge, methods, techniques, and cases come from real environments. It covers Shell and Python scripts in production environments, Puppet automated configuration management and Python automated operations (Fabric and Ansible), high-availability Linux cluster construction, and architecture design for billion-level PV websites. Based on traditional operations, the author combines the most popular AWS cloud computing operations technology to share the popular Linux cluster and automated operations knowledge system, helping readers design their own website system architectures based on their actual work scenarios.', '30', '2017-10-21 04:30:06');
INSERT INTO `s_book` VALUES ('17', '11', 'Walking Alone Freely', '贾平凹', '时代华语国际', '28.10', 'Mr. Pingwa has always loved tranquility and fears people knocking on his door. What makes him comfortable is either walking on the land of Northwest China or hiding in his study. He actually also enjoys liveliness, but his liveliness is not bright lights and bustling crowds, but inner peace and the freedom of solitary walking. This book writes about emotions, discusses hobbies, talks about society, and speaks of life. It contains worldly wisdom and the interesting aspects of life. For hurried passersby, this collection is merely a plaything for affectation. But this book is written for those who truly walk through life. May they understand the true meaning of solitude and gain more calmness and ease in life.', '31', '2017-10-21 04:33:58');
INSERT INTO `s_book` VALUES ('18', '11', 'The Skin', '蔡崇达', '天津人民出版社', '31.40', 'The Skin is a collection of essays with the texture of novel reading, and also a book that "knows hearts and people." Author Cai Chongda, with emotions towards his hometown and relatives, tells a series of stories carved into flesh and bone in an objective, detailed, and calm manner. The customs and era changes of a Fujian fishing town are reflected in these warm yet cruel stories. Using "The Skin" as the title with its essential meaning, the author expresses nostalgia for parents and hometown, concern for friends\' fates, while also answering questions we must always answer. The book includes 14 works including "The Skin," "Mother\'s House," "Disability," "Christmas in the ICU," and others. In "The Skin," Aunt Tai, a 99-year-old illiterate fortune teller, teaches the author a powerful life attitude: "The body is for using, not for serving." In "Mother\'s House," the mother wants to build a four-story house because "no one nearby has built to four stories, if we do, we truly stand up." For the house, she does hard labor, picks vegetable leaves, refuses everyone\'s sympathy, just so "in this lifetime, there is always a home to return to." Produced by Han Han, the book received widespread acclaim upon release, praised by Mo Yan, Bai Yansong, A Lai, and Yan Lianke as a pleasant surprise in contemporary writing.', '32', '2017-10-21 04:36:58');
INSERT INTO `s_book` VALUES ('19', '11', 'Seeing', '柴静', '广西师范大学出版社', '25.10', 'Seeing is an autobiographical work by renowned journalist and host Chai Jing, recounting her ten years at China Central Television. It is both Chai Jing\'s personal growth confession and, to some extent, a memoir of China\'s social changes over a decade. Ten years ago, she was chosen to become a national television news anchor but faced setbacks due to lack of experience. After becoming a field reporter during the SARS period, the interwoven realities of life allowed her to gradually break free from external and self-imposed constraints, gaining a broader and deeper understanding of life and human nature. Over ten years, from SARS, Wenchuan earthquake, Two Sessions coverage, Beijing Olympics to investigative reports on the South China Tiger photos and land requisition, Chai Jing\'s presence was found at almost every major event. In this book, she records the moving details buried in grand narratives, leaving personal footnotes for the era. As always, Chai Jing sees and records individuals who left strong life impressions on her in the news. Everyone is deeply embedded in the world; no one can be just a bystander. What others experience, I must experience. The people and events recorded in the book are their lives, and also yours and mine.', '33', '2017-10-21 04:38:54');
INSERT INTO `s_book` VALUES ('20', '11', 'Speaking In Vain', '白岩松', '长江文艺出版社', '23.00', 'Speaking In Vain is CCTV journalist Bai Yansong\'s new work following "Are You Happy?" and "Pain and Happiness," an "autobiographical" spiritual journey. Through deep exchanges with the public at various occasions in recent years, he shares his worldview and values with an attitude of equality and freedom. Spanning fifteen years, it covers current affairs, education, reform, music, reading, and life, speaking warmly and rationally. Refusing to remain silent at an age when one has the right to do so, beating drums and playing strings for those who still have passion and dreams. Although "speaking is not a fun thing," he still yearns to "speak out a better future." Even if "speaking is in vain," yet "not speaking, that truly is in vain."', '34', '2017-10-21 04:40:46');
INSERT INTO `s_book` VALUES ('21', '11', 'To Live', '余华', '北京十月文艺出版社', '26.30', 'To Live is the representative work of contemporary writer Yu Hua. It tells the story of one man\'s life through all the vicissitudes and hardships of the world, condensing within it half a century of social changes in China. To Live also tells of the breadth and richness of tears; it tells of the non-existence of despair; it tells how people live for the sake of living itself, not for anything beyond living. Since its publication 25 years ago, To Live has moved countless readers. Through the test of time, it has become an undisputed classic of 20th-century Chinese literature. To date, it has been translated into over 30 countries and regions including England, France, Germany, Italy, Japan, Korea, and Russia, winning numerous domestic and international literary awards. Yu Hua was awarded the French Order of Arts and Letters in 2004 for this work.', '35', '2017-10-21 04:43:33');
INSERT INTO `s_book` VALUES ('22', '11', 'Thatched Cottage (2016 Edition)', '曹文轩', '江苏凤凰少年儿童出版社', '12.80', 'Thatched Cottage is a tastefully crafted youth novel by Cao Wenxuan. The work depicts the unforgettable six years of elementary school life of a boy named Sang Sang. During those six years, he witnessed or directly participated in a series of seemingly ordinary yet tear-jerking and touching stories: the flawless pure affection between young boys and girls, the tragic dignity and grace of an unfortunate boy struggling against fate, a disabled boy\'s persistent defense of dignity, the character brilliance of an elderly person in their final moment, profound and beautiful insights into life through death experiences, and the complex yet poetic emotional entanglements among adults.', '36', '2017-10-21 04:46:42');
INSERT INTO `s_book` VALUES ('23', '11', 'A Walking Life', '俞敏洪', '人民邮电出版社', '38.30', 'In life, Yu Minhong loves reading, traveling, exercising, as well as thinking and writing. This book collects Yu Minhong\'s recent essays and sketches, revealing wisdom about life through plain language. In business, he tackles difficulties with passion; in life, he is calm, delicate, and full of poetry. Understanding why Yu Minhong became Yu Minhong may be more valuable than reading simple inspirational experiences. The book is divided into six chapters: travel journals, reading notes, life insights, life experiences, on education, and on cultural development. Although casual talk, one can read both "simple charm" and "great wisdom." Meeting old friends in distant lands, knowing Da Bing at first sight and regretting not meeting sooner, thinking continuously while bedridden, reflecting on life looking back at the past, maintaining true heart when facing social problems. Yu Minhong\'s life proves the saying: A gentleman travels ten thousand miles without forgetting his original aspiration.', '37', '2017-10-21 04:48:43');
INSERT INTO `s_book` VALUES ('24', '11', 'Reader 2017 Summer Volume', '读者编辑部', '读者杂志社', '20.50', 'Reader Anthology (2017 Summer Volume, Issues 636-641) adheres to the editorial purpose of "gathering essence from China and abroad, inspiring thoughts, and broadening horizons," following the editorial philosophy that "choosing Reader means choosing excellent culture." It explores truth, goodness, and beauty in human nature, embodying humanistic care. Keeping pace with the times in both content and form, pursuing high taste and quality, striving for excellence, it has won the love and support of readers of all ages and social classes with its richness and diversity in both form and content.', '38', '2017-10-21 04:50:49');
INSERT INTO `s_book` VALUES ('25', '11', 'Alright Okay', '大冰', '湖南文艺出版社', '26.90', 'Kindness is a nature, goodwill is a choice. Goodwill can eliminate hostility, goodwill can gain connections, goodwill can lead to rebirth with karma, goodwill can turn back to shore. Goodwill can help people capture and establish unique happiness. "Alright Okay" is a self-questioning and self-answering phrase for self-salvation and saving others, and also a goodwill of calmness and going with the flow. Alright Okay - million-copy bestselling author Da Bing\'s 2016 new book. In cold places, writing warm-hearted, authentic, kind-spirited stories of the wandering world you can\'t bear to finish reading. The stories in Alright Okay are filled with nostalgia that draws you homeward, love that gives you both armor and vulnerability, prodigal sons who turn back to shore, deeply devoted brothers, men who work, dream and be themselves, and beautiful heroines with elegant fragrance yet all five "poisons." Their stories are real life, they exist in this world. With their powerful little universes breaking through rigid and cold life barriers for you, letting you see lives you could never experience, meeting people you might never befriend. Through actions they teach you to treat the world, life, others with goodwill, and also treat yourself with goodwill.', '39', '2017-10-21 04:53:03');
INSERT INTO `s_book` VALUES ('26', '11', 'The Beauty of Life is Pure Joy', '林清玄', '北京十月文艺出版社', '31.30', 'Lin Qingxuan\'s 2016 brand new essay collection, and his first hand-illustrated classical-style illustrated book on life themes in his 45-year writing career. The book contains 48 classic pieces, carefully selected by millions of online readers, spanning Lin Qingxuan\'s forty-five years of creative career, representing his work style and philosophical wisdom. The book is divided into six volumes covering six major life themes: worldly flavors, living in the present, adapting to circumstances, cold weather and heavy dew, not forgetting original aspirations, and a life of composure. The selections include long-circulated classic pieces like "Warming a Pot of Moonlight for Wine," "Pure Joy," "Snow White Youth," "My Heart Like the Autumn Moon," as well as early classic works such as "Sweet Potato with Red Heart" and "Four Books of Light" from college entrance exam reading materials. Some pieces like "Fragrance of Light" and "Catkins Flying Without Wind" have been selected for national college entrance exam Chinese test papers. Lin Qingxuan uses decades of life experience and wisdom to continuously contemplate the value and meaning of life. Pure joy is a life attitude, a way to find oneself, a supreme life境界. It comes not from elsewhere, but from our pursuit and love of peaceful, plain, and simple life. In a complex world, may we be simple people, letting go of obsessions, not frivolous or anxious, not hurried or slow, viewing the world with a pure heart, living life with a joyful heart, calmly and composedly living each day well.', '40', '2017-10-21 04:54:51');
INSERT INTO `s_book` VALUES ('27', '14', 'Modern Chinese Dictionary', '中国社会科学院语言研究所词典编辑室 ', '商务印书馆', '76.30', 'The Modern Chinese Dictionary has undergone multiple revisions since its official publication in 1978 to adapt to social development, better reflect the new features of modern Chinese vocabulary, embody new research achievements in related disciplines, and implement new national language and writing standards. This revision mainly includes: fully implementing the "General Standard Chinese Character Table" promulgated by the State Council in June 2013; adding over 400 new words and phrases that have emerged in recent years, supplementing nearly 100 new meanings, deleting a small number of outdated and self-evident words; revising definitions and examples of over 700 words based on reader and expert feedback.', '41', '2017-10-29 20:43:53');
INSERT INTO `s_book` VALUES ('28', '14', 'Xinhua Dictionary', '商务印书馆', '商务印书馆', '16.40', 'Xinhua Dictionary (Two-Color Edition, 11th Edition) is revised according to national language standards. It includes over 13,000 single characters. Words are organized by characters, containing over 3,300 annotated words and phrases. Definitions are accurate, examples are appropriate, content is rich, and it is concise and practical. The main text is arranged in phonetic order with a radical index table; includes comprehensive illustrations and appendices.', '42', '2017-10-29 20:45:38');
INSERT INTO `s_book` VALUES ('29', '14', 'Dictionary of Common Ancient Chinese Characters (5th Edition)', '商务印书馆', '商务印书馆', '27.90', 'The Dictionary of Common Ancient Chinese Characters was compiled by over ten renowned linguists including Wang Li, Cen Qixiang, Lin Tao, Dai Li, Tang Zuofan, and Jiang Shaoyu. It is an essential reference book for learning ancient Chinese. Since its publication in 1979, the dictionary has been warmly welcomed by readers. The 5th edition continues the features of the 4th edition: expert scholars directing and participating in revisions; authoritative definitions, accurate pronunciation guidance, appropriate example sentences, with annotations and explanations for difficult examples; special "Notes" and "Analysis" sections to highlight and analyze difficult words; practical appendices including "Chronological Table of Chinese Dynasties," "Introduction to Ancient Chinese Grammar," "How to Learn Ancient Chinese" for reader reference. This revision has done extensive work in supplementing common meanings, improving definitions, reviewing pronunciation, updating examples, and perfecting the format, refining the 4th edition and raising quality to a new level.', '43', '2017-10-29 20:47:06');
INSERT INTO `s_book` VALUES ('30', '16', 'Whiplash: How to Survive Our Faster Future', '[USA] Joi Ito, Jeff Howe', '中信出版集团', '61.80', 'As William Gibson points out: "The future is already here, it\'s just not evenly distributed yet." Whiplash is a postcard from the future. The more significant the moment of change, the more polarization occurs; winners and losers are sometimes decided in a single thought. The future has installed a brand new operating system. This is a major upgrade, bringing with it a steep learning curve for us. In the exponential age, replacing old logic, our thinking urgently needs to interface with the world, overthrowing commonly accepted wisdom of the past, learning differentiated thinking to stand firm and not be swept into the torrent of history. In Whiplash, Joi Ito and Jeff Howe distill this logic into 9 principles: Emergence over Authority, Pull over Push, Compasses over Maps, Risk over Safety, Disobedience over Compliance, Practice over Theory, Diversity over Ability, Resilience over Strength, and Systems over Objects, helping people navigate this turbulent moment and address current challenges. The MIT Media Lab gathers creative talents from around the world, praised as a place where fables come true. Whiplash contains extraordinary case studies and cutting-edge research and philosophical concepts from MIT Media Lab and other institutions, helping you adapt to this unpredictable world and achieve success.', '44', '2017-10-29 20:50:39');
INSERT INTO `s_book` VALUES ('31', '16', 'Influence: The Psychology of Persuasion (Classic Edition)', '[USA] Robert B. Cialdini', '北京联合出版公司', '52.20', 'Since its publication, Influence has been a bestselling masterpiece. Because of its impact, persuasion has become a science. Whether you are an ordinary person or someone advocating for a particular product or cause, this is the most fundamental book, the cornerstone for understanding people\'s psychology. In this book, psychologist Dr. Robert Cialdini explains why some people are extremely persuasive while we are always easily deceived. The 6 major psychological secrets hidden behind the impulse to comply with others\' behavior are the root of it all. Those persuasion masters always skillfully use them to make us comply.', '45', '2017-10-29 20:52:06');
INSERT INTO `s_book` VALUES ('32', '17', 'Charlotte\'s Web (New Edition)', '[USA] E.B. White ', '上海译文出版社', '16.40', 'In the barn of Zuckerman\'s farm, a group of animals live happily, among them little pig Wilbur and spider Charlotte have established a sincere friendship. However, an ugly piece of news breaks the peace of the barn: Wilbur\'s future fate is to become smoked bacon and ham. As a pig, the sad and desperate Wilbur seems to only be able to accept the fate of being slaughtered, but the seemingly insignificant Charlotte says: "I\'ll save you." So, Charlotte uses her silk to weave words on the pig pen that humans regard as miraculous, completely reversing Wilbur\'s fate, finally allowing him to win a special prize at the fair competition and a future of living out his natural life. But at this time, spider Charlotte\'s fate comes to an end... E.B. White uses his humorous writing to tell this very philosophical story in a simple way, about love, about friendship, about life and death...', '46', '2017-10-29 20:54:49');
INSERT INTO `s_book` VALUES ('33', '17', 'Totto-chan: The Little Girl at the Window (New Edition)', '[Japan] Tetsuko Kuroyanagi', '南海出版公司', '24.80', 'Totto-chan: The Little Girl at the Window tells a true story of the author Tetsuko Kuroyanagi when she was in elementary school. Little Totto-chan was expelled from her original school for being naughty, and came to Tomoe Gakuen. Under the care and guidance of Principal Kobayashi, the generally considered "weird" Totto-chan gradually became a child everyone could accept, laying the foundation for her life. Totto-chan: The Little Girl at the Window has not only brought countless laughter and emotions to tens of millions of readers worldwide, but has also injected new vitality into the development of modern education, becoming one of the most influential works of the 20th century.', '47', '2017-10-29 20:56:12');
INSERT INTO `s_book` VALUES ('34', '17', 'The Scarecrow', '叶圣陶 ', '中国少年儿童出版社', '13.50', 'The Scarecrow is the first fairy tale collection written for children in New China, and author Ye Shengtao is also a pioneer of modern Chinese fairy tale creation. His fairy tales have novel and unique concepts, detailed and realistic descriptions, rich in realistic content. This book includes more than ten short and medium-length fairy tales by Ye Shengtao. The Scarecrow truly depicts the turbulent human conditions of rural China in the 1920s through what a compassionate scarecrow sees and thinks. In "The Stone Statue of Ancient Heroes," the large stone carved into a hero statue is worshipped by people and becomes proud, looking down on the small stones beneath it; the statue eventually falls and shatters into gravel, which people pave into a useful path.', '48', '2017-10-29 20:57:34');
INSERT INTO `s_book` VALUES ('35', '17', 'San Mao the Wanderer Complete Collection', '张乐平', ' 少年儿童出版社', '28.50', 'The era that San Mao lived in as described in San Mao the Wanderer Complete Collection (Illustrated Pinyin Edition) has become the past, but understanding the past and understanding history is an answer sheet everyone must complete. Because understanding the past and understanding history can make growth steps more steady and solid, broaden vision and expand heart. In a person\'s growth process, besides fresh air and brilliant sunshine, what is more needed is calm thinking, as well as emotional impact and shock to the heart. When reading San Mao, we can all gain these. San Mao has been permanently deposited in countless people\'s growth memories. It is believed that in future years, San Mao will still bring us many valuable things, allowing us to experience suffering and misfortune, while also learning sympathy, learning to care and cherish. San Mao the Wanderer Complete Collection (Illustrated Pinyin Edition) uses computer technology to carefully color the original artwork and includes detailed text explanations and pinyin to achieve illustrated effect.', '49', '2017-10-29 20:59:36');
INSERT INTO `s_book` VALUES ('36', '18', 'New Collection of 2888 Favorite Home-cooked Dishes', '双福，朱太治 等', '化学工业出版社', '37.80', 'This book carefully selects delicious home-cooked dishes, nourishing soups, and various staple foods that common people love to eat. Each dish is paired with beautiful finished product photos and detailed step-by-step illustrations, providing specific cooking methods for each home-cooked dish, with thoughtful tips on taste, cooking difficulty, and operation time. The book is organized by categories including vegetables, mushrooms, beans and soy products, meat, seafood, eggs and dairy, making it convenient for readers to search. Comes with an extra-long 120-minute VCD disc, watch master chefs demonstrate delicious cuisine!', '50', '2017-10-29 21:02:36');
INSERT INTO `s_book` VALUES ('37', '18', 'Map of China', '中国地图出版社 ', '中国地图出版社 ', '2.90', 'Map of China', '51', '2017-10-29 21:03:39');
INSERT INTO `s_book` VALUES ('38', '21', '1587, A Year of No Significance (Revised Edition)', '[USA] Ray Huang ', '中华书局', '17.10', '1587, A Year of No Significance is a classic that changed how Chinese people read, the breakthrough and representative work of Chinese-American historian Ray Huang. It integrates decades of Mr. Huang\'s life experience and scholarly insights, analyzing the crux of Ming Dynasty society through a "big history" perspective for the first time, observing the path to modern China, thought-provoking. The English version has been adopted as a textbook by many American universities and twice nominated for the American Book Award in history; after the Chinese version was published, it received rave reviews, becoming a desk book for numerous writers, scholars, entrepreneurs, and university teachers and students, and was selected into "The 20 Books with Greatest Impact on China in 20 Years of Reform and Opening" by New Weekly and Book City. Also available in Japanese, French, German, Korean and other versions. The fifteenth year of Wanli, namely 1587 CE, was the year before the Spanish Armada launched its full expedition against England in Western European history; in China, during this seemingly bland year, several events occurred that historians easily overlook. These events, though appearing as trivial details on the surface, are actually the crux of major events that happened before and the opportunity for waves to rise later. In historian Ray Huang\'s eyes, the causal relationships among them are precisely the focus of history, and our big history journey begins from here...', '52', '2017-10-29 21:14:15');
INSERT INTO `s_book` VALUES ('39', '21', 'Sapiens: A Brief History of Humankind', '[Israel] Yuval Noah Harari', ' 中信出版社', '45.30', 'Sapiens: A Brief History of Humankind is a heavyweight work by an Israeli cutting-edge historian. From the beginning of life signs 100,000 years ago to the human development history intertwined with capital and technology in the 21st century. 100,000 years ago, there were at least six human species on Earth, why do only we remain today? We were once just an insignificant group in an African corner, with an impact on Earth\'s ecology no different from fireflies, gorillas, or jellyfish. Why could we reach the top of the biological chain and ultimately become the masters of Earth? From the Cognitive Revolution, Agricultural Revolution to the Scientific Revolution, do we really understand ourselves? Are we happier? Do we know where money and religion come from and why they emerged? Why do empires created by humans rise and fall one after another? Why does almost every society on Earth have patriarchal concepts? Why did monotheism become the most widely accepted religion? How did science and capitalism become the most important creeds of modern society? Clarifying major threads influencing human development, excavating the roots of human culture, religion, law, nation, credit, etc. This is a grand human history, yet seeing the big from the small, making humanity re-examine itself.', '53', '2017-10-29 21:15:59');
INSERT INTO `s_book` VALUES ('40', '21', 'Selected Works of Mao Zedong (4-Volume Set)', '毛泽东', ' 人民出版社', '58.50', 'Selected Works of Mao Zedong (4-Volume Set, Popular Edition) includes important works by Comrade Mao Zedong during various periods of the Chinese revolution. This collection is organized according to historical periods after the founding of the Chinese Communist Party and in chronological order of composition. All writings have been reviewed by the author, with some textual revisions and occasional content supplements and modifications. The collection is divided into four volumes: Volume 1 covers the First and Second Revolutionary Civil Wars; Volumes 2 and 3 cover the Anti-Japanese War period; Volume 4 covers the Third Revolutionary Civil War period. It includes annotations, notes, and commentaries.', '54', '2017-10-29 21:17:31');
INSERT INTO `s_book` VALUES ('41', '21', 'A Grand History of China (10-Volume Set)', '吕思勉，蒋廷黻', '北京理工大学出版社', '192.50', 'This set of A Grand History of China comprises eight major works by four leading modern historians: Lu Simian\'s four dynastic histories (Pre-Qin History, Qin-Han History, Two Jin and Northern-Southern Dynasties History, Sui-Tang-Five Dynasties History), Deng Zhicheng\'s Song-Liao-Jin-Xia-Yuan History, Meng Sen\'s Lectures on Ming History and Lectures on Qing History, and Jiang Tingfu\'s Modern Chinese History. Each work represents outstanding scholarship for its historical period. The set advocates the view that "what the people lack is not historical knowledge but historical perspective" and emphasizes the "grand history" approach, presenting not only academic findings but also the research methods and historical viewpoints of the four great historians. Through these works, readers can liberate themselves from traditional historical knowledge education and learn to forge their own historical perspectives.', '55', '2017-10-29 21:18:41');
INSERT INTO `s_book` VALUES ('42', '21', 'The Silk Roads: A New History of the World', '[英] 彼得.弗兰科潘', '浙江大学出版社', '89.60', 'For two thousand years, the Silk Road has dominated the course of human civilization. Emperors, armies, merchants, scholars, monks, and slaves of different races, beliefs, and cultures traveled this road, creating and transmitting wealth, wisdom, religion, art, war, disease, and disaster. The Silk Road made Chinese silk and civilization popular worldwide; Rome and Persia built their empires along the route; Buddhism, Christianity, and Islam rapidly rose and spread across the world via the Silk Road; Genghis Khan\'s Mongol cavalry rode west, bringing slaughter while promoting East-West cultural integration; the British Empire built its glory by extracting wealth from the Silk Road; Hitler pushed the world into war and massacre for resources along the Silk Road. The history of the Silk Road is a condensed world history; the Silk Road is the brilliant stage of human civilization. It not only dominated humanity\'s past but will determine the world\'s future.', '56', '2017-10-29 21:20:15');
INSERT INTO `s_book` VALUES ('43', '21', 'Classic of Mountains and Seas (Shanhaijing)', '徐客 ', '现代出版社', '59.50', 'Classic of Mountains and Seas is an ancient masterpiece with rich content and unique style, considered the originator of Chinese fantasy literature. The book covers history, geography, ethnicity, religion, mythology, biology, hydraulics, and minerals, making it a treasure of Chinese culture and a concentrated expression of ancient Chinese imagination. This edition collects nearly all available illustrated versions of the Shanhaijing, comprehensively presenting this ancient Chinese work of fantasy and splendor. It deeply reflects various myths and legends of ancient times. For readers who love history, geography, and enjoy studying mysterious and strange things, this is an excellent choice.', '57', '2017-10-29 21:21:43');
INSERT INTO `s_book` VALUES ('44', '21', 'Xi Jinping\'s Seven Years as a Sent-Down Youth', '中央党校采访实录编辑室 ', ' 中共中央党校出版社', '57.00', 'This book includes 76 precious photos, most of which are published for the first time. General Secretary Xi Jinping was born and grew up in New China. He had a turbulent youth and a struggling young adulthood. From village party branch secretary to General Secretary of the Party, from ordinary citizen to President, from ordinary military officer to Chairman of the Central Military Commission, he has served at all leadership levels of the Party and state. Since the 18th Party Congress, the General Secretary has been able to lead the Party and people to overcome difficulties and comprehensively create a new situation for socialism with Chinese characteristics, largely due to his solid practical foundation, profound experience accumulation, and the resulting deep theoretical thinking.', '58', '2017-10-29 21:23:27');
INSERT INTO `s_book` VALUES ('45', '19', 'A Brief History of Time (Illustrated Edition)', '[英] 史蒂芬·霍金', ' 湖南科学技术出版社', '42.80', 'Although Professor Hawking\'s writing is extremely clear and witty, some readers still find it difficult to grasp complex concepts. To help readers deepen their understanding, A Brief History of Time (Illustrated Edition) adds over 240 color illustrations, including satellite images and photographs, thanks to technological advances such as the Hubble Space Telescope and computer three-dimensional and four-dimensional imaging. Detailed illustration descriptions enable readers to experience the vastness of intergalactic space, the wonderful properties of black holes, and the microscopic world of particle physics where matter and antimatter collide. As a classic work offering readers a new understanding of cosmology, A Brief History of Time (Illustrated Edition) is a fascinating story exploring the core secrets of time and space.', '59', '2017-10-29 21:24:55');
INSERT INTO `s_book` VALUES ('46', '19', 'The Universe in Zero Words', '[美] 达纳·麦肯齐', '北京联合出版公司', '43.60', 'The Universe in Zero Words: The Story Behind 24 Mathematical Formulas tells the stories behind 24 beautiful and great formulas in human history, from basic 1+1=2 to Maxwell\'s equations revealing electromagnetic phenomena, from the famous E=mc2 to the mysterious Hamilton\'s quaternion equations. It clearly explains the meaning of each equation, who discovered it and how, and their enormous role in human development history and real life. These stories are both informative and interesting, such as: What does discovering the world\'s simplest equation mean? What would happen if the concept of "0" never existed? How did Newton\'s laws of motion enable humanity to do everything from building bridges to predicting weather? How did a bad cigar change the course of quantum mechanics? Why would whales (if they could communicate with us) teach us completely different geometric concepts? The book also explains why these equations tell eternal secrets about the universe that no human expression can match, and how they surprisingly influenced human history and our daily lives.', '60', '2017-10-29 21:26:04');
INSERT INTO `s_book` VALUES ('47', '19', 'The Origin of (Almost) Everything', '英国《新科学家》杂志', '湖南科学技术出版社', '102.60', 'Where do we come from? How did everything begin? These are the biggest questions in the universe, and New Scientist provides the answers. This book carefully selects 53 representative topics across six major categories, from the Big Bang, dark matter, the origin of life, human evolution, the history of money, the history of alcohol, the past and present of property, genetic drives behind human emotions, to the invention of toilet paper and the secrets of boogers. With concise and poetic narration, it constantly challenges your common sense, often opens your mind, and occasionally adds a touch of bad taste.', '61', '2017-10-29 21:27:36');
INSERT INTO `s_book` VALUES ('48', '19', 'King Solomon\'s Ring', '[奥] 康拉德·洛伦茨 ', '中信出版社 ', '33.30', 'King Solomon\'s Ring is a classic popular science work by renowned science writer and Nobel Prize winner in Physiology Konrad Lorenz. This book cleverly combines scientific knowledge with literary interest, introducing readers to the fascinating world of animal behavior. Through vivid stories about fighting fish, water shrews, jackdaws, and other animals, the author helps people recognize the beauty of nature and understand the significance of animal behavior studies. Why is the book titled King Solomon\'s Ring? Lorenz explains: "According to historical records, King Solomon could talk to birds, beasts, insects, and fish, but he needed the help of a ring. I can do this too, though I can only talk with a few animals I am particularly familiar with, but I don\'t need the help of a magic ring - in this respect, he is not as good as me! Lively life can tell us the most beautiful and true stories without the need for magic. The true face of nature is a thousand times more beautiful than any realm poets can describe."', '62', '2017-10-29 21:29:03');
INSERT INTO `s_book` VALUES ('49', '20', 'Auto Magazine (October 2017 Issue)', '陈政义 ', ' 四川汽车杂志出版有限公司', '17.30', 'Auto Magazine (October 2017 Issue)', '63', '2017-10-29 21:32:33');
INSERT INTO `s_book` VALUES ('50', '20', 'Yilin Compendium 2017 Issues 01-06', '大意林图书 ', '意林杂志社', '28.30', 'Yilin Compendium, small stories with great wisdom, small humor with great truths, small perspectives with grand visions', '64', '2017-10-29 21:33:55');
INSERT INTO `s_book` VALUES ('51', '21', 'Sanlian Life Weekly (2017 Issue 38)', '三联生活周刊编辑部', '生活·读书·新知三联书店', '12.40', 'The Meiji Restoration marks its 150th anniversary next year, coinciding with the introduction of aesthetics to Japan. After passing through the crossroads of East-West cultural conflict, Japan initially moved fully westward, yet ultimately neither joined Europe nor could shed Asia, coexisting with both superiority and inferiority complexes, and in recent years has moved toward returning to its roots. Fukuzawa Yukichi\'s modernization differs from Natsume Soseki\'s modernization. Natsume Soseki, who emphasized inner orientation, has increasingly been brought to the forefront by intellectuals. The results of these two modernization forces are: industrialization and comprehensive education.', '65', '2017-10-29 21:35:02');
INSERT INTO `s_book` VALUES ('52', '20', 'Rayli Home Design (October 2017 Issue)', '周小捷 ', '北京《瑞丽》杂志社', '17.30', 'Rayli Home Design (October 2017 Issue). Featured topics: Detail Transformation, Perfect Complex in the Details, Shining in the Details, Perfect Life for Detail-Oriented People, Embellishing with Bold Colors, Universe in Small Spaces, and more.', '66', '2017-10-29 21:36:19');

-- ----------------------------
-- Table structure for s_catalog
-- ----------------------------
DROP TABLE IF EXISTS `s_catalog`;
CREATE TABLE `s_catalog` (
  `catalogId` int(11) NOT NULL AUTO_INCREMENT,
  `catalogName` varchar(20) NOT NULL,
  PRIMARY KEY (`catalogId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_catalog
-- ----------------------------
INSERT INTO `s_catalog` VALUES ('10', 'Computing & Internet');
INSERT INTO `s_catalog` VALUES ('11', 'Literature & Writing');
INSERT INTO `s_catalog` VALUES ('14', 'Reference & Tools');
INSERT INTO `s_catalog` VALUES ('16', 'Business & Management');
INSERT INTO `s_catalog` VALUES ('17', 'Children & Education');
INSERT INTO `s_catalog` VALUES ('18', 'Lifestyle & Daily');
INSERT INTO `s_catalog` VALUES ('19', 'Science & Technology');
INSERT INTO `s_catalog` VALUES ('20', 'Magazines & Journals');
INSERT INTO `s_catalog` VALUES ('21', 'Humanities & Social Sciences');

-- ----------------------------
-- Table structure for s_order
-- ----------------------------
DROP TABLE IF EXISTS `s_order`;
CREATE TABLE `s_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(50) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL,
  `orderDate` varchar(20) NOT NULL,
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `orderStatus` int(2) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `s_order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `s_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_order
-- ----------------------------
INSERT INTO `s_order` VALUES ('4', '20171028014308536246594163', '1', '2017-10-28 01:43:08', '179.40', '3');
INSERT INTO `s_order` VALUES ('5', '201710280147134731083718986', '1', '2017-10-28 01:47:13', '47.40', '3');
INSERT INTO `s_order` VALUES ('6', '20171028014729305823772816', '1', '2017-10-28 01:47:29', '31.30', '2');
INSERT INTO `s_order` VALUES ('7', '201710280211491251429800191', '1', '2017-10-28 02:11:49', '57.50', '2');
INSERT INTO `s_order` VALUES ('8', '201710280302294231181945122', '1', '2017-10-28 03:02:29', '26.90', '3');
INSERT INTO `s_order` VALUES ('9', '20171028030642623288276560', '1', '2017-10-28 03:06:42', '20.50', '3');
INSERT INTO `s_order` VALUES ('10', '201710281115067252124382547', '1', '2017-10-28 11:15:06', '218.70', '1');
INSERT INTO `s_order` VALUES ('11', '201710282323375401848146265', '4', '2017-10-28 23:23:37', '130.70', '1');
INSERT INTO `s_order` VALUES ('12', '20171029000256785121692725', '4', '2017-10-29 00:02:56', '132.30', '1');
INSERT INTO `s_order` VALUES ('13', '20171029020741681839205568', '5', '2017-10-29 02:07:41', '59.20', '1');
INSERT INTO `s_order` VALUES ('14', '201710290425217551086970157', '5', '2017-10-29 04:25:21', '74.80', '1');
INSERT INTO `s_order` VALUES ('15', '20171029215417298500592807', '5', '2017-10-29 21:54:17', '147.80', '2');
INSERT INTO `s_order` VALUES ('16', '201710301027388351080237993', '1', '2017-10-30 10:27:38', '118.40', '2');
INSERT INTO `s_order` VALUES ('17', '20171030113424459696193114', '6', '2017-10-30 11:34:24', '113.00', '3');
INSERT INTO `s_order` VALUES ('18', '201711011150042211967104268', '5', '2017-11-01 11:50:04', '105.70', '1');
INSERT INTO `s_order` VALUES ('19', '20200414174103389722765893', '7', '2020-04-14 17:41:03', '23.00', '2');
INSERT INTO `s_order` VALUES ('20', '202004141743252121876201871', '7', '2020-04-14 17:43:25', '59.50', '1');

-- ----------------------------
-- Table structure for s_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `s_orderitem`;
CREATE TABLE `s_orderitem` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `s_orderitem_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `s_order` (`orderId`),
  CONSTRAINT `s_orderitem_ibfk_3` FOREIGN KEY (`bookId`) REFERENCES `s_book` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_orderitem
-- ----------------------------
INSERT INTO `s_orderitem` VALUES ('3', '7', '4', '1');
INSERT INTO `s_orderitem` VALUES ('4', '9', '4', '1');
INSERT INTO `s_orderitem` VALUES ('5', '10', '4', '1');
INSERT INTO `s_orderitem` VALUES ('6', '24', '5', '1');
INSERT INTO `s_orderitem` VALUES ('7', '25', '5', '1');
INSERT INTO `s_orderitem` VALUES ('8', '26', '6', '1');
INSERT INTO `s_orderitem` VALUES ('9', '7', '7', '1');
INSERT INTO `s_orderitem` VALUES ('10', '25', '8', '1');
INSERT INTO `s_orderitem` VALUES ('11', '24', '9', '1');
INSERT INTO `s_orderitem` VALUES ('12', '14', '10', '3');
INSERT INTO `s_orderitem` VALUES ('13', '16', '11', '1');
INSERT INTO `s_orderitem` VALUES ('14', '15', '11', '1');
INSERT INTO `s_orderitem` VALUES ('15', '7', '12', '1');
INSERT INTO `s_orderitem` VALUES ('16', '8', '12', '1');
INSERT INTO `s_orderitem` VALUES ('17', '9', '13', '1');
INSERT INTO `s_orderitem` VALUES ('18', '8', '14', '1');
INSERT INTO `s_orderitem` VALUES ('19', '50', '15', '2');
INSERT INTO `s_orderitem` VALUES ('20', '52', '15', '1');
INSERT INTO `s_orderitem` VALUES ('21', '20', '15', '2');
INSERT INTO `s_orderitem` VALUES ('22', '29', '15', '1');
INSERT INTO `s_orderitem` VALUES ('23', '9', '16', '2');
INSERT INTO `s_orderitem` VALUES ('24', '34', '17', '2');
INSERT INTO `s_orderitem` VALUES ('25', '35', '17', '1');
INSERT INTO `s_orderitem` VALUES ('26', '7', '17', '1');
INSERT INTO `s_orderitem` VALUES ('27', '32', '18', '2');
INSERT INTO `s_orderitem` VALUES ('28', '14', '18', '1');
INSERT INTO `s_orderitem` VALUES ('29', '20', '19', '1');
INSERT INTO `s_orderitem` VALUES ('30', '43', '20', '1');

-- ----------------------------
-- Table structure for s_uploadimg
-- ----------------------------
DROP TABLE IF EXISTS `s_uploadimg`;
CREATE TABLE `s_uploadimg` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgName` varchar(50) NOT NULL,
  `imgSrc` varchar(255) NOT NULL,
  `imgType` varchar(20) NOT NULL,
  PRIMARY KEY (`imgId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_uploadimg
-- ----------------------------
INSERT INTO `s_uploadimg` VALUES ('21', '58c815fce64144a3b828fc9e439969ee.jpg', 'images/book/bookimg/58c815fce64144a3b828fc9e439969ee.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('22', '6702f974b4a24ebc81dd0892700cdfde.jpg', 'images/book/bookimg/6702f974b4a24ebc81dd0892700cdfde.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('23', 'c8a48e1b56884acf9540941eb3b47ba8.jpg', 'images/book/bookimg/c8a48e1b56884acf9540941eb3b47ba8.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('24', '9868d1355b7740248380941c69787b5a.jpg', 'images/book/bookimg/9868d1355b7740248380941c69787b5a.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('25', '55a071a52305465892f3afa367af6002.jpg', 'images/book/bookimg/55a071a52305465892f3afa367af6002.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('26', '521fef0b0a5540bd8daae42fb05041c6.jpg', 'images/book/bookimg/521fef0b0a5540bd8daae42fb05041c6.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('27', '02fa17cffed1483c8da972c9062fb046.jpg', 'images/book/bookimg/02fa17cffed1483c8da972c9062fb046.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('28', '26a0af4ed71c4c578740187a25d04c34.jpg', 'images/book/bookimg/26a0af4ed71c4c578740187a25d04c34.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('29', '3f8d24b98f704b5186607ba982cb614c.jpg', 'images/book/bookimg/3f8d24b98f704b5186607ba982cb614c.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('30', 'ef85723c4f0e4c42a7214df18c0fbed3.jpg', 'images/book/bookimg/ef85723c4f0e4c42a7214df18c0fbed3.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('31', '08f709df44434d2aa2ecb0514b195030.jpg', 'images/book/bookimg/08f709df44434d2aa2ecb0514b195030.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('32', '04e694550c444aa0b1538d8f3794dcc6.jpg', 'images/book/bookimg/04e694550c444aa0b1538d8f3794dcc6.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('33', 'e837b0423c56454489ec7b9e47ec6174.jpg', 'images/book/bookimg/e837b0423c56454489ec7b9e47ec6174.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('34', '66ae587289b84744bc9cf86d3da8a446.jpg', 'images/book/bookimg/66ae587289b84744bc9cf86d3da8a446.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('35', 'ff138dd49cab4583b5a4c9dbbae31ed4.jpg', 'images/book/bookimg/ff138dd49cab4583b5a4c9dbbae31ed4.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('36', 'e19f9ccd01c243e9a46caba38ca20586.jpg', 'images/book/bookimg/e19f9ccd01c243e9a46caba38ca20586.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('37', 'b0ead1325a5b4c0fa6610899baa51f28.jpg', 'images/book/bookimg/b0ead1325a5b4c0fa6610899baa51f28.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('38', '9983b67809f44eb782f0b3a6441d8469.jpg', 'images/book/bookimg/9983b67809f44eb782f0b3a6441d8469.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('39', 'c000ee5c42624494ac79b8631d0bde62.jpg', 'images/book/bookimg/c000ee5c42624494ac79b8631d0bde62.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('40', '78f38e26a00544bdbe37db6bc68583e9.jpg', 'images/book/bookimg/78f38e26a00544bdbe37db6bc68583e9.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('41', 'ae8971c37a1541f59695d3912cbd40c9.jpg', 'images/book/bookimg/ae8971c37a1541f59695d3912cbd40c9.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('42', '82a18001737c413fab6633d16d884ef3.jpg', 'images/book/bookimg/82a18001737c413fab6633d16d884ef3.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('43', 'c9e929f131d548acadde5a16f55ac422.jpg', 'images/book/bookimg/c9e929f131d548acadde5a16f55ac422.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('44', '1898df315af04742a648732802ce951e.jpg', 'images/book/bookimg/1898df315af04742a648732802ce951e.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('45', 'bc330378dc59400d9a773ee02eb7518b.jpg', 'images/book/bookimg/bc330378dc59400d9a773ee02eb7518b.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('46', '7a9f5162ee5945a9aa79d0680483e7e8.jpg', 'images/book/bookimg/7a9f5162ee5945a9aa79d0680483e7e8.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('47', '939726ff5b0c42db8c9a7aba68483323.jpg', 'images/book/bookimg/939726ff5b0c42db8c9a7aba68483323.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('48', 'a87ada9fee724f5bb37501800849bd90.jpg', 'images/book/bookimg/a87ada9fee724f5bb37501800849bd90.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('49', '2abd3ee3e07c4d55915778023c2b908d.jpg', 'images/book/bookimg/2abd3ee3e07c4d55915778023c2b908d.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('50', 'b05bf3d3c37446f6b10e9dccd8d5ea79.jpg', 'images/book/bookimg/b05bf3d3c37446f6b10e9dccd8d5ea79.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('51', 'a4bbae03860543d9979af5b4bce0bb4b.jpg', 'images/book/bookimg/a4bbae03860543d9979af5b4bce0bb4b.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('52', '993d74e879d74c5797100d700d2f531e.jpg', 'images/book/bookimg/993d74e879d74c5797100d700d2f531e.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('53', '5da32e1cb73e4ddd8edf99c44a7af307.jpg', 'images/book/bookimg/5da32e1cb73e4ddd8edf99c44a7af307.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('54', 'bb4c75d67ed84c94883e71a7c078d4a7.jpg', 'images/book/bookimg/bb4c75d67ed84c94883e71a7c078d4a7.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('55', 'c51e7c5e05d64304b5fda3d271ccd2d0.jpg', 'images/book/bookimg/c51e7c5e05d64304b5fda3d271ccd2d0.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('56', '1a2805c4f4e14e4eb37fe66e1693bff2.jpg', 'images/book/bookimg/1a2805c4f4e14e4eb37fe66e1693bff2.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('57', 'a29e2fb19bab4f14a6e91cb559cccc9d.jpg', 'images/book/bookimg/a29e2fb19bab4f14a6e91cb559cccc9d.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('58', '4fa5381ff565468c94ae51fdd8747387.jpg', 'images/book/bookimg/4fa5381ff565468c94ae51fdd8747387.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('59', '1260e502775b4326b6748ff9d9259987.jpg', 'images/book/bookimg/1260e502775b4326b6748ff9d9259987.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('60', '50d073b5ab154913b9c6c53def42ccc6.jpg', 'images/book/bookimg/50d073b5ab154913b9c6c53def42ccc6.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('61', 'da18420707624f8ab30cd2d4e7c6de2b.jpg', 'images/book/bookimg/da18420707624f8ab30cd2d4e7c6de2b.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('62', '818f012c5b7a4109b76aed5eab3c86d7.jpg', 'images/book/bookimg/818f012c5b7a4109b76aed5eab3c86d7.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('63', '18613c972e0f4b88a369b062f13cff3d.jpg', 'images/book/bookimg/18613c972e0f4b88a369b062f13cff3d.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('64', '6767e8a6bcb344269be32ed3f98f432c.jpg', 'images/book/bookimg/6767e8a6bcb344269be32ed3f98f432c.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('65', 'e6c925a657e049729f9b57ad688f2708.jpg', 'images/book/bookimg/e6c925a657e049729f9b57ad688f2708.jpg', 'image/jpeg');
INSERT INTO `s_uploadimg` VALUES ('66', '1f3d4937bac1467c9ef69d0141d8800f.jpg', 'images/book/bookimg/1f3d4937bac1467c9ef69d0141d8800f.jpg', 'image/jpeg');

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `userPassWord` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `sex` varchar(2) NOT NULL,
  `age` int(5) NOT NULL,
  `tell` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `enabled` varchar(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('1', 'user', '1234', '测试', '男', '22', '18000000000', '重庆市北碚区新华电脑学校', 'y');
INSERT INTO `s_user` VALUES ('2', 'dsfsd', '1234', 'fsdaf', '男', '32', '18000000000', 'ghsf', 'n');
INSERT INTO `s_user` VALUES ('3', 'gggg', 'gggggg', 'gggggg', '男', '1', '13333333333', 'hggggggg', 'n');
INSERT INTO `s_user` VALUES ('4', 'user2', '1234', '测试用户', '女', '32', '18000000000', '重庆市北碚区', 'y');
INSERT INTO `s_user` VALUES ('5', 'panfei', '1234', '潘飞', '男', '22', '18000000000', '重庆市新华电脑学校', 'y');
INSERT INTO `s_user` VALUES ('6', 'cqxh', '1234', '唐辉煌', '男', '25', '17600000000', '重庆市北碚区新华电脑学校', 'y');
INSERT INTO `s_user` VALUES ('7', 'zzz123', '123456', '王德发', '男', '20', '18636714589', '广东省广州市越秀区越秀北路234号', 'y');

-- ----------------------------
-- View structure for view_book
-- ----------------------------
DROP VIEW IF EXISTS `view_book`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `view_book` AS SELECT
  `s_catalog`.`catalogName`,
  `s_book`.`bookId`,
  `s_book`.`catalogId`,
  `s_book`.`bookName`,
  `s_book`.`price`,
  `s_book`.`description`,
  `s_book`.`imgId`,
  `s_uploadimg`.`imgName`,
  `s_uploadimg`.`imgSrc`,
  `s_uploadimg`.`imgType`,
  `s_book`.`author`,
  `s_book`.`press`,
  `s_book`.`addTime`
FROM
  ((`s_book`
    JOIN `s_catalog` ON ((`s_book`.`catalogId` = `s_catalog`.`catalogId`)))
    JOIN `s_uploadimg` ON ((`s_book`.`imgId` = `s_uploadimg`.`imgId`))) ;

-- ----------------------------
-- View structure for view_order
-- ----------------------------
DROP VIEW IF EXISTS `view_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `view_order` AS SELECT
  `s_orderitem`.`itemId`,
  `s_orderitem`.`bookId`,
  `s_orderitem`.`quantity`,
  `s_order`.`orderId`,
  `s_order`.`orderNum`,
  `s_order`.`userId`,
  `s_order`.`orderDate`,
  `s_order`.`money`,
  `s_order`.`orderStatus`
FROM
  (`s_order`
    JOIN `s_orderitem` ON ((`s_orderitem`.`orderId` = `s_order`.`orderId`))) ;

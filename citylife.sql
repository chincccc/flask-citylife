/*
 Navicat Premium Data Transfer

 Source Server         : chin_local
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : citylife

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 25/05/2021 13:10:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(100) NOT NULL,
  `article_summary` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_read_cnt` int(11) NOT NULL DEFAULT '0',
  `article_pl` int(11) NOT NULL DEFAULT '0',
  `article_sc` int(11) NOT NULL DEFAULT '0',
  `article_date` varchar(255) DEFAULT NULL,
  `article_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/static/upload/top_img/none.png',
  `article_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, '帖子1', 'defreg淡定淡定多发点繁荣昌盛vbggfsッっさcえvrgって', 79, 12, 135, '2020-11-17 16:56', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (3, '帖子3', 'dfvfsfgefgbfgegbfgeageatgbfgseatgbgeaegstagaet\r\nsgdgsdg', 4, 0, 2, '2020-11-17 16:56', '/static/img/1.jpg', 'D', 1);
INSERT INTO `article` VALUES (4, '帖子4', 'dadsfdwvfsevfsvsedcdv f', 1, 0, 14, '2020-11-17 16:56', '/static/img/1.jpg', 'C', 1);
INSERT INTO `article` VALUES (5, '帖子5', '二哥好多帅哥他个人好热他个人和特工作日好邪恶昨天这个如何选择泰国人好邪恶通知\r\n饿软碟通发一句可以入额u他几点有空覆盖，客户\r\n日月潭优酷黄金\r\n            眼睛哭了', 2, 0, 2, '2020-11-17 16:56', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (6, '帖子6', '等我风格荣华富贵单位人通过后晚饭干活呢吗', 1, 0, 17, '2020-11-17 16:56', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (7, '帖子7', 'ss\r\nsss\r\nsss\r\nsss\r\n\r\ns\r\n\r\n      kkk.     \r\n                    llll\r\n', 1, 0, 3, '2020-11-30 08:56', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (8, '帖子8', 'dad\r\ndd.  ddd\r\n             eerie', 2, 0, 2, '2020-11-30 09:57', '/static/img/1.jpg', 'D', 1);
INSERT INTO `article` VALUES (9, '新网营销笔记2社区团购，到底该清醒的人是谁？', '<p class=\"one-p\"><strong>一、社区团购是什么？</strong></p>\n            <p class=\"one-p\">可能很多人还不知道社区团购是啥的，先引用一段文字普及下：</p>\n            <p class=\"one-p\">社区团购就是真实居住社区内居民团体的一种购物消费行为，是依托真实社区的一种区域化、小众化、本地化的团购形式。通过社区商铺为周围(社区内)居民提供的团购形式的优惠活动，促进商铺对核心客户的精准化宣传和消费刺激，实现商铺区域知名度和美誉度的迅速提升，对商铺的营销产生重大效果。</p>\n            <p class=\"one-p\">从文字的表述上看，社区团购的模式真是一个好事，把P多多的模式从线上引到了线下，方便了社区居住的真实居民。说通俗点，就是一个小区的人选一个代表，集中把咱需要的东西去采购回来大家分，单独去买1斤大米，和有组织的去买1000斤大米，肯定买1000斤大米最划算。</p>\n            <p class=\"one-p\">我在上一篇分享中从供应商、平台商、配送员和消费者几个角度做过关于“菜篮子”这个事儿的分析，在此就不赘述了，有需要的朋友可以去翻下我之前的文章，总之，如果各大平台紧盯着菜篮子这个事不放，对各个环节都是一次重大的考验，至少到目前为止，还没有直接的数据或事实证明哪个平台是真正成功的。</p>\n            <p class=\"one-p\"><strong>二、目前的社区团购套路是什么？</strong></p>\n            <p class=\"one-p\">社区团购概念确定后，平台商首先利用手中资本操控流量，对亿万级的流量网民进行X脑，营造皆大欢喜的“场景”；</p>\n            <p class=\"one-p\">然后平台商拿着亿万级的流量去和供应商谈价格，就像一个小区搞团购买1000斤大米，这种流量谈法就至少10000吨大米的买卖了；（当下网上曝出很多供货商公开向社区团购供货，被洗礼了十年以上的供货商在清醒---靠天靠地不如靠自己）；</p>\n            <p class=\"one-p\"><img class=\"content-picture\" src=\"//inews.gtimg.com/newsapp_bt/0/12940964910/1000\">\n            </p>\n            <p class=\"one-p\">拿到优惠的价格，加之各种平台补贴，平台商不断吸引消费者，全民“薅羊毛”的盛况会集中爆发，轻车熟路的方式了，还记得多年前身边有多少人为DD车准备很多部手机在不停的刷吗？平台商帮消费者培养了一种消费习惯，让你上瘾的东西想戒就不容易了，在此时，消费者会发现价格又慢慢长起来了。</p>\n            <p class=\"one-p\">平台商拿的是投资方的钱，打压的是供应商的成本，赚取的是消费者的利润，能否让你想起有这么个故事，一个老头跑到一个X富翁面前说，想让自己的儿子娶富翁的女儿，X富翁没答应，但在老头跟富翁说自己的儿子是XX银行的副行长的时候，富翁答应把女儿嫁给他；然后老头又跑到银行行长那里说，让自己的儿子出任银行副行长，行长不答应，但在老头说自己的儿子是X富翁的女婿时，行长答应了，聪明的老头靠着过人的思维给儿子谋到了锦绣前程。</p>\n            <p class=\"one-p\">该清醒了吗？别问我为啥知道这些，各位看官明白了才是硬道理。</p>\n            <p class=\"one-p\"><strong>三、社区团购模式哪些行业可以去尝试？</strong></p>\n            <p class=\"one-p\">对菜篮子这样的行业，目前本人对使用社区团购的模式去操作持悲观态度。</p>\n            <p class=\"one-p\">不过痛定思痛，既然社区团购的模式有好的一面，那就肯定有适合的行业。</p>\n            <p class=\"one-p\">社区团购可能会更适用于中长期，服务价值比较高的行业，例如社区的孩子教育团购，社区装修团购，社区购车团购等；</p>\n            <p class=\"one-p\">一群宝妈组成团带孩子去参加学习，还能一起交流分享，往往现在的教育机构会忽略到社群优化管理，一味的给孩子讲课去了；</p>\n            <p class=\"one-p\">一群装修友能组团直接到材料工厂、建材市场等选购材料，例如现在市场上的家博会等，往往当下的装修公司会忽略到对客户的二次开发和积累；</p>\n            <p class=\"one-p\">一群车友组团去购车，除了买到车，要是一群开着一样品牌车的车友还能组织些自驾游等活动，是不是会更好？目前我个人买车后，车行是没有拉我进这样的车友群的。</p>\n            <p class=\"one-p\">以上是个人的一点思考，也正在尝试着将社区团购的模式应用到我现在的行业中去，思虑不周的地方还请各位看官一起交流分享。</p>\n            <p class=\"one-p\">精细化区分行业领域，深耕私域流量，会是接下来的趋势。</p>\n            <p class=\"one-p\">喜欢就点赞、评论、关注，更多干货思考会持续分享给大家。</p>', 9, 0, 0, '2020-11-30 10:24', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (10, '不足百字：蚂蚁二次约谈消息稿释放三个强烈信号', '<p>24日早晨，新华社发布了这样一条短消息，依然是“字少事大”体：</p><p><!--StartFragment--></p><p><strong style=\"margin: 0px; padding: 0px;\">【金融管理部门将于近日约谈<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E8%9A%82%E8%9A%81\">蚂蚁</a>集团】</strong></p><p>中国人民银行、中国银保监会、中国证监会、国家外汇管理局将于近日约谈蚂蚁集团，督促指导蚂蚁集团按照市场化、法治化原则，落实<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E9%87%91%E8%9E%8D%E7%9B%91%E7%AE%A1\">金融监管</a>、<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E5%85%AC%E5%B9%B3%E7%AB%9E%E4%BA%89\">公平竞争</a>和保护消费者合法权益等要求，规范金融业务经营与发展。</p><p>标题16个字，正文部分连标点符号在内95个字！信息量却相当充沛。</p><p>对比图先来一张：</p><p class=\"f_center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2020%2F1224%2F9b3a5922j00qltz59001zc000em0070c.jpg&thumbnail=660x2147483647&quality=80&type=jpg\" /></p><p>52天前，蚂蚁集团首次被约谈的消息发布，标题15个字、正文74个字，同样是极简的篇幅、字字千钧。</p><p>两相比照，会发现这可远远不止是标准版与Pro版的区别，看似熟悉的配方、熟悉的味道，实则在变化中释放出三个强烈的信号：</p><p><strong style=\"margin: 0px; padding: 0px;\">第一，明确监管者的定位。</strong></p><p>从首次的“四部门”，到这次的“金融管理部门”，虽然正文出现的四个部门没有变，但是惜字如金、层层把关的新华社通稿，标题绝不是随随便便变化的。</p><p>如果说首次约谈还只是声明了四部门的协同，这次则是精准清晰地定位在了“金融管理”这一职能，明确了约谈者的“主体责任”和约谈的议题，呼应了刚刚闭幕的中央经济工作会议提出的具体要求。</p><p><strong style=\"margin: 0px; padding: 0px;\">第二，流程的调整更尊重市场感受。</strong></p><p>首次约谈，很显然，是谈完了才对外发布，消息一出，可谓石破天惊，一时间也引发了广泛的关注。这次则是有条不紊、非常从容，让各方面能更容易明白这只不过是<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E6%94%BF%E5%BA%9C%E9%83%A8%E9%97%A8\">政府部门</a>履行职责，不需要大惊小怪，更不需要杞人忧天地胡乱关联。</p><p>这也正是中央经济工作会议消息稿里明确指出的：“要加强规制，提升监管能力”，不仅要监管，还要提升“管”的技术和艺术，放大“管”的效果、减小不必要的震动。</p><p><strong style=\"margin: 0px; padding: 0px;\">第三，监管内容更公开透明。</strong></p><p>首次约谈，只说“约”了蚂蚁的相关负责人，没提“谈”的是什么。</p><p>这次约谈，则指向了更具体的执行层面，至少包括了三层意思：</p><p>一是明确了希望蚂蚁集团在后续发展中能够遵循的原则——“市场化、法治化”，前者是说明将继续发挥好市场在资源配置中的作用、鼓励平台经济创新发展，后者则是强调要人人平等、互联网经济巨头也不应该得到特殊对待。</p><p>二是明确了金融监管的目的是要能实现金融“公平竞争”、“保护消费者合法权益等”。互联网平台经济近年来飞速发展，不知不觉中已经改变了人们的消费习惯（甚至是思维习惯），也使得市场的定价权在无形中越来越向少数巨头企业集中，已经出现无序扩张、侵蚀金融稳定、影响消费者权益保护的风险苗头在上升。</p><p>这时候，如果政府不出手，指望以“逐利”为本质属性的资本会突然开始自省甚至改革？答案不言而喻。“无形的手”打底，“有形的手”调节，这才能保证发展的红利惠及更多人。</p><p>三是明确了监管的意义在于“规范金融业务经营与发展”，“管”是肯定要“管”的，但管是为了让市场的竞争比赛更加好看，让场上的选手、场下的观众都能在统一标准的规则下一同欣赏金融创新的协奏曲，在不断完善的治理中促进健康、可持续的发展。</p><p>毕竟，大家好，才是真的好。</p><p><!--EndFragment--></p>\n\n                    <p></p>', 13, 1, 11, '2020-11-30 10:27', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (11, '帖子9', '<h2>nn</h2>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">mmm</div>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">,,,,,,</div>\r\n\r\n<h3 style=\"color:#aaaaaa;font-style:italic;\">mmmmmmmm</h3>\r\n', 4, 0, 10, '2020-11-30 10:41', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (12, '帖子10', '<h1><a href=\"https://www.e0575.com/articleshow.php?aid=146886\" target=\"_blank\">停车位要加，这些堵点要治！</a></h1>\r\n\r\n<p>11月26日，我市召开城市交通治堵工作冲刺部署会，对今年年底和明年年初的治堵工作进行动员部署。记者从会上获悉，&hellip;</p>\r\n\r\n<h1><a href=\"https://www.e0575.com/articleshow.php?aid=146859\" target=\"_blank\">今年已投13.7亿元！绍兴文理学院改扩建工程全力推进</a></h1>\r\n\r\n<p>据绍兴市城投集团消息，今年，绍兴文理学院改扩建工程已完成有效投资约13.7亿元。目前，一期工程已完成校大门主体&hellip;</p>\r\n', 3, 0, 7, '2020-11-30 10:42', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (13, '测试报告', '<h1>测试结果</h1>\r\n\r\n<p>宁波爱信诺航天信息有限公司于2020年12月14日至2020年12月18日，依据GB/T25000.51-2016系统与软件工程 系统与软件质量要求和评价（SQuaRE），对书生OFD版式软件进行测试，测试结果表明：</p>\r\n\r\n<ol>\r\n	<li>软件在安装卸载过程中未发现异常。</li>\r\n	<li>软件在进行功能测试时发现在插入文字注释时存在一定的问题。（详见测试问题汇总的问题一） 在导出导入语义时存在一定的问题。（详见测试问题汇总的问题二）</li>\r\n	<li>软件侧边栏的版本与图层切换功能因功能相关信息不足无法进行测试。</li>\r\n	<li>软件在设计附件功能时只设计了打开与另存为附件的功能，未设计添加附件功能，存在设计缺陷。</li>\r\n	<li>软件操作基本易理解、易浏览且学习门槛低。</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n', 4, 0, 6, '2020-12-24 15:16', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (14, '蚂蚁金服被约谈的意义是什么', '<p><strong>第一，明确监管者的定位。</strong></p>\r\n\r\n<p><span class=\"marker\">从首次的&ldquo;四部门&rdquo;，到这次的&ldquo;金融管理部门&rdquo;，虽然正文出现的四个部门没有变，但是惜字如金、层层把关的新华社通稿，标题绝不是随随便便变化的。</span></p>\r\n\r\n<p>如果说首次约谈还只是声明了四部门的协同，这次则是精准清晰地定位在了&ldquo;金融管理&rdquo;这一职能，明确了约谈者的<em>&ldquo;主体责任&rdquo;</em>和约谈的议题，呼应了刚刚闭幕的中央经济工作会议提出的具体要求。</p>\r\n\r\n<p><strong>第二，流程的调整更尊重市场感受。</strong></p>\r\n\r\n<p>首次约谈，很显然，是谈完了才对外发布，消息一出，可谓石破天惊，一时间也引发了广泛的关注。这次则是有条不紊、非常从容，让各方面能更容易明白这只不过是<a href=\"https://news.163.com/news/search?keyword=%E6%94%BF%E5%BA%9C%E9%83%A8%E9%97%A8\" target=\"_blank\">政府部门</a>履行职责，不需要大惊小怪，更不需要杞人忧天地胡乱关联。</p>\r\n\r\n<p>这也正是中央经济工作会议消息稿里明确指出的：&ldquo;要加强规制，提升监管能力&rdquo;，不仅要监管，还要提升&ldquo;管&rdquo;的技术和艺术，放大&ldquo;管&rdquo;的效果、减小不必要的震动。</p>\r\n\r\n<p><strong>第三，监管内容更公开透明。</strong></p>\r\n\r\n<p>首次约谈，只说&ldquo;约&rdquo;了蚂蚁的相关负责人，没提&ldquo;谈&rdquo;的是什么。</p>\r\n\r\n<p>这次约谈，则指向了更具体的执行层面，至少包括了三层意思：</p>\r\n\r\n<p>一是明确了希望蚂蚁集团在后续发展中能够遵循的原则&mdash;&mdash;&ldquo;市场化、法治化&rdquo;，前者是说明将继续发挥好市场在资源配置中的作用、鼓励平台经济创新发展，后者则是强调要人人平等、互联网经济巨头也不应该得到特殊对待。</p>\r\n\r\n<p>二是明确了金融监管的目的是要能实现金融&ldquo;公平竞争&rdquo;、&ldquo;保护消费者合法权益等&rdquo;。互联网平台经济近年来飞速发展，不知不觉中已经改变了人们的消费习惯（甚至是思维习惯），也使得市场的定价权在无形中越来越向少数巨头企业集中，已经出现无序扩张、侵蚀金融稳定、影响消费者权益保护的风险苗头在上升。</p>\r\n\r\n<p>这时候，如果政府不出手，指望以&ldquo;逐利&rdquo;为本质属性的资本会突然开始自省甚至改革？答案不言而喻。&ldquo;无形的手&rdquo;打底，&ldquo;有形的手&rdquo;调节，这才能保证发展的红利惠及更多人。</p>\r\n\r\n<p>三是明确了监管的意义在于&ldquo;规范金融业务经营与发展&rdquo;，&ldquo;管&rdquo;是肯定要&ldquo;管&rdquo;的，但管是为了让市场的竞争比赛更加好看，让场上的选手、场下的观众都能在统一标准的规则下一同欣赏金融创新的协奏曲，在不断完善的治理中促进健康、可持续的发展。</p>\r\n\r\n<p>毕竟，大家好，才是真的好。</p>\r\n', 7, 1, 6, '2020-12-24 15:33', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (15, '表格测试', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:100%\" summary=\"22\">\r\n	<caption>11</caption>\r\n	<tbody>\r\n		<tr>\r\n			<td>a</td>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>b</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>c</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 0, 0, '2021-03-01 09:54', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (16, '111111111', '<p><img alt=\"\" src=\"https://pan.chin.workers.dev/nn.png\" />11</p>\r\n', 2, 0, 0, '2021-03-01 10:54', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (17, '444444444', '<figure class=\"image\"><img src=\"/static/upload/other/other_20210301_153214.png\"><figcaption>4444</figcaption></figure>', 5, 1, 1, '2021-03-01 15:32', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (19, '是杀杀杀杀杀', '<p>是啥啥啥阿萨</p><p>&nbsp;</p>', 7, 0, 0, '2021-03-10 16:53', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (20, '深度解读苹果M1芯片', '<p><strong>Apple M1 SoC：适用于Mac的A14X</strong></p><p>　　新款Apple M1确实是Apple进行新的重大旅程的开始。在苹果公司的演讲中，该公司并未在设计细节上透露太多，但是有一张幻灯片告诉了我们很多有关芯片的封装和架构的信息：</p><figure class=\"image\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2020%2F1112%2F62428307p00qjo815003uc000qo00efm.png&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></figure><p>　　这种在有机封装中嵌入DRAM的封装方式对苹果来说并不新鲜；他们从A12开始就一直在使用它。当涉及到高端芯片时，苹果喜欢使用这种封装而不是通常的智能手机POP封装(封装上的封装)，因为这些芯片在设计时考虑到了更高的TDP。因此，将DRAM放在计算机芯片的旁边，而不是放在其上，有助于确保这些芯片仍能得到有效冷却。</p>', 11, 1, 2, '2021-03-27 22:14', '/static/img/1.jpg', 'A', 1);
INSERT INTO `article` VALUES (21, '测试测试', '<p>文字测试</p><figure class=\"image\"><img src=\"/static/upload/chin/chin_20210327_224550.jpg\"><figcaption>图片测试</figcaption></figure><p><strong>加粗测试</strong></p><p><i>斜体测试</i></p><p>超链接测试<a href=\"http://www.baidu.com\">http://www.baidu.com</a></p><ul><li>测试a</li><li>测试b</li></ul><ol><li>测试1</li><li>测试2</li></ol><blockquote><p>引用测试</p></blockquote>', 16, 1, 1, '2021-03-27 22:48', '/static/upload/chin/chin_20210327_224550.jpg', 'A', 1);
INSERT INTO `article` VALUES (22, '测试呀啊啊啊', '<p>啥啥啥</p><figure class=\"image\"><img src=\"/static/upload/chin/chin_20210408_134350.png\"></figure>', 6, 1, 0, '2021-04-08 13:43', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (23, '啥啥啥', '<figure class=\"image\"><img src=\"/static/upload/chin/chin_20210408_134600.png\"></figure>', 1, 0, 1, '2021-04-08 13:46', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (24, '啥啥啥', '<figure class=\"image\"><img src=\"/static/upload/chin/chin_20210408_134703.png\"></figure>', 20, 1, 1, '2021-04-08 13:47', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (25, '1111111', '<p>1111111111</p>', 2, 2, 0, '2021-04-12 09:22', '/static/upload/top_img/none.png', 'A', 4);
INSERT INTO `article` VALUES (26, '啥啥啥是多大的', '<p>颠三倒四颠三倒四</p>', 0, 0, 0, '2021-04-13 10:59', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (27, '三生三世设的飞飞飞', '<p>豆腐乳方法打发打发冻豆腐豆腐</p>', 0, 0, 0, '2021-04-13 11:00', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (28, '地方刚发的给大哥打工的', '<p>发个减肥药活该活该好好干活干活</p>', 0, 0, 0, '2021-04-13 11:03', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (29, '为为我去颠三倒四颠三', '<p>顺丰速递v是的哇我打我打魏武大道我的错闲坐着</p>', 1, 0, 0, '2021-04-13 11:04', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (30, '33等等的', '<p>大的发的辅导辅导辅导辅导辅导费</p>', 2, 0, 0, '2021-04-13 11:04', '/static/upload/top_img/none.png', 'A', 1);
INSERT INTO `article` VALUES (31, '感叹号巨款i脚后跟', '<p>赴日共同好友句酷就业合同热天好烦呀</p>', 2, 0, 1, '2021-04-13 11:06', '/static/upload/top_img/uid31.png', 'A', 1);
INSERT INTO `article` VALUES (32, '黄金季节宝贝', '<p>合肥机场坚持坚持仅退款发酒疯</p>', 13, 0, 1, '2021-04-13 22:33', '/static/upload/top_img/uid32.png', 'A', 1);
INSERT INTO `article` VALUES (33, '官方动感单车非官方冬瓜豆腐', '<p>发的顺丰速递粉色的粉色的粉色的佛挡杀佛</p>', 59, 0, 2, '2021-04-15 21:24', '/static/upload/top_img/uid33.png', 'A', 4);
INSERT INTO `article` VALUES (34, '地对地导弹地对地导弹', '<p>到手刀地对地导弹地对地导弹多大的</p>', 2, 0, 1, '2021-04-23 20:32', '/static/upload/top_img/uid34.png', '好物安利', 4);
INSERT INTO `article` VALUES (35, '三生三世', '<p><strong>三生三世试试</strong></p><p><strong>发发发发</strong></p><figure class=\"image\"><img src=\"/static/upload/许家草草/许家草草_20210424_102837.jpeg\"></figure>', 2, 0, 1, '2021-04-24 10:28', '/static/upload/top_img/uid35_2104241028.png', '好物安利', 4);
COMMIT;

-- ----------------------------
-- Table structure for article_sc
-- ----------------------------
DROP TABLE IF EXISTS `article_sc`;
CREATE TABLE `article_sc` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sc_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_sc
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text,
  `comment_date` datetime DEFAULT NULL,
  `article_id` varchar(20) NOT NULL,
  `comment_name` varchar(30) DEFAULT NULL,
  `comment_support` int(11) DEFAULT '0',
  `comment_oppose` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, '<p>dvfvwqdevfedevf</p>', '2020-11-17 16:02:00', '1', '  ', 4, 1, 1);
INSERT INTO `comment` VALUES (2, '<p>dertgrefrdrfe3wfreerwfr</p>', '2020-11-17 16:04:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (3, '<p>re5tyujk</p>', '2020-11-17 16:05:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (4, '<p>rtyuj</p>', '2020-11-17 16:06:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (5, '<p>rtyjhk</p>', '2020-11-17 16:06:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (6, '<p>eyer6tyui</p>', '2020-11-17 16:06:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (7, '<p>sdfv</p>', '2020-11-17 16:30:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (8, '<p>维持v</p>', '2020-11-17 16:50:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (9, '<p>水电费刮风回家</p>', '2020-12-25 15:36:00', '10', '  ', 1, 1, 1);
INSERT INTO `comment` VALUES (10, '', '2020-12-25 16:44:00', '1', '  ', 0, 0, 12);
INSERT INTO `comment` VALUES (11, '<p>sedfghjkl;</p>', '2020-12-25 16:46:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (12, '<p>大家觉得还行吧</p>', '2020-12-25 16:48:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (13, '<p>好的换届选举</p>', '2020-12-25 16:49:00', '1', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (14, '<p>的方法v地方</p>', '2021-03-11 09:10:00', '14', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (15, '<p>牛啊牛啊cook</p>', '2021-03-27 22:14:00', '20', '  ', 3, 1, 1);
INSERT INTO `comment` VALUES (17, '', '2021-04-13 10:17:00', '25', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (18, '<p>纯纯粹粹</p>', '2021-04-13 10:21:00', '24', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (19, '<p>杀杀杀杀杀</p>', '2021-04-13 10:22:00', '25', '  ', 0, 0, 1);
INSERT INTO `comment` VALUES (20, '<p>沟通沟通过</p>', '2021-04-13 10:23:00', '22', '  ', 0, 0, 4);
INSERT INTO `comment` VALUES (21, '<p>发财树v输入v输入v</p>', '2021-04-13 10:25:00', '17', '  ', 1, 0, 4);
INSERT INTO `comment` VALUES (22, '<p>啥啥啥</p>', '2021-04-24 10:31:00', '21', '  ', 0, 0, 4);
COMMIT;

-- ----------------------------
-- Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count` (
  `dbname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dbvalue` int(11) DEFAULT '1',
  PRIMARY KEY (`dbname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of count
-- ----------------------------
BEGIN;
INSERT INTO `count` VALUES ('user', 15);
COMMIT;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) NOT NULL DEFAULT '0',
  `receive_id` int(11) NOT NULL DEFAULT '0',
  `foolow_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`follow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
BEGIN;
INSERT INTO `follow` VALUES (104, 1, 4, '2104130854');
INSERT INTO `follow` VALUES (108, 4, 1, '2021年04月24日 10:30');
COMMIT;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------
BEGIN;
INSERT INTO `login_log` VALUES (2, 1, '127.0.0.1', '2021年04月13日 10:12');
INSERT INTO `login_log` VALUES (3, 1, '127.0.0.1', '2021年04月13日 10:21');
INSERT INTO `login_log` VALUES (4, 1, '127.0.0.1', '2021年04月13日 10:22');
INSERT INTO `login_log` VALUES (5, 4, '127.0.0.1', '2021年04月13日 10:23');
INSERT INTO `login_log` VALUES (6, 1, '127.0.0.1', '2021年04月13日 10:23');
INSERT INTO `login_log` VALUES (7, 4, '127.0.0.1', '2021年04月13日 10:25');
INSERT INTO `login_log` VALUES (8, 1, '127.0.0.1', '2021年04月13日 10:25');
INSERT INTO `login_log` VALUES (9, 1, '127.0.0.1', '2021年04月13日 10:41');
INSERT INTO `login_log` VALUES (10, 4, '127.0.0.1', '2021年04月13日 10:41');
INSERT INTO `login_log` VALUES (11, 4, '127.0.0.1', '2021年04月13日 10:45');
INSERT INTO `login_log` VALUES (12, 4, '127.0.0.1', '2021年04月13日 10:48');
INSERT INTO `login_log` VALUES (13, 4, '127.0.0.1', '2021年04月13日 10:51');
INSERT INTO `login_log` VALUES (14, 1, '127.0.0.1', '2021年04月13日 10:59');
INSERT INTO `login_log` VALUES (15, 1, '127.0.0.1', '2021年04月13日 11:00');
INSERT INTO `login_log` VALUES (16, 1, '127.0.0.1', '2021年04月13日 11:02');
INSERT INTO `login_log` VALUES (17, 1, '127.0.0.1', '2021年04月13日 11:03');
INSERT INTO `login_log` VALUES (18, 1, '127.0.0.1', '2021年04月13日 11:04');
INSERT INTO `login_log` VALUES (19, 1, '127.0.0.1', '2021年04月13日 11:06');
INSERT INTO `login_log` VALUES (20, 1, '127.0.0.1', '2021年04月13日 11:28');
INSERT INTO `login_log` VALUES (21, 1, '127.0.0.1', '2021年04月13日 18:33');
INSERT INTO `login_log` VALUES (22, 1, '127.0.0.1', '2021年04月13日 18:34');
INSERT INTO `login_log` VALUES (23, 1, '127.0.0.1', '2021年04月13日 18:51');
INSERT INTO `login_log` VALUES (24, 1, '127.0.0.1', '2021年04月13日 19:10');
INSERT INTO `login_log` VALUES (25, 4, '127.0.0.1', '2021年04月13日 19:11');
INSERT INTO `login_log` VALUES (26, 1, '127.0.0.1', '2021年04月13日 19:11');
INSERT INTO `login_log` VALUES (27, 1, '127.0.0.1', '2021年04月13日 19:12');
INSERT INTO `login_log` VALUES (28, 4, '127.0.0.1', '2021年04月13日 19:12');
INSERT INTO `login_log` VALUES (29, 1, '127.0.0.1', '2021年04月13日 19:13');
INSERT INTO `login_log` VALUES (30, 4, '127.0.0.1', '2021年04月13日 19:13');
INSERT INTO `login_log` VALUES (31, 4, '127.0.0.1', '2021年04月13日 19:27');
INSERT INTO `login_log` VALUES (32, 4, '127.0.0.1', '2021年04月13日 19:27');
INSERT INTO `login_log` VALUES (33, 4, '127.0.0.1', '2021年04月13日 19:29');
INSERT INTO `login_log` VALUES (34, 4, '127.0.0.1', '2021年04月13日 19:38');
INSERT INTO `login_log` VALUES (35, 4, '127.0.0.1', '2021年04月13日 19:40');
INSERT INTO `login_log` VALUES (36, 4, '127.0.0.1', '2021年04月13日 19:42');
INSERT INTO `login_log` VALUES (37, 4, '127.0.0.1', '2021年04月13日 19:43');
INSERT INTO `login_log` VALUES (38, 4, '127.0.0.1', '2021年04月13日 19:43');
INSERT INTO `login_log` VALUES (39, 4, '127.0.0.1', '2021年04月13日 20:07');
INSERT INTO `login_log` VALUES (40, 4, '127.0.0.1', '2021年04月13日 20:28');
INSERT INTO `login_log` VALUES (41, 4, '127.0.0.1', '2021年04月13日 20:30');
INSERT INTO `login_log` VALUES (42, 4, '127.0.0.1', '2021年04月13日 20:36');
INSERT INTO `login_log` VALUES (43, 4, '127.0.0.1', '2021年04月13日 20:42');
INSERT INTO `login_log` VALUES (44, 4, '127.0.0.1', '2021年04月13日 20:45');
INSERT INTO `login_log` VALUES (45, 4, '127.0.0.1', '2021年04月13日 20:46');
INSERT INTO `login_log` VALUES (46, 4, '127.0.0.1', '2021年04月13日 20:55');
INSERT INTO `login_log` VALUES (47, 4, '127.0.0.1', '2021年04月13日 20:55');
INSERT INTO `login_log` VALUES (48, 4, '127.0.0.1', '2021年04月13日 20:56');
INSERT INTO `login_log` VALUES (49, 4, '127.0.0.1', '2021年04月13日 20:58');
INSERT INTO `login_log` VALUES (50, 4, '127.0.0.1', '2021年04月13日 21:07');
INSERT INTO `login_log` VALUES (51, 4, '127.0.0.1', '2021年04月13日 21:08');
INSERT INTO `login_log` VALUES (52, 4, '127.0.0.1', '2021年04月13日 21:10');
INSERT INTO `login_log` VALUES (53, 4, '127.0.0.1', '2021年04月13日 21:19');
INSERT INTO `login_log` VALUES (54, 4, '127.0.0.1', '2021年04月13日 21:22');
INSERT INTO `login_log` VALUES (55, 4, '127.0.0.1', '2021年04月13日 21:29');
INSERT INTO `login_log` VALUES (56, 4, '127.0.0.1', '2021年04月13日 21:32');
INSERT INTO `login_log` VALUES (57, 4, '127.0.0.1', '2021年04月13日 21:33');
INSERT INTO `login_log` VALUES (58, 1, '127.0.0.1', '2021年04月13日 21:34');
INSERT INTO `login_log` VALUES (59, 4, '127.0.0.1', '2021年04月13日 21:35');
INSERT INTO `login_log` VALUES (60, 1, '127.0.0.1', '2021年04月13日 21:37');
INSERT INTO `login_log` VALUES (61, 4, '127.0.0.1', '2021年04月13日 21:41');
INSERT INTO `login_log` VALUES (62, 4, '127.0.0.1', '2021年04月13日 21:45');
INSERT INTO `login_log` VALUES (63, 4, '127.0.0.1', '2021年04月13日 21:46');
INSERT INTO `login_log` VALUES (64, 4, '127.0.0.1', '2021年04月13日 21:48');
INSERT INTO `login_log` VALUES (65, 4, '127.0.0.1', '2021年04月13日 21:48');
INSERT INTO `login_log` VALUES (66, 4, '127.0.0.1', '2021年04月13日 21:50');
INSERT INTO `login_log` VALUES (67, 4, '127.0.0.1', '2021年04月13日 21:50');
INSERT INTO `login_log` VALUES (68, 4, '127.0.0.1', '2021年04月13日 21:50');
INSERT INTO `login_log` VALUES (69, 4, '127.0.0.1', '2021年04月13日 22:00');
INSERT INTO `login_log` VALUES (70, 4, '127.0.0.1', '2021年04月13日 22:01');
INSERT INTO `login_log` VALUES (71, 1, '127.0.0.1', '2021年04月13日 22:02');
INSERT INTO `login_log` VALUES (72, 1, '127.0.0.1', '2021年04月13日 22:02');
INSERT INTO `login_log` VALUES (73, 4, '127.0.0.1', '2021年04月13日 22:03');
INSERT INTO `login_log` VALUES (74, 1, '127.0.0.1', '2021年04月13日 22:03');
INSERT INTO `login_log` VALUES (75, 1, '127.0.0.1', '2021年04月13日 22:04');
INSERT INTO `login_log` VALUES (76, 4, '127.0.0.1', '2021年04月13日 22:04');
INSERT INTO `login_log` VALUES (77, 4, '127.0.0.1', '2021年04月13日 22:09');
INSERT INTO `login_log` VALUES (78, 4, '127.0.0.1', '2021年04月13日 22:09');
INSERT INTO `login_log` VALUES (79, 1, '127.0.0.1', '2021年04月13日 22:10');
INSERT INTO `login_log` VALUES (80, 4, '127.0.0.1', '2021年04月13日 22:14');
INSERT INTO `login_log` VALUES (81, 1, '127.0.0.1', '2021年04月13日 22:14');
INSERT INTO `login_log` VALUES (82, 4, '127.0.0.1', '2021年04月13日 22:18');
INSERT INTO `login_log` VALUES (83, 1, '192.168.2.134', '2021年04月13日 22:28');
INSERT INTO `login_log` VALUES (84, 1, '192.168.2.134', '2021年04月13日 22:30');
INSERT INTO `login_log` VALUES (85, 1, '192.168.2.134', '2021年04月13日 22:31');
INSERT INTO `login_log` VALUES (86, 1, '192.168.2.134', '2021年04月13日 22:31');
INSERT INTO `login_log` VALUES (87, 4, '127.0.0.1', '2021年04月13日 22:32');
INSERT INTO `login_log` VALUES (88, 1, '192.168.2.134', '2021年04月13日 22:41');
INSERT INTO `login_log` VALUES (89, 1, '192.168.2.134', '2021年04月13日 22:42');
INSERT INTO `login_log` VALUES (90, 1, '192.168.2.134', '2021年04月13日 22:43');
INSERT INTO `login_log` VALUES (91, 1, '192.168.2.134', '2021年04月13日 22:43');
INSERT INTO `login_log` VALUES (92, 4, '127.0.0.1', '2021年04月13日 22:46');
INSERT INTO `login_log` VALUES (93, 4, '127.0.0.1', '2021年04月13日 22:51');
INSERT INTO `login_log` VALUES (94, 4, '127.0.0.1', '2021年04月13日 22:53');
INSERT INTO `login_log` VALUES (95, 1, '127.0.0.1', '2021年04月13日 22:55');
INSERT INTO `login_log` VALUES (96, 1, '192.168.2.134', '2021年04月13日 22:55');
INSERT INTO `login_log` VALUES (97, 1, '127.0.0.1', '2021年04月15日 18:23');
INSERT INTO `login_log` VALUES (98, 1, '127.0.0.1', '2021年04月15日 19:10');
INSERT INTO `login_log` VALUES (99, 1, '127.0.0.1', '2021年04月15日 19:11');
INSERT INTO `login_log` VALUES (100, 1, '127.0.0.1', '2021年04月15日 19:12');
INSERT INTO `login_log` VALUES (101, 1, '127.0.0.1', '2021年04月15日 19:13');
INSERT INTO `login_log` VALUES (102, 1, '127.0.0.1', '2021年04月15日 19:21');
INSERT INTO `login_log` VALUES (103, 1, '127.0.0.1', '2021年04月15日 19:23');
INSERT INTO `login_log` VALUES (104, 1, '127.0.0.1', '2021年04月15日 19:24');
INSERT INTO `login_log` VALUES (105, 1, '127.0.0.1', '2021年04月15日 19:24');
INSERT INTO `login_log` VALUES (106, 1, '127.0.0.1', '2021年04月15日 19:26');
INSERT INTO `login_log` VALUES (107, 1, '127.0.0.1', '2021年04月15日 19:27');
INSERT INTO `login_log` VALUES (108, 1, '127.0.0.1', '2021年04月15日 19:27');
INSERT INTO `login_log` VALUES (109, 1, '127.0.0.1', '2021年04月15日 19:32');
INSERT INTO `login_log` VALUES (110, 1, '127.0.0.1', '2021年04月15日 19:35');
INSERT INTO `login_log` VALUES (111, 1, '127.0.0.1', '2021年04月15日 19:36');
INSERT INTO `login_log` VALUES (112, 1, '127.0.0.1', '2021年04月15日 19:37');
INSERT INTO `login_log` VALUES (113, 1, '127.0.0.1', '2021年04月15日 19:39');
INSERT INTO `login_log` VALUES (114, 1, '127.0.0.1', '2021年04月15日 19:43');
INSERT INTO `login_log` VALUES (115, 1, '127.0.0.1', '2021年04月15日 19:46');
INSERT INTO `login_log` VALUES (116, 1, '127.0.0.1', '2021年04月15日 19:47');
INSERT INTO `login_log` VALUES (117, 1, '127.0.0.1', '2021年04月15日 19:50');
INSERT INTO `login_log` VALUES (118, 1, '127.0.0.1', '2021年04月15日 19:53');
INSERT INTO `login_log` VALUES (119, 1, '127.0.0.1', '2021年04月15日 19:58');
INSERT INTO `login_log` VALUES (120, 1, '127.0.0.1', '2021年04月15日 19:59');
INSERT INTO `login_log` VALUES (121, 1, '127.0.0.1', '2021年04月15日 20:03');
INSERT INTO `login_log` VALUES (122, 1, '127.0.0.1', '2021年04月15日 20:05');
INSERT INTO `login_log` VALUES (123, 1, '127.0.0.1', '2021年04月15日 20:08');
INSERT INTO `login_log` VALUES (124, 1, '127.0.0.1', '2021年04月15日 20:14');
INSERT INTO `login_log` VALUES (125, 1, '127.0.0.1', '2021年04月15日 20:15');
INSERT INTO `login_log` VALUES (126, 1, '127.0.0.1', '2021年04月15日 20:16');
INSERT INTO `login_log` VALUES (127, 1, '127.0.0.1', '2021年04月15日 20:18');
INSERT INTO `login_log` VALUES (128, 1, '127.0.0.1', '2021年04月15日 20:25');
INSERT INTO `login_log` VALUES (129, 1, '127.0.0.1', '2021年04月15日 20:28');
INSERT INTO `login_log` VALUES (130, 1, '127.0.0.1', '2021年04月15日 20:29');
INSERT INTO `login_log` VALUES (131, 1, '127.0.0.1', '2021年04月15日 20:30');
INSERT INTO `login_log` VALUES (132, 1, '127.0.0.1', '2021年04月15日 20:31');
INSERT INTO `login_log` VALUES (133, 1, '127.0.0.1', '2021年04月15日 20:32');
INSERT INTO `login_log` VALUES (134, 4, '127.0.0.1', '2021年04月15日 20:32');
INSERT INTO `login_log` VALUES (135, 4, '127.0.0.1', '2021年04月15日 20:32');
INSERT INTO `login_log` VALUES (136, 1, '127.0.0.1', '2021年04月15日 20:35');
INSERT INTO `login_log` VALUES (137, 4, '127.0.0.1', '2021年04月15日 20:35');
INSERT INTO `login_log` VALUES (138, 4, '127.0.0.1', '2021年04月15日 20:36');
INSERT INTO `login_log` VALUES (139, 1, '127.0.0.1', '2021年04月15日 20:36');
INSERT INTO `login_log` VALUES (140, 4, '127.0.0.1', '2021年04月15日 20:40');
INSERT INTO `login_log` VALUES (141, 1, '127.0.0.1', '2021年04月15日 20:41');
INSERT INTO `login_log` VALUES (142, 4, '127.0.0.1', '2021年04月15日 20:43');
INSERT INTO `login_log` VALUES (143, 4, '127.0.0.1', '2021年04月15日 20:47');
INSERT INTO `login_log` VALUES (144, 1, '127.0.0.1', '2021年04月15日 20:48');
INSERT INTO `login_log` VALUES (145, 4, '127.0.0.1', '2021年04月15日 20:50');
INSERT INTO `login_log` VALUES (146, 4, '127.0.0.1', '2021年04月15日 20:52');
INSERT INTO `login_log` VALUES (147, 4, '127.0.0.1', '2021年04月15日 20:54');
INSERT INTO `login_log` VALUES (148, 4, '127.0.0.1', '2021年04月15日 20:55');
INSERT INTO `login_log` VALUES (149, 4, '127.0.0.1', '2021年04月15日 20:58');
INSERT INTO `login_log` VALUES (150, 4, '127.0.0.1', '2021年04月15日 21:03');
INSERT INTO `login_log` VALUES (151, 4, '127.0.0.1', '2021年04月15日 21:03');
INSERT INTO `login_log` VALUES (152, 4, '127.0.0.1', '2021年04月15日 21:24');
INSERT INTO `login_log` VALUES (153, 4, '127.0.0.1', '2021年04月15日 21:43');
INSERT INTO `login_log` VALUES (154, 4, '127.0.0.1', '2021年04月15日 21:44');
INSERT INTO `login_log` VALUES (155, 4, '127.0.0.1', '2021年04月15日 21:44');
INSERT INTO `login_log` VALUES (156, 1, '127.0.0.1', '2021年04月15日 21:45');
INSERT INTO `login_log` VALUES (157, 4, '127.0.0.1', '2021年04月15日 21:47');
INSERT INTO `login_log` VALUES (158, 4, '127.0.0.1', '2021年04月15日 21:48');
INSERT INTO `login_log` VALUES (159, 4, '127.0.0.1', '2021年04月15日 21:48');
INSERT INTO `login_log` VALUES (160, 4, '127.0.0.1', '2021年04月16日 07:54');
INSERT INTO `login_log` VALUES (161, 1, '127.0.0.1', '2021年04月16日 07:54');
INSERT INTO `login_log` VALUES (162, 4, '127.0.0.1', '2021年04月16日 07:55');
INSERT INTO `login_log` VALUES (163, 1, '127.0.0.1', '2021年04月16日 07:55');
INSERT INTO `login_log` VALUES (164, 4, '127.0.0.1', '2021年04月16日 07:59');
INSERT INTO `login_log` VALUES (165, 1, '127.0.0.1', '2021年04月16日 08:00');
INSERT INTO `login_log` VALUES (166, 1, '127.0.0.1', '2021年04月16日 08:02');
INSERT INTO `login_log` VALUES (167, 1, '127.0.0.1', '2021年04月16日 08:05');
INSERT INTO `login_log` VALUES (168, 1, '127.0.0.1', '2021年04月16日 08:06');
INSERT INTO `login_log` VALUES (169, 1, '127.0.0.1', '2021年04月16日 08:07');
INSERT INTO `login_log` VALUES (170, 1, '127.0.0.1', '2021年04月16日 08:08');
INSERT INTO `login_log` VALUES (171, 4, '127.0.0.1', '2021年04月16日 08:09');
INSERT INTO `login_log` VALUES (172, 4, '127.0.0.1', '2021年04月16日 08:13');
INSERT INTO `login_log` VALUES (173, 1, '127.0.0.1', '2021年04月16日 08:14');
INSERT INTO `login_log` VALUES (174, 4, '127.0.0.1', '2021年04月16日 08:15');
INSERT INTO `login_log` VALUES (175, 1, '127.0.0.1', '2021年04月16日 08:16');
INSERT INTO `login_log` VALUES (176, 4, '127.0.0.1', '2021年04月16日 08:21');
INSERT INTO `login_log` VALUES (177, 4, '127.0.0.1', '2021年04月16日 08:21');
INSERT INTO `login_log` VALUES (178, 4, '127.0.0.1', '2021年04月16日 08:23');
INSERT INTO `login_log` VALUES (179, 4, '127.0.0.1', '2021年04月16日 08:32');
INSERT INTO `login_log` VALUES (180, 1, '127.0.0.1', '2021年04月16日 08:32');
INSERT INTO `login_log` VALUES (181, 4, '127.0.0.1', '2021年04月16日 08:33');
INSERT INTO `login_log` VALUES (182, 1, '127.0.0.1', '2021年04月16日 08:33');
INSERT INTO `login_log` VALUES (183, 4, '127.0.0.1', '2021年04月16日 08:48');
INSERT INTO `login_log` VALUES (184, 4, '127.0.0.1', '2021年04月16日 08:50');
INSERT INTO `login_log` VALUES (185, 1, '127.0.0.1', '2021年04月16日 09:06');
INSERT INTO `login_log` VALUES (186, 1, '127.0.0.1', '2021年04月16日 09:23');
INSERT INTO `login_log` VALUES (187, 1, '127.0.0.1', '2021年04月16日 09:25');
INSERT INTO `login_log` VALUES (188, 1, '127.0.0.1', '2021年04月16日 09:25');
INSERT INTO `login_log` VALUES (189, 1, '127.0.0.1', '2021年04月16日 09:25');
INSERT INTO `login_log` VALUES (190, 1, '127.0.0.1', '2021年04月16日 09:26');
INSERT INTO `login_log` VALUES (191, 1, '127.0.0.1', '2021年04月16日 09:29');
INSERT INTO `login_log` VALUES (192, 1, '127.0.0.1', '2021年04月16日 09:30');
INSERT INTO `login_log` VALUES (193, 1, '127.0.0.1', '2021年04月16日 09:31');
INSERT INTO `login_log` VALUES (194, 1, '127.0.0.1', '2021年04月16日 09:32');
INSERT INTO `login_log` VALUES (195, 1, '127.0.0.1', '2021年04月16日 09:33');
INSERT INTO `login_log` VALUES (196, 1, '127.0.0.1', '2021年04月16日 09:34');
INSERT INTO `login_log` VALUES (197, 1, '127.0.0.1', '2021年04月16日 09:35');
INSERT INTO `login_log` VALUES (198, 1, '127.0.0.1', '2021年04月16日 09:40');
INSERT INTO `login_log` VALUES (199, 1, '127.0.0.1', '2021年04月16日 09:42');
INSERT INTO `login_log` VALUES (200, 1, '127.0.0.1', '2021年04月16日 09:43');
INSERT INTO `login_log` VALUES (201, 1, '127.0.0.1', '2021年04月16日 09:43');
INSERT INTO `login_log` VALUES (202, 1, '127.0.0.1', '2021年04月16日 09:45');
INSERT INTO `login_log` VALUES (203, 1, '127.0.0.1', '2021年04月16日 09:46');
INSERT INTO `login_log` VALUES (204, 1, '127.0.0.1', '2021年04月16日 09:47');
INSERT INTO `login_log` VALUES (205, 1, '127.0.0.1', '2021年04月16日 09:48');
INSERT INTO `login_log` VALUES (206, 1, '127.0.0.1', '2021年04月16日 09:48');
INSERT INTO `login_log` VALUES (207, 1, '127.0.0.1', '2021年04月16日 09:51');
INSERT INTO `login_log` VALUES (208, 1, '127.0.0.1', '2021年04月16日 09:52');
INSERT INTO `login_log` VALUES (209, 1, '127.0.0.1', '2021年04月16日 09:53');
INSERT INTO `login_log` VALUES (210, 1, '127.0.0.1', '2021年04月16日 09:54');
INSERT INTO `login_log` VALUES (211, 1, '127.0.0.1', '2021年04月16日 09:56');
INSERT INTO `login_log` VALUES (212, 1, '127.0.0.1', '2021年04月16日 09:57');
INSERT INTO `login_log` VALUES (213, 1, '127.0.0.1', '2021年04月16日 09:58');
INSERT INTO `login_log` VALUES (214, 1, '127.0.0.1', '2021年04月16日 09:58');
INSERT INTO `login_log` VALUES (215, 1, '127.0.0.1', '2021年04月16日 10:00');
INSERT INTO `login_log` VALUES (216, 1, '127.0.0.1', '2021年04月16日 10:01');
INSERT INTO `login_log` VALUES (217, 1, '127.0.0.1', '2021年04月16日 10:02');
INSERT INTO `login_log` VALUES (218, 4, '127.0.0.1', '2021年04月16日 10:04');
INSERT INTO `login_log` VALUES (219, 4, '127.0.0.1', '2021年04月16日 10:10');
INSERT INTO `login_log` VALUES (220, 4, '127.0.0.1', '2021年04月16日 10:15');
INSERT INTO `login_log` VALUES (221, 4, '127.0.0.1', '2021年04月16日 10:16');
INSERT INTO `login_log` VALUES (222, 1, '127.0.0.1', '2021年04月16日 10:17');
INSERT INTO `login_log` VALUES (223, 1, '127.0.0.1', '2021年04月16日 10:28');
INSERT INTO `login_log` VALUES (224, 1, '127.0.0.1', '2021年04月16日 10:30');
INSERT INTO `login_log` VALUES (225, 15, '127.0.0.1', '2021年04月16日 13:30');
INSERT INTO `login_log` VALUES (226, 15, '127.0.0.1', '2021年04月16日 15:23');
INSERT INTO `login_log` VALUES (227, 15, '127.0.0.1', '2021年04月16日 15:39');
INSERT INTO `login_log` VALUES (228, 15, '127.0.0.1', '2021年04月16日 21:24');
INSERT INTO `login_log` VALUES (229, 1, '127.0.0.1', '2021年04月17日 20:03');
INSERT INTO `login_log` VALUES (230, 1, '127.0.0.1', '2021年04月17日 20:08');
INSERT INTO `login_log` VALUES (231, 1, '127.0.0.1', '2021年04月19日 16:02');
INSERT INTO `login_log` VALUES (232, 1, '127.0.0.1', '2021年04月19日 16:04');
INSERT INTO `login_log` VALUES (233, 1, '127.0.0.1', '2021年04月19日 16:11');
INSERT INTO `login_log` VALUES (234, 1, '127.0.0.1', '2021年04月19日 16:37');
INSERT INTO `login_log` VALUES (235, 1, '127.0.0.1', '2021年04月22日 19:28');
INSERT INTO `login_log` VALUES (236, 1, '127.0.0.1', '2021年04月22日 19:30');
INSERT INTO `login_log` VALUES (237, 1, '127.0.0.1', '2021年04月22日 19:34');
INSERT INTO `login_log` VALUES (238, 1, '127.0.0.1', '2021年04月22日 19:34');
INSERT INTO `login_log` VALUES (239, 1, '127.0.0.1', '2021年04月22日 19:44');
INSERT INTO `login_log` VALUES (240, 1, '127.0.0.1', '2021年04月22日 19:51');
INSERT INTO `login_log` VALUES (241, 1, '127.0.0.1', '2021年04月22日 19:51');
INSERT INTO `login_log` VALUES (242, 1, '127.0.0.1', '2021年04月23日 12:33');
INSERT INTO `login_log` VALUES (243, 1, '127.0.0.1', '2021年04月23日 12:40');
INSERT INTO `login_log` VALUES (244, 1, '127.0.0.1', '2021年04月23日 12:40');
INSERT INTO `login_log` VALUES (245, 1, '127.0.0.1', '2021年04月23日 18:58');
INSERT INTO `login_log` VALUES (246, 1, '127.0.0.1', '2021年04月23日 18:58');
INSERT INTO `login_log` VALUES (247, 4, '127.0.0.1', '2021年04月23日 18:58');
INSERT INTO `login_log` VALUES (248, 4, '127.0.0.1', '2021年04月23日 19:07');
INSERT INTO `login_log` VALUES (249, 4, '127.0.0.1', '2021年04月23日 19:08');
INSERT INTO `login_log` VALUES (250, 4, '127.0.0.1', '2021年04月23日 20:21');
INSERT INTO `login_log` VALUES (251, 1, '127.0.0.1', '2021年04月23日 20:26');
INSERT INTO `login_log` VALUES (252, 4, '127.0.0.1', '2021年04月23日 20:26');
INSERT INTO `login_log` VALUES (253, 4, '127.0.0.1', '2021年04月23日 20:30');
INSERT INTO `login_log` VALUES (254, 4, '127.0.0.1', '2021年04月23日 20:33');
INSERT INTO `login_log` VALUES (255, 4, '127.0.0.1', '2021年04月23日 21:59');
INSERT INTO `login_log` VALUES (256, 4, '127.0.0.1', '2021年04月23日 22:07');
INSERT INTO `login_log` VALUES (257, 4, '127.0.0.1', '2021年04月23日 22:08');
INSERT INTO `login_log` VALUES (258, 4, '127.0.0.1', '2021年04月23日 22:08');
INSERT INTO `login_log` VALUES (259, 4, '127.0.0.1', '2021年04月23日 22:10');
INSERT INTO `login_log` VALUES (260, 4, '127.0.0.1', '2021年04月23日 22:11');
INSERT INTO `login_log` VALUES (261, 4, '127.0.0.1', '2021年04月23日 22:13');
INSERT INTO `login_log` VALUES (262, 4, '127.0.0.1', '2021年04月23日 22:20');
INSERT INTO `login_log` VALUES (263, 4, '127.0.0.1', '2021年04月23日 22:22');
INSERT INTO `login_log` VALUES (264, 4, '127.0.0.1', '2021年04月23日 22:23');
INSERT INTO `login_log` VALUES (265, 4, '127.0.0.1', '2021年04月23日 22:25');
INSERT INTO `login_log` VALUES (266, 4, '127.0.0.1', '2021年04月23日 22:26');
INSERT INTO `login_log` VALUES (267, 4, '127.0.0.1', '2021年04月23日 22:27');
INSERT INTO `login_log` VALUES (268, 4, '127.0.0.1', '2021年04月23日 22:28');
INSERT INTO `login_log` VALUES (269, 4, '127.0.0.1', '2021年04月23日 22:29');
INSERT INTO `login_log` VALUES (270, 4, '127.0.0.1', '2021年04月23日 22:30');
INSERT INTO `login_log` VALUES (271, 4, '127.0.0.1', '2021年04月23日 22:34');
INSERT INTO `login_log` VALUES (272, 4, '127.0.0.1', '2021年04月23日 22:39');
INSERT INTO `login_log` VALUES (273, 4, '127.0.0.1', '2021年04月23日 22:41');
INSERT INTO `login_log` VALUES (274, 4, '127.0.0.1', '2021年04月23日 22:42');
INSERT INTO `login_log` VALUES (275, 4, '127.0.0.1', '2021年04月23日 22:44');
INSERT INTO `login_log` VALUES (276, 4, '127.0.0.1', '2021年04月23日 22:46');
INSERT INTO `login_log` VALUES (277, 4, '127.0.0.1', '2021年04月23日 22:48');
INSERT INTO `login_log` VALUES (278, 4, '127.0.0.1', '2021年04月23日 22:49');
INSERT INTO `login_log` VALUES (279, 4, '127.0.0.1', '2021年04月23日 23:28');
INSERT INTO `login_log` VALUES (280, 4, '127.0.0.1', '2021年04月23日 23:29');
INSERT INTO `login_log` VALUES (281, 4, '127.0.0.1', '2021年04月23日 23:32');
INSERT INTO `login_log` VALUES (282, 4, '127.0.0.1', '2021年04月23日 23:47');
INSERT INTO `login_log` VALUES (283, 4, '127.0.0.1', '2021年04月23日 23:48');
INSERT INTO `login_log` VALUES (284, 4, '127.0.0.1', '2021年04月24日 10:28');
INSERT INTO `login_log` VALUES (285, 1, '127.0.0.1', '2021年04月24日 10:30');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_type` int(11) DEFAULT '0',
  `send_id` int(11) NOT NULL DEFAULT '0',
  `receive_id` int(11) NOT NULL DEFAULT '0',
  `send_time` varchar(255) NOT NULL,
  `mess_content` varchar(255) DEFAULT NULL,
  `read_state` int(11) NOT NULL DEFAULT '1' COMMENT '1未读，0已读，-1已删',
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (1, 2, 1, 4, '2104130854', '您有一个新的粉丝', 0);
INSERT INTO `message` VALUES (2, 2, 4, 1, '2104130924', '您有一个新的粉丝', 0);
INSERT INTO `message` VALUES (3, 1, 1, 4, '2021年04月13日 10:22', '<p>杀杀杀杀杀</p>', 0);
INSERT INTO `message` VALUES (4, 1, 4, 1, '2021年04月13日 10:23', '<p>沟通沟通过</p>', 0);
INSERT INTO `message` VALUES (5, 1, 4, 1, '2021年04月13日 10:25', '发财树v输入v输入v ', 0);
INSERT INTO `message` VALUES (7, 0, 1, 4, '2021年04月13日 19:12', '得到的地对地导弹地对地导弹多大的', 0);
INSERT INTO `message` VALUES (8, 0, 5, 4, '2021年04月13日 19:13', '测试测试测试测试测试测试测试测试测试测试', 0);
INSERT INTO `message` VALUES (9, 0, 4, 1, '2021年04月13日 19:13', '颠三倒四vv风格违规潍坊得到的', 0);
INSERT INTO `message` VALUES (10, 0, 4, 1, '2021年04月13日 19:14', '颠三倒四vv风格违规潍坊得到的222', 0);
INSERT INTO `message` VALUES (11, 0, 4, 1, '2021年04月13日 21:57', 'sasassssssssssssss', 0);
INSERT INTO `message` VALUES (12, 0, 4, 1, '2021年04月13日 22:01', '123', 0);
INSERT INTO `message` VALUES (13, 0, 4, 1, '2021年04月13日 22:11', '111', 0);
INSERT INTO `message` VALUES (14, 0, 1, 4, '2021年04月13日 22:11', '牛啊', 0);
INSERT INTO `message` VALUES (15, 0, 1, 4, '2021年04月13日 22:14', 'sss', 0);
INSERT INTO `message` VALUES (16, 0, 4, 1, '2021年04月13日 22:32', '服服服', 0);
INSERT INTO `message` VALUES (17, 0, 1, 4, '2021年04月13日 22:32', '你你你你', 0);
INSERT INTO `message` VALUES (18, 0, 1, 4, '2021年04月13日 22:55', '粉色的发的', 0);
INSERT INTO `message` VALUES (19, 0, 1, 4, '2021年04月13日 22:55', '粉色的发的快快快', 0);
INSERT INTO `message` VALUES (20, 0, 4, 1, '2021年04月15日 20:33', 'sss', 0);
INSERT INTO `message` VALUES (21, 0, 4, 1, '2021年04月15日 20:35', 'fdsfdf', 0);
INSERT INTO `message` VALUES (22, 0, 4, 1, '2021年04月15日 20:36', 'gvdfvd', 0);
INSERT INTO `message` VALUES (23, 0, 4, 1, '2021年04月15日 20:36', 'gvdfvd', 0);
INSERT INTO `message` VALUES (24, 0, 4, 1, '2021年04月15日 20:38', 'kjk', 0);
INSERT INTO `message` VALUES (25, 0, 4, 1, '2021年04月15日 20:41', 'nbn', 0);
INSERT INTO `message` VALUES (26, 0, 1, 4, '2021年04月15日 20:48', '大三大四', 0);
INSERT INTO `message` VALUES (27, 0, 1, 4, '2021年04月15日 21:45', '淡定淡定', 0);
INSERT INTO `message` VALUES (28, 0, 1, 4, '2021年04月16日 07:54', '2112', 0);
INSERT INTO `message` VALUES (29, 0, 1, 4, '2021年04月16日 07:54', '2112www', 0);
INSERT INTO `message` VALUES (30, 0, 1, 4, '2021年04月16日 07:56', '啥啥啥', 0);
INSERT INTO `message` VALUES (31, 0, 1, 4, '2021年04月16日 07:56', '啥啥啥得到的', 0);
INSERT INTO `message` VALUES (32, 0, 1, 4, '2021年04月16日 08:00', '啥啥试试', 0);
INSERT INTO `message` VALUES (33, 0, 1, 4, '2021年04月16日 08:01', '啥啥试试发广告飞飞哥', 0);
INSERT INTO `message` VALUES (34, 0, 1, 4, '2021年04月16日 08:02', '将就将就', 0);
INSERT INTO `message` VALUES (35, 0, 1, 4, '2021年04月16日 08:05', '辅导辅导发财', 0);
INSERT INTO `message` VALUES (36, 0, 1, 4, '2021年04月16日 08:06', '啥啥啥啥啊', 0);
INSERT INTO `message` VALUES (37, 0, 1, 4, '2021年04月16日 08:07', '个人听说热歌三个人', 0);
INSERT INTO `message` VALUES (38, 0, 1, 4, '2021年04月16日 08:09', '杀杀杀杀杀', 0);
INSERT INTO `message` VALUES (39, 0, 4, 1, '2021年04月16日 08:14', '杀杀杀杀杀啥事', 0);
INSERT INTO `message` VALUES (40, 0, 4, 1, '2021年04月16日 08:16', '啥啥啥', 0);
INSERT INTO `message` VALUES (41, 0, 1, 4, '2021年04月16日 08:32', 'hjhjhjjh', 0);
INSERT INTO `message` VALUES (42, 0, 4, 1, '2021年04月16日 08:33', 'o ', 0);
INSERT INTO `message` VALUES (43, 0, 1, 4, '2021年04月16日 08:34', 'ssss', 0);
INSERT INTO `message` VALUES (44, 0, 4, 1, '2021年04月16日 08:50', '啥啥啥', 0);
INSERT INTO `message` VALUES (45, 0, 1, 4, '2021年04月23日 18:58', 'dwdwd', 0);
INSERT INTO `message` VALUES (46, 0, 1, 4, '2021年04月23日 18:59', '1111', 0);
INSERT INTO `message` VALUES (47, 0, 4, 1, '2021年04月23日 18:59', '2323232', 0);
INSERT INTO `message` VALUES (48, 0, 1, 4, '2021年04月23日 18:59', 'dsdsdsdsd', 0);
INSERT INTO `message` VALUES (49, 0, 4, 1, '2021年04月23日 22:42', '啥啥啥', 0);
INSERT INTO `message` VALUES (50, 0, 4, 1, '2021年04月23日 22:45', '是多少', 0);
INSERT INTO `message` VALUES (51, 0, 4, 1, '2021年04月23日 22:45', '是多少啊', 0);
INSERT INTO `message` VALUES (52, 0, 4, 1, '2021年04月23日 22:48', '等待', 0);
INSERT INTO `message` VALUES (53, 2, 4, 1, '2021年04月23日 23:44', '您有一个新的粉丝', 1);
INSERT INTO `message` VALUES (54, 0, 4, 15, '2021年04月23日 23:51', '啦啦啦', 1);
INSERT INTO `message` VALUES (55, 0, 1, 4, '2021年04月24日 10:30', '测试1', 0);
INSERT INTO `message` VALUES (56, 0, 1, 4, '2021年04月24日 10:30', '测试1啥啥啥', 0);
INSERT INTO `message` VALUES (57, 2, 4, 1, '2021年04月24日 10:30', '您有一个新的粉丝', 1);
INSERT INTO `message` VALUES (58, 1, 4, 1, '2021年04月24日 10:31', '啥啥啥 ', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `tx_link` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/static/tx_upload/tx.png' COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `birthday` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `now_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '现居地',
  `home_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家乡',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信',
  `weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微博',
  `readme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `money` double(255,0) DEFAULT NULL COMMENT '余额',
  `register_date` varchar(255) DEFAULT NULL COMMENT '注册日期',
  `following_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '关注人数',
  `follower_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝人数',
  `mess_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '消息数',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'chin', '/static/tx_upload/uid1.png', '男', '2021-04-09', '浙江宁波', '浙江绍兴', '741444015', 'chin_ccc', 'https://weibo.com/u/6042093759', '老板来杯乌龙茶', NULL, '2020年10月18日 21:12', 1, 1, 3);
INSERT INTO `user` VALUES (2, '张三', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年10月18日 21:12', 0, 0, 0);
INSERT INTO `user` VALUES (3, '草草', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年10月18日 21:12', 0, 0, 0);
INSERT INTO `user` VALUES (4, '许家草草', '/static/tx_upload/uid4_2104232329.png', '女', '2021-04-29', '发的啥赴日色', '粉色粉色', '2322323', '32323', '32323', '323232啥啥啥', NULL, '2020年11月03日 14:41', 1, 0, 0);
INSERT INTO `user` VALUES (5, 'user1', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月03日 14:48', 0, 0, 0);
INSERT INTO `user` VALUES (6, '1111', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月04日 15:46', 0, 0, 0);
INSERT INTO `user` VALUES (7, '2222', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月04日 15:49', 0, 0, 0);
INSERT INTO `user` VALUES (8, '123123', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月04日 15:51', 0, 0, 0);
INSERT INTO `user` VALUES (9, '7414', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月04日 15:55', 0, 0, 0);
INSERT INTO `user` VALUES (10, '7477', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月04日 15:59', 0, 0, 0);
INSERT INTO `user` VALUES (11, '123456', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年11月09日 11:55', 0, 0, 0);
INSERT INTO `user` VALUES (12, 'zuroon', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020年12月25日 16:43', 0, 0, 0);
INSERT INTO `user` VALUES (13, '085527', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021年04月07日 16:54', 0, 0, 0);
INSERT INTO `user` VALUES (15, 'chincc', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021年04月16日 13:29', 0, 0, 0);
INSERT INTO `user` VALUES (16, 'q1q1', '/static/tx_upload/tx.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021年04月16日 13:33', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号( 昵称）唯一',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱 唯一',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机 唯一',
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `is_admin` int(2) NOT NULL DEFAULT '0' COMMENT '是否管理员,0否1是',
  `is_enable` int(2) NOT NULL DEFAULT '0' COMMENT '是否启用,用于封禁',
  `lastlogin` varchar(255) NOT NULL COMMENT '上次登录时间',
  `pay_password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
BEGIN;
INSERT INTO `user_login` VALUES (1, 'chin', 'chin.cc@qq.com', '13056839322', 'pbkdf2:sha256:50000$irAx0sp7$291b200f899e365628f33a274c224b3d14ef852cdac302a5302c4e43063c7142', 1, 1, '2021年04月24日 10:30', NULL);
INSERT INTO `user_login` VALUES (2, '张三', '1112@qq.com', '13056839321', 'pbkdf2:sha256:50000$4QfHFoOn$3c3c2cc2acf0a175c2a60e85128c0bd7dcd73ae18088d82430c05bcd867eebb8', 0, 1, '2010', NULL);
INSERT INTO `user_login` VALUES (3, '草草', '1@q.com', '13056839320', 'pbkdf2:sha256:50000$tjuBrHqj$81fb8b3eec0a528ea323b9882bc6dd097527d34e00076b6f14ef190cf9df9762', 0, 1, '2020年10月18日 21:12', NULL);
INSERT INTO `user_login` VALUES (4, '许家草草', '741444017@qq.com', '14725836912', 'pbkdf2:sha256:50000$eEAUmc5G$3c6723be7b063b7316622d1ceb49f5f14ed3d252c7c28917052b268c1bfdfbac', 0, 1, '2021年04月24日 10:28', NULL);
INSERT INTO `user_login` VALUES (5, 'user1', '741444016@qq.com', '', 'pbkdf2:sha256:50000$HD70WJoL$2636a8980e230bb494c413de83dc738a2e061f85d977ae4ef584a1a4690b82cb', 0, 1, '2020年11月03日 14:48', NULL);
INSERT INTO `user_login` VALUES (6, '1111', '741444014@qq.com', '', 'pbkdf2:sha256:150000$hcC9DrIq$9b9343e0234493f5289c74019323cac728878d90806732bbcb9195e20524d865', 0, 1, '2020年11月04日 15:46', NULL);
INSERT INTO `user_login` VALUES (7, '2222', '741444075@qq.com', '', 'pbkdf2:sha256:150000$8rKKkl10$0e70521c217c8a5748fc8efe20d87c0c4b2a900899c6ac3c59ecb457800b9db8', 0, 1, '2020年11月04日 15:49', NULL);
INSERT INTO `user_login` VALUES (8, '123123', '7414440151@qq.com', '', 'pbkdf2:sha256:150000$8rKKkl10$0e70521c217c8a5748fc8efe20d87c0c4b2a900899c6ac3c59ecb457800b9db8', 0, 1, '2020年11月04日 15:51', NULL);
INSERT INTO `user_login` VALUES (9, '7414', '46351351@ss.com', '', 'pbkdf2:sha256:150000$8rKKkl10$0e70521c217c8a5748fc8efe20d87c0c4b2a900899c6ac3c59ecb457800b9db8', 0, 1, '2020年11月04日 15:55', NULL);
INSERT INTO `user_login` VALUES (10, '7477', '111@q.com', '', 'pbkdf2:sha256:150000$t32dCI13$434a4d101fea389743dfafdf970f8fc52a64515acf4682ce6cc8b5c8a61af28b', 0, 1, '2020年11月04日 15:59', NULL);
INSERT INTO `user_login` VALUES (11, '123456', '137815497@qq.com', '', 'pbkdf2:sha256:150000$9zjbMd2g$5c05b31e3bc7a215b8fb2181b29477a0e0fd06f21c99a4387613f060ed52fb71', 0, 1, '2020年11月09日 11:55', NULL);
INSERT INTO `user_login` VALUES (12, 'zuroon', '2057375156@qq.com', '', 'pbkdf2:sha256:150000$T7a4ydg3$558128eabce351e83f7ab62d63a286627de6b19c62bb6a12dccca53d26f470a4', 0, 1, '2020年12月25日 16:43', NULL);
INSERT INTO `user_login` VALUES (13, '085527', '3333@11.com', '', 'pbkdf2:sha256:150000$GZKsrRsh$b0147b8f2cf2e3e80ffffd68e3f51fe91b2ba7a2453ce22dfbac94cd575e4cff', 0, 1, '2021年04月07日 16:54', NULL);
INSERT INTO `user_login` VALUES (15, 'chincc', 'chincc@qq.com', '', 'pbkdf2:sha256:150000$0W7t1iJP$6a5d150c140301b2107312ea6c994b88966aeaed40ec7287a0a8120a3437c5c4', 0, 1, '2021年04月16日 21:24', NULL);
INSERT INTO `user_login` VALUES (16, 'q1q1', 'chinccc@qq.com', '', 'pbkdf2:sha256:150000$XWtiNeky$8b236977bde71b624f9a69690e703f3f650298b78106b1d17b73af0e3bc29444', 0, 1, '2021年04月16日 13:33', NULL);
COMMIT;

-- ----------------------------
-- Table structure for verify
-- ----------------------------
DROP TABLE IF EXISTS `verify`;
CREATE TABLE `verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `yzm` varchar(255) DEFAULT NULL,
  `sendtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verify
-- ----------------------------
BEGIN;
INSERT INTO `verify` VALUES (1, '741444015@qq.com', '923047', '2011031254');
INSERT INTO `verify` VALUES (2, '741444015@qq.com', '266673', '2011031301');
INSERT INTO `verify` VALUES (3, '741444015@qq.com', '477313', '2011031314');
INSERT INTO `verify` VALUES (4, '741444015@qq.com', '020826', '2011031314');
INSERT INTO `verify` VALUES (5, '741444015@qq.com', '499071', '2011031317');
INSERT INTO `verify` VALUES (6, '741444015@qq.com', '127277', '2011031317');
INSERT INTO `verify` VALUES (7, '741444015@qq.com', '737493', '2011031318');
INSERT INTO `verify` VALUES (8, '741444015@qq.com', '146569', '2011031323');
INSERT INTO `verify` VALUES (9, '741444015@qq.com', '611830', '2011031323');
INSERT INTO `verify` VALUES (10, '741444015@qq.com', '682800', '2011031324');
INSERT INTO `verify` VALUES (11, '741444015@qq.com', '603088', '2011031325');
INSERT INTO `verify` VALUES (12, '741444015@qq.com', '381495', '2011031412');
INSERT INTO `verify` VALUES (13, '741444015@qq.com', '537392', '2011031413');
INSERT INTO `verify` VALUES (14, '741444015@qq.com', '315529', '2011031413');
INSERT INTO `verify` VALUES (15, '741444015@qq.com', '011520', '2011031415');
INSERT INTO `verify` VALUES (16, '741444015@qq.com', '857373', '2011031415');
INSERT INTO `verify` VALUES (17, '741444015@qq.com', '232248', '2011031419');
INSERT INTO `verify` VALUES (18, '741444015@qq.com', '857556', '2011031420');
INSERT INTO `verify` VALUES (19, '741444015@qq.com', '501250', '2011031422');
INSERT INTO `verify` VALUES (20, '741444015@qq.com', '810776', '2011031423');
INSERT INTO `verify` VALUES (21, '741444015@qq.com', '154849', '2011031423');
INSERT INTO `verify` VALUES (22, '741444015@qq.com', '679029', '2011031424');
INSERT INTO `verify` VALUES (23, '741444015@qq.com', '231388', '2011031425');
INSERT INTO `verify` VALUES (24, '741444015@qq.com', '233603', '2011031427');
INSERT INTO `verify` VALUES (25, '741444015@qq.com', '176385', '2011031428');
INSERT INTO `verify` VALUES (26, '741444015@qq.com', '370044', '2011031432');
INSERT INTO `verify` VALUES (27, '741444015@qq.com', '349313', '2011031433');
INSERT INTO `verify` VALUES (28, '741444015@qq.com', '331669', '2011031434');
INSERT INTO `verify` VALUES (29, '741444015@qq.com', '123456', '2011031435');
INSERT INTO `verify` VALUES (30, '741444015@qq.com', '556161', '2011031436');
INSERT INTO `verify` VALUES (31, '741444015@qq.com', '570780', '2011031437');
INSERT INTO `verify` VALUES (32, '741444015@qq.com', '594427', '2011031437');
INSERT INTO `verify` VALUES (33, '741444015@qq.com', '717430', '2011031440');
INSERT INTO `verify` VALUES (34, '741444015@qq.com', '805964', '2011031441');
INSERT INTO `verify` VALUES (35, '741444017@qq.com', '973558', '2011031442');
INSERT INTO `verify` VALUES (36, '741444015@qq.com', '729979', '2011031444');
INSERT INTO `verify` VALUES (37, '741444015@qq.com', '584378', '2011031448');
INSERT INTO `verify` VALUES (38, '741444015@qq.com', '053146', '2011031507');
INSERT INTO `verify` VALUES (39, '741444015@qq.com', '964095', '2011031508');
INSERT INTO `verify` VALUES (40, '741444015@qq.com', '606562', '2011031412');
INSERT INTO `verify` VALUES (41, '741444015@qq.com', '846187', '2011041544');
INSERT INTO `verify` VALUES (42, '741444015@qq.com', '292891', '2011041545');
INSERT INTO `verify` VALUES (43, '741444015@qq.com', '995205', '2011041548');
INSERT INTO `verify` VALUES (44, '7414440151@qq.com', '498454', '2011041550');
INSERT INTO `verify` VALUES (45, '777@qq.com', '951903', '2011041552');
INSERT INTO `verify` VALUES (46, '46351351@ss.com', '528856', '2011041555');
INSERT INTO `verify` VALUES (47, '111@q.com', '930389', '2011041559');
INSERT INTO `verify` VALUES (48, '741444015@qq.com', '643387', '2011081730');
INSERT INTO `verify` VALUES (49, '741444015@qq.com', '501745', '2011081731');
INSERT INTO `verify` VALUES (50, '741444015@qq.com', '636984', '2011081733');
INSERT INTO `verify` VALUES (51, '741444015@qq.com', '497999', '2011081734');
INSERT INTO `verify` VALUES (52, '1111123@111.com', '909883', '2011081735');
INSERT INTO `verify` VALUES (53, '137815497@qq.com', '587453', '2011091154');
INSERT INTO `verify` VALUES (54, 'a1846039192@sina.com', '655212', '2012251641');
INSERT INTO `verify` VALUES (55, '2057375156@qq.com', '693231', '2012251642');
INSERT INTO `verify` VALUES (56, 'chincc.work@outlook.com', '215996', '2103272225');
INSERT INTO `verify` VALUES (57, '3333@11.com', '085527', '2104071653');
INSERT INTO `verify` VALUES (58, 'chincc@qq.com', '042471', '2104161327');
INSERT INTO `verify` VALUES (59, 'chinccc@qq.com', '572424', '2104161331');
INSERT INTO `verify` VALUES (60, 'chincccc@qq.com', '476857', '2104161335');
INSERT INTO `verify` VALUES (61, '1821968913@qq.com', '501453', '2104162017');
COMMIT;

-- ----------------------------
-- Triggers structure for table user_login
-- ----------------------------
DROP TRIGGER IF EXISTS `update_count`;
delimiter ;;
CREATE TRIGGER `update_count` AFTER INSERT ON `user_login` FOR EACH ROW begin -- 触发器内容开始
	-- 触发器内容主体，每行用分号结尾
	UPDATE count SET dbvalue=dbvalue+1 WHERE dbname='user';
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user_login
-- ----------------------------
DROP TRIGGER IF EXISTS `update_count2`;
delimiter ;;
CREATE TRIGGER `update_count2` AFTER DELETE ON `user_login` FOR EACH ROW begin -- 触发器内容开始
	-- 触发器内容主体，每行用分号结尾
	UPDATE count SET dbvalue=dbvalue-1 WHERE dbname='user';
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user_login
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert`;
delimiter ;;
CREATE TRIGGER `after_insert` AFTER INSERT ON `user_login` FOR EACH ROW begin -- 触发器内容开始
	-- 触发器内容主体，每行用分号结尾
	insert into user(uid,account,register_date) values(new.uid,new.account,new.lastlogin);
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

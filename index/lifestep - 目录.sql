
--
-- Database: `lifestep`
--

-- --------------------------------------------------------

--
-- 表的结构 `ls_addons`   插件信息统计表，没用
--

CREATE TABLE `ls_addons` (
  `addonId` int(4) UNSIGNED NOT NULL COMMENT '插件id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '插件文件夹名',
  `pluginName` varchar(255) NOT NULL DEFAULT '' COMMENT '插件在后台显示的名字',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '插件作者',
  `info` tinytext COMMENT '插件信息',
  `version` varchar(50) DEFAULT NULL COMMENT '插件版本',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '插件状态。0为未启用，1为启用',
  `lastupdate` varchar(255) DEFAULT '' COMMENT '最后更新时间',
  `site` varchar(255) DEFAULT NULL COMMENT '插件作者的网站',
  `tsVersion` varchar(11) NOT NULL DEFAULT '2.5' COMMENT '依赖ts的版本。预留。必填',
  `is_weixin` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_addons`   插件内容转存 （这是从别的数据库抄来的，没有删）
--

INSERT INTO `ls_addons` (`addonId`, `name`, `pluginName`, `author`, `info`, `version`, `status`, `lastupdate`, `site`, `tsVersion`, `is_weixin`) VALUES
(3, 'RelatedUser', '可能感兴趣的人', 't3', '根据当前用户推荐可能感兴趣的人', '3.0', '1', '', '', '3.0', 0),


-- --------------------------------------------------------

--
-- 表的结构 `ls_application_slide`    这个我也不太清楚是什么，估计是图片幻灯片
--

CREATE TABLE `ls_application_slide` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `image` int(10) NOT NULL COMMENT '图片ID',
  `type` varchar(20) NOT NULL DEFAULT 'false' COMMENT '类型',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_area`      地域信息表。顺序与下方转存数据对应
--

CREATE TABLE `ls_area` (
  `area_id` int(11) NOT NULL COMMENT 'id',
  `title` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_area`    地域转存数据
--

INSERT INTO `ls_area` (`area_id`, `title`, `pid`, `sort`) VALUES
(1, '北京', 0, 1),
(2, '北京市', 1, 1),
(3, '东城区', 2, 1),

-- --------------------------------------------------------

--
-- 表的结构 `ls_atme`  @我表，记录谁@了谁，估计用不到
--

CREATE TABLE `ls_atme` (
  `atme_id` int(11) UNSIGNED NOT NULL COMMENT '主键，@的编号',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '@用户id',
  `at_uid` int(11) UNSIGNED NOT NULL COMMENT '被@的用户的编号',
  `row_id` int(13) UNSIGNED NOT NULL COMMENT '应用含有@的内容的编号',
  `create_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog`   博客表，很重要，发表的内容数据记在这里面
--

CREATE TABLE `ls_blog` (
  `blog_id` int(11) NOT NULL COMMENT '博客ID',
  `uid` int(11) NOT NULL COMMENT '博客的用户UID',
  `type` tinyint(2) DEFAULT NULL COMMENT '博客类型，0：文字；1：图片；2：音频；3：视频；4：位置；5：传记',
  `publish_time` int(11) NOT NULL COMMENT '产生时间戳',
  `timeline` int(11) DEFAULT '0',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除 默认为0',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `last_view_time` int(11) DEFAULT NULL COMMENT '最后一次浏览时间',
  `click_count` int(11) DEFAULT '1' COMMENT '浏览次数',
  `comment_count` int(10) DEFAULT '0' COMMENT '评论数',
  `comment_all_count` int(10) DEFAULT '0' COMMENT '全部分享数目',
  `like_count` int(10) DEFAULT '0' COMMENT '喜欢数',
  `collection_count` int(10) DEFAULT '0' COMMENT '收藏数',
  `private` tinyint(1) DEFAULT '0' COMMENT '是否私有（即对其他人不可见）',
  `is_audit` int(2) DEFAULT '1' COMMENT '是否已审核 0-未审核 1-已审核',
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL,
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  `latitude` varchar(25) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(25) DEFAULT NULL COMMENT '经度',
  `address` varchar(255) DEFAULT NULL COMMENT '发布地址',
  `is_recommend` tinyint(2) DEFAULT '0' COMMENT '是否推荐',
  `recommend_time` int(11) DEFAULT '0' COMMENT '推荐时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_audio`  发表的音频博客内容信息表，建了个副表
--

CREATE TABLE `ls_blog_audio` (
  `audio_id` int(11) UNSIGNED NOT NULL COMMENT '音频id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `text` text COMMENT '简介',
  `name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `size` varchar(20) DEFAULT NULL COMMENT '附件大小',
  `extension` varchar(20) DEFAULT NULL COMMENT '附件扩展名',
  `audio_path` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `image_path` varchar(255) DEFAULT NULL COMMENT '封面路径',
  `image_width` int(8) UNSIGNED DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(8) UNSIGNED DEFAULT NULL COMMENT '图片高度',
  `save_domain` tinyint(3) DEFAULT NULL COMMENT '附件保存的域ID（用于拆分附件存储到不同的服务器）',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `click` int(11) UNSIGNED DEFAULT NULL,
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL,
  `keyword` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_bio`   发表的自传博客内容信息表，建了个副表
--

CREATE TABLE `ls_blog_bio` (
  `bio_id` int(11) UNSIGNED NOT NULL COMMENT '自传id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `keyword` char(255) DEFAULT NULL,
  `content` longtext COMMENT '内容',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `click` int(11) DEFAULT NULL,
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_img`   发表的图片博客内容信息表，建了个副表
--

CREATE TABLE `ls_blog_img` (
  `img_id` int(11) UNSIGNED NOT NULL COMMENT '图片id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `keyword` char(255) DEFAULT NULL,
  `text` text COMMENT '简介',
  `pic` char(255) DEFAULT NULL COMMENT '封面图片',
  `url` char(255) DEFAULT NULL COMMENT '图文外链地址',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `click` int(11) UNSIGNED DEFAULT NULL,
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_text`    发表的文字博客内容信息表，建了个副表
--

CREATE TABLE `ls_blog_text` (
  `article_id` int(11) UNSIGNED NOT NULL COMMENT '文章id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `keyword` char(255) DEFAULT NULL,
  `content` text COMMENT '文章内容',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `click` int(11) UNSIGNED DEFAULT NULL,
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_video`     发表的视频博客内容信息表，建了个副表
--

CREATE TABLE `ls_blog_video` (
  `video_id` int(11) UNSIGNED NOT NULL COMMENT '视频id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `text` text COMMENT '简介',
  `name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `size` varchar(20) DEFAULT NULL COMMENT '附件大小',
  `extension` varchar(20) DEFAULT NULL COMMENT '附件扩展名',
  `video_path` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `image_path` varchar(255) DEFAULT NULL COMMENT '封面路径',
  `image_width` int(8) UNSIGNED DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(8) UNSIGNED DEFAULT NULL COMMENT '图片高度',
  `save_domain` tinyint(3) DEFAULT NULL COMMENT '附件保存的域ID（用于拆分附件存储到不同的服务器）',
  `transfer_id` int(11) DEFAULT NULL COMMENT '转码id',
  `keyword` char(255) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `click` int(11) UNSIGNED DEFAULT NULL,
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_blog_video_transfer`     视频转码信息表
--

CREATE TABLE `ls_blog_video_transfer` (
  `transfer_id` int(11) UNSIGNED NOT NULL COMMENT '转码视频id',
  `video_id` int(11) UNSIGNED NOT NULL COMMENT '原视频id',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '博客id',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `sourceSavePath` varchar(255) DEFAULT NULL COMMENT '源路径',
  `video_source_name` varchar(255) DEFAULT NULL COMMENT '源名称',
  `savePath` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `video_name` varchar(255) DEFAULT NULL COMMENT '保存名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态 0-未转码 1-已转码',
  `create_time` varchar(13) NOT NULL,
  `update_time` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ls_collection`      博客收藏信息统计
--

CREATE TABLE `ls_collection` (
  `collection_id` int(11) NOT NULL COMMENT '收藏ID',
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `blog_id` int(11) NOT NULL COMMENT '资源ID\r\n',
  `create_time` int(11) NOT NULL COMMENT '收藏时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_comment`      博客评论信息表，很重要
--

CREATE TABLE `ls_comment` (
  `comment_id` int(11) UNSIGNED NOT NULL COMMENT '主键，评论编号',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1-评论 2-收藏 3-赞',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '所属应用',
  `table` varchar(100) NOT NULL COMMENT '被评论的内容所存储的表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '评论者编号',
  `content` text NOT NULL COMMENT '评论内容',
  `to_comment_id` int(11) UNSIGNED NOT NULL COMMENT '被回复的评论的编号',
  `to_uid` int(11) NOT NULL COMMENT '被回复的评论的作者的编号',
  `data` text NOT NULL COMMENT '所评论的内容的相关参数（序列化存储）',
  `creat_time` int(11) NOT NULL COMMENT '评论发布的时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  `client_type` tinyint(2) NOT NULL COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `is_audit` tinyint(1) DEFAULT '1' COMMENT '是否已审核 0-未审核 1-已审核',
  `storey` int(11) DEFAULT '0' COMMENT '评论绝对楼层',
  `client_ip` char(15) DEFAULT NULL COMMENT '客户端ip'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_comment_digg`    digg叫掘客，这个不知道啥用途
--

CREATE TABLE `ls_comment_digg` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_denounce`     举报信息表
--

CREATE TABLE `ls_denounce` (
  `id` int(10) NOT NULL,
  `from` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源来源位置',
  `aid` int(10) NOT NULL COMMENT '资源ID',
  `state` tinyint(3) NOT NULL COMMENT '状态',
  `uid` int(10) NOT NULL COMMENT '举报人',
  `fuid` int(10) NOT NULL COMMENT '被举报人',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '举报原因',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '举报内容',
  `create_time` int(10) NOT NULL COMMENT '举报时间',
  `source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源来源页面'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_expression`   表情信息表 
--

CREATE TABLE `ls_expression` (
  `expression_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `type` varchar(255) NOT NULL DEFAULT 'miniblog',
  `emotion` varchar(255) NOT NULL COMMENT '文本编码，格式：[文本]，如[拥抱]、[示爱]、[呲牙]等',
  `filename` varchar(255) NOT NULL COMMENT '表情图片文件名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_expression`    表情信息表内容转存
--

INSERT INTO `ls_expression` (`expression_id`, `title`, `type`, `emotion`, `filename`) VALUES
(1, '拥抱', 'miniblog', '[拥抱]', 'hug.gif'),
(2, '示爱', 'miniblog', '[示爱]', 'kiss.gif'),


-- --------------------------------------------------------

--
-- 表的结构 `ls_feedback`    反馈信息表
--

CREATE TABLE `ls_feedback` (
  `id` int(11) NOT NULL,
  `content` text COMMENT '反馈内容',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `mTime` int(11) DEFAULT NULL COMMENT '修改时间',
  `type` int(10) DEFAULT NULL COMMENT '反馈类型'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_feedback_type`    反馈类型，估计用不到
--

CREATE TABLE `ls_feedback_type` (
  `type_id` int(11) NOT NULL COMMENT '反馈类型ID',
  `type_name` varchar(255) NOT NULL COMMENT '反馈类型名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_find_password`    找回密码表 ，不大行
--

CREATE TABLE `ls_find_password` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `email` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '用户email',
  `code` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '改密字符串',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_follow`    关注统计表
--

CREATE TABLE `ls_follow` (
  `follow_id` int(11) NOT NULL COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '关注者ID',
  `fid` int(11) NOT NULL COMMENT '被关注者ID',
  `remark` varchar(50) NOT NULL COMMENT '备注',
  `ctime` int(11) NOT NULL COMMENT '关注时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_follow_group`    关注组，不做群组，估计用不到
--

CREATE TABLE `ls_follow_group` (
  `group_id` int(13) UNSIGNED NOT NULL COMMENT '关注组id',
  `group_name` varchar(20) DEFAULT NULL COMMENT '组名称',
  `uid` int(11) UNSIGNED DEFAULT NULL COMMENT '用户id',
  `group_member_num` int(8) UNSIGNED DEFAULT '0' COMMENT '成员人数',
  `group_member_id` varchar(11) DEFAULT NULL COMMENT '组成员id',
  `create_time` varchar(13) DEFAULT NULL COMMENT '建立时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_keyword`     关键词表，不知道啥用途
--

CREATE TABLE `ls_keyword` (
  `id` int(11) NOT NULL,
  `keyword` char(255) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `module` varchar(15) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_lang`     语言表
--

CREATE TABLE `ls_lang` (
  `lang_id` int(10) NOT NULL,
  `key` varchar(255) NOT NULL COMMENT 'key',
  `appname` varchar(50) NOT NULL COMMENT '所属应用名称',
  `filetype` tinyint(2) DEFAULT '0' COMMENT '针对的文件类型，0:php,1:js',
  `zh-cn` text NOT NULL COMMENT '中文',
  `en` text NOT NULL COMMENT '英文',
  `zh-tw` text NOT NULL COMMENT '繁体'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_lang`      语言表内容转存
--

INSERT INTO `ls_lang` (`lang_id`, `key`, `appname`, `filetype`, `zh-cn`, `en`, `zh-tw`) VALUES
(1, 'NOTIFY_REGISTER_ACTIVE_CONTENT', 'PUBLIC', 0, 'Hi，{name}，欢迎加入 <a href="{site_url}"  style="text-decoration:none;color:#3366cc">{site}</a>，请立即点击下列按钮激活您的帐号。<br /><br />\r\n<a href="{activeurl}" target="_blank" style="text-decoration:none;" class="email_btn">激活帐号</a> ', 'Hi, {name}, Welcome to {site}, please click the button to activate your account.<br />\r\n<a href="{activeurl}" target="_blank">Click here to activate your account</a>', 'Hi，{name}，歡迎加入{site}，請立即點擊下列按鈕激活您的帳號。<br />\r\n<a href="{activeurl}" target="_blank">點此激活帳號</a> '),
(2, 'NOTIFY_REGISTER_ACTIVE_TITLE', 'PUBLIC', 0, '[ {site} ]恭喜您成功注册，请激活您的帐号', '[{site}] Congratulations,you have successfully registered, please activate your account', '[ {site} ]恭喜您成功註冊，請激活您的帳號'),

-- --------------------------------------------------------

--
-- 表的结构 `ls_login`  登录信息表
--

CREATE TABLE `ls_login` (
  `login_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `type_uid` varchar(255) NOT NULL DEFAULT '' COMMENT '授权登陆用户名',
  `type` char(80) NOT NULL COMMENT '登陆类型',
  `oauth_token` varchar(150) DEFAULT NULL COMMENT '授权账号',
  `oauth_token_secret` varchar(150) DEFAULT NULL COMMENT '授权密码',
  `is_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否同步动态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_login`     登录信息表转存
-- 

INSERT INTO `ls_login` (`login_id`, `uid`, `type_uid`, `type`, `oauth_token`, `oauth_token_secret`, `is_sync`) VALUES
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0),
(1, 1, '', 'location', '1646da84fc3182b87bd5c8c4012129d5', '60e6f5d54ba07ab827320db2de8454a4', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ls_login_logs`      登录信息记录
--

CREATE TABLE `ls_login_logs` (
  `login_logs_id` int(11) NOT NULL COMMENT '登录知识ID - 主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(15) DEFAULT NULL COMMENT '登录IP',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_login_record`           登录记录表
--

CREATE TABLE `ls_login_record` (
  `login_record_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  `place` varchar(255) DEFAULT NULL COMMENT '地点',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  `lock_time` int(11) NOT NULL COMMENT '账号锁定截至日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_login_record`      登录记录转存
--

INSERT INTO `ls_login_record` (`login_record_id`, `uid`, `ip`, `place`, `create_time`, `lock_time`) VALUES
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0),
(1, 1, '0.0.0.0', NULL, 1493205697, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ls_message`     消息相关信息表
--

CREATE TABLE `ls_message` (
  `list_id` int(11) UNSIGNED NOT NULL COMMENT '私信ID',
  `from_uid` int(11) UNSIGNED NOT NULL COMMENT '发信用户id',
  `receive_uid` int(11) UNSIGNED NOT NULL COMMENT '收信用户UID',
  `new_message` smallint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `message_num` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息总数',
  `ctime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '该参与者最后会话时间',
  `list_ctime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '私信最后会话时间',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（假的删除）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_message_content`     消息内容
--

CREATE TABLE `ls_message_content` (
  `message_id` int(11) UNSIGNED NOT NULL COMMENT '私信内消息ID',
  `from_uid` int(11) UNSIGNED NOT NULL COMMENT '会话发布者UID',
  `receive_uid` int(11) UNSIGNED NOT NULL COMMENT '会话接收者UID',
  `content` text CHARACTER SET utf8mb4 COMMENT '会话内容',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除，0：否；1：是',
  `mtime` int(11) UNSIGNED NOT NULL COMMENT '消息发布时间',
  `attach_ids` text COMMENT '聊天的附件内容',
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户端id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_message_push`       消息推送统计表
--

CREATE TABLE `ls_message_push` (
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `message_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息ID',
  `list_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '对话ID',
  `ctime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_mobile_message`        移动消息，用不到，得删
--

CREATE TABLE `ls_mobile_message` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `message` text,
  `device_type` varchar(255) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_mobile_user`         移动用户信息表，用不到
--

CREATE TABLE `ls_mobile_user` (
  `uid` int(11) UNSIGNED NOT NULL COMMENT '户用ID',
  `iphone_device_token` varchar(255) DEFAULT NULL COMMENT 'iPhone的机器码（用于推送消息）',
  `ipad_device_token` varchar(255) DEFAULT NULL COMMENT 'iPad的机器码（用于推送消息）',
  `android_device_token` varchar(255) DEFAULT NULL COMMENT 'Android的机器码（用于推送消息）',
  `iphone_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'iPhone否是开启推送',
  `ipad_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'iPad是开启推送',
  `android_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Android否是开启推送',
  `last_latitude` float(10,6) DEFAULT NULL COMMENT '经度',
  `last_longitude` float(10,6) DEFAULT NULL COMMENT '纬度',
  `last_checkin` int(11) UNSIGNED DEFAULT NULL COMMENT '后最签到时间（访问即签到）',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称，预留匿名功能',
  `infomation` varchar(255) DEFAULT NULL COMMENT '用户简介，预留',
  `checkin_count` int(11) UNSIGNED DEFAULT '0' COMMENT '签到次数',
  `sex` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '性别：1男、2女'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_navi`          导航表，这是被抄方的东西，没用
--

CREATE TABLE `ls_navi` (
  `navi_id` int(11) NOT NULL COMMENT '导航ID',
  `navi_name` varchar(255) DEFAULT NULL COMMENT '导航名称',
  `app_name` varchar(255) DEFAULT NULL COMMENT '应用标志，如index、home、public等',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `status` int(1) DEFAULT NULL COMMENT '状态（0关闭，1开启）',
  `position` varchar(10) DEFAULT NULL COMMENT '导航位置',
  `guest` int(1) DEFAULT NULL COMMENT '是否游客可见（0否，1是，默认1）',
  `is_app_navi` int(1) DEFAULT NULL COMMENT '是否应用内部导航 （0否，1是，默认1）',
  `parent_id` int(11) DEFAULT NULL COMMENT '（父导航，默认为0）',
  `order_sort` int(11) DEFAULT NULL COMMENT '应用排序 默认255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_navi`    同样没用，奇怪我怎么没删掉泥
--

INSERT INTO `ls_navi` (`navi_id`, `navi_name`, `app_name`, `url`, `target`, `status`, `position`, `guest`, `is_app_navi`, `parent_id`, `order_sort`) VALUES
(1, '首页', 'square', '{website}', '_self', 0, '0', 1, 0, 0, 1),
(2, '频道', 'channel', '{website}/index.php?app=channel', '_self', 1, '0', 1, 0, 0, 4),

-- --------------------------------------------------------

--
-- 表的结构 `ls_notify_email`        邮件提醒表，暂时用不到
--

CREATE TABLE `ls_notify_email` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `uid` int(10) NOT NULL COMMENT 'UiD',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `email` varchar(250) NOT NULL COMMENT '邮件接受地址',
  `is_send` tinyint(2) NOT NULL COMMENT '是否已经发送',
  `title` varchar(250) NOT NULL COMMENT '邮件标题',
  `body` text NOT NULL COMMENT '邮件内容',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `sendtime` int(11) NOT NULL COMMENT '发送时间',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '发送人uid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_notify_message`        消息提醒表，可能会用到
--

CREATE TABLE `ls_notify_message` (
  `id` int(10) NOT NULL COMMENT '信息id',
  `uid` int(11) NOT NULL COMMENT 'UID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '发送人uid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_notify_node`        节点提醒，我也不知道啥用途
--

CREATE TABLE `ls_notify_node` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `nodeinfo` varchar(50) NOT NULL COMMENT '节点描述',
  `appname` varchar(50) NOT NULL COMMENT '应用名称',
  `content_key` varchar(50) NOT NULL COMMENT '内容key',
  `title_key` varchar(50) NOT NULL COMMENT '标题key',
  `send_email` tinyint(2) NOT NULL COMMENT '是否发送邮件',
  `send_message` tinyint(2) NOT NULL COMMENT '是否发送消息',
  `send_push` tinyint(2) DEFAULT NULL COMMENT '是否发送手机推送',
  `type` tinyint(2) NOT NULL COMMENT '信息类型：1 表示用户发送的 2表示是系统发送的'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_online_logs`      在线用户统计表
--

CREATE TABLE `ls_online_logs` (
  `id` int(10) NOT NULL,
  `day` date NOT NULL COMMENT '日期',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `uname` varchar(50) NOT NULL COMMENT '用户名称',
  `action` varchar(255) NOT NULL COMMENT '访问地址',
  `refer` text NOT NULL COMMENT '来源页面',
  `isGuest` tinyint(3) NOT NULL COMMENT '是否游客',
  `isIntranet` tinyint(3) NOT NULL COMMENT '是否内部用户',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `agent` varchar(50) NOT NULL COMMENT '浏览器',
  `ext` varchar(20) NOT NULL COMMENT '扩展字段',
  `statsed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经统计过'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_online_logs`     在线转存信息，下面估计是我访问的信息，奇怪，我用了这么多次？怎么做到的
--

INSERT INTO `ls_online_logs` (`id`, `day`, `uid`, `uname`, `action`, `refer`, `isGuest`, `isIntranet`, `ip`, `agent`, `ext`, `statsed`) VALUES
(1, '2017-04-26', 0, 'guest', 'public/Passport/login', 'http://localhost/thinksns/index.php', 1, 0, '::1', 'other', '', 1),
(2, '2017-04-26', 0, 'guest', 'public/Register/index', 'http://localhost/thinksns/index.php?app=public&mod=Register&act=index', 1, 0, '::1', 'other', '', 1),

-- --------------------------------------------------------

--
-- 表的结构 `ls_online_status`     在线状态信息统计表
--

CREATE TABLE `ls_online_status` (
  `id` int(11) NOT NULL,
  `day` date NOT NULL COMMENT '日期',
  `total_users` int(11) NOT NULL DEFAULT '0' COMMENT '总用户数',
  `total_guests` int(11) NOT NULL DEFAULT '0' COMMENT '总游客数',
  `total_pageviews` int(11) NOT NULL DEFAULT '0' COMMENT '页面访问次数',
  `most_online_users` int(11) NOT NULL DEFAULT '0' COMMENT '最多在线用户数',
  `most_online_guests` int(11) NOT NULL DEFAULT '0' COMMENT '最多游客在线数',
  `most_online_time` int(11) DEFAULT NULL COMMENT '最大在线时间',
  `most_online` int(11) NOT NULL DEFAULT '0' COMMENT '最大在线人数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_online_status`    在线统计表转存信息，也是我的活动记录
--

INSERT INTO `ls_online_status` (`id`, `day`, `total_users`, `total_guests`, `total_pageviews`, `most_online_users`, `most_online_guests`, `most_online_time`, `most_online`) VALUES
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2),
(1, '2017-04-26', 1, 3, 15, 1, 1, 1493138226, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ls_pic_show`     图片展示表，用不到，没删
--

CREATE TABLE `ls_pic_show` (
  `id` int(11) UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '照片URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '照片标题',
  `desc` varchar(255) DEFAULT NULL COMMENT '照片摘要',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `attachId` int(10) DEFAULT NULL COMMENT '照片ID',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_schedule`     执行计划统计，不知道咋用
--

CREATE TABLE `ls_schedule` (
  `id` int(11) NOT NULL,
  `task_to_run` varchar(255) NOT NULL COMMENT '计划任务执行方法',
  `schedule_type` varchar(255) NOT NULL COMMENT '执行频率',
  `modifier` varchar(255) DEFAULT NULL COMMENT '执行频率,类型为MONTHLY时必须；ONCE时无效；其他时为可选，默认为1',
  `dirlist` varchar(255) DEFAULT NULL COMMENT '指定周或月的一天或多天。只与WEEKLY和MONTHLY共同使用时有效，其他时忽略。',
  `month` varchar(255) DEFAULT NULL COMMENT '指定一年中的一个月或多个月.只在schedule_type=MONTHLY时有效，其他时忽略。当modifier=LASTDAY时必须，其他时可选。有效值：Jan - Dec，默认为*(每个月)',
  `start_datetime` datetime NOT NULL COMMENT '开始时间',
  `end_datetime` datetime DEFAULT NULL COMMENT '结束时间',
  `last_run_time` datetime DEFAULT NULL COMMENT '最近执行时间',
  `info` varchar(255) DEFAULT NULL COMMENT '对计划任务的简要描述',
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_schedule`        转存计划统计数据
--

INSERT INTO `ls_schedule` (`id`, `task_to_run`, `schedule_type`, `modifier`, `dirlist`, `month`, `start_datetime`, `end_datetime`, `last_run_time`, `info`, `status`) VALUES
(3, 'addons/Online/checkOnline', 'MINUTE', '1', '', '', '2013-03-01 18:18:00', '0000-00-00 00:00:00', '2017-04-26 23:12:00', '自动更新统计数', 0),
(4, 'addons/Message/doSendFeedMail', 'MINUTE', '1', '', '', '2013-07-01 11:21:00', '2015-07-01 11:21:01', '2015-07-01 11:21:00', '每分钟都检查并发送一批邮件，给最近没登录的用户', 0),


-- --------------------------------------------------------

--
-- 表的结构 `ls_search`      搜索统计表，不知道怎么用
--

CREATE TABLE `ls_search` (
  `doc_id` int(11) UNSIGNED NOT NULL,
  `app` varchar(30) DEFAULT NULL COMMENT '应用名',
  `type` varchar(50) DEFAULT NULL COMMENT '搜索类型',
  `string01` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string02` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string03` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string04` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `string05` varchar(255) DEFAULT NULL COMMENT '文本扩展字段',
  `int01` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int02` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int03` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int04` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int05` int(11) DEFAULT NULL COMMENT '数字扩展字段',
  `int06` int(11) NOT NULL COMMENT '数字扩展字段',
  `int07` int(11) NOT NULL COMMENT '数字扩展字段',
  `int08` int(11) NOT NULL COMMENT '数字扩展字段',
  `int09` int(11) NOT NULL COMMENT '数字扩展字段',
  `int10` int(11) NOT NULL COMMENT '数字扩展字段',
  `file_path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `content` text COMMENT '搜索内容',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` text NOT NULL COMMENT '序列化存储的数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_search_key`    搜索关键词信息统计
--

CREATE TABLE `ls_search_key` (
  `kid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL COMMENT '搜索的关键词',
  `searchCount` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `resultCount` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '结果数',
  `suggest` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示在推荐列表中',
  `data` text COMMENT '扩展字段',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_search_select`  这个用不到
--

CREATE TABLE `ls_search_select` (
  `id` int(4) NOT NULL,
  `app_name` varchar(20) NOT NULL COMMENT '应用名称',
  `app_id` tinyint(3) NOT NULL COMMENT '应用ID',
  `type` varchar(20) NOT NULL COMMENT '类型名称',
  `type_id` tinyint(3) NOT NULL COMMENT '类型在应用内定义的ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_search_select`     搜索数据转存，没用
--

INSERT INTO `ls_search_select` (`id`, `app_name`, `app_id`, `type`, `type_id`) VALUES
(1, 'public', 0, '用户', 1),
(2, 'public', 0, '分享', 2),
(3, 'ask', 27, '问答', 1),


-- --------------------------------------------------------

--
-- 表的结构 `ls_sensitive_category`     敏感词类型
--

CREATE TABLE `ls_sensitive_category` (
  `sensitive_category_id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ext` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_sensitive_category`   敏感词类型转存
--

INSERT INTO `ls_sensitive_category` (`sensitive_category_id`, `title`, `pid`, `sort`, `ext`) VALUES
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL),
(1, '默认', 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ls_sensitive_word`    敏感词
--

CREATE TABLE `ls_sensitive_word` (
  `sensitive_word_id` int(11) NOT NULL,
  `word` varchar(45) NOT NULL,
  `replace` varchar(45) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `sensitive_category_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_sitelist_site`         站点信息表
--

CREATE TABLE `ls_sitelist_site` (
  `site_id` int(11) UNSIGNED NOT NULL COMMENT '站点ID',
  `name` varchar(255) NOT NULL COMMENT '站点名称',
  `url` varchar(255) NOT NULL COMMENT '站点URL',
  `logo` varchar(255) NOT NULL COMMENT '站点Logo',
  `description` varchar(255) NOT NULL COMMENT '站点简介',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '提交人uid',
  `email` varchar(255) DEFAULT NULL COMMENT '站长Email',
  `phone` varchar(255) DEFAULT NULL COMMENT '站长联系电话',
  `ctime` int(11) UNSIGNED NOT NULL COMMENT '申请时间',
  `status` enum('0','-1','1') NOT NULL DEFAULT '0' COMMENT '状态（0:待审核 -1:拒绝 1:审核通过）',
  `status_mtime` int(11) UNSIGNED DEFAULT NULL COMMENT '状态的最后更新时间',
  `denied_reason` varchar(255) DEFAULT NULL COMMENT '拒绝理由'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_sms`        验证码信息表
--

CREATE TABLE `ls_sms` (
  `phone` varchar(50) NOT NULL COMMENT '手机号码|兼容email验证码',
  `code` int(5) NOT NULL DEFAULT '0' COMMENT '验证码',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '消息',
  `time` varchar(20) NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_survey`      调查统计表
--

CREATE TABLE `ls_survey` (
  `survey_id` smallint(8) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL,
  `end_time` int(11) NOT NULL DEFAULT '0',
  `join_num` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_survey_answer`    调查结果统计，用不到
--

CREATE TABLE `ls_survey_answer` (
  `survey_id` smallint(8) UNSIGNED NOT NULL,
  `question_id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_survey_question`    调查问题统计，用不到
--

CREATE TABLE `ls_survey_question` (
  `question_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `widget` varchar(50) NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_survey_question_link`   调查问题联结，用不到
--

CREATE TABLE `ls_survey_question_link` (
  `survey_id` smallint(8) UNSIGNED NOT NULL,
  `question_id` int(11) UNSIGNED NOT NULL,
  `display_order` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_tag`   标签统计表
--

CREATE TABLE `ls_tag` (
  `tag_id` int(11) NOT NULL COMMENT '主键，标签编号',
  `name` varchar(255) NOT NULL COMMENT '标签名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_template`      模板统计表，用不到
--

CREATE TABLE `ls_template` (
  `tpl_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '模板名，使用英文，保证唯一性。格式建议：“类型_动作”，如“blog_add”或“credit_blog_add”',
  `alias` varchar(255) DEFAULT NULL COMMENT '模板别名，如“发表知识”',
  `title` text COMMENT '标题模板，使用“{”和“}”包含变量名，如“{actor}做了{action}”',
  `body` text COMMENT '内容模板，使用“{”和“}”包含变量名，如“{actor}做了{action}增加了{volume}个{credit_type}”',
  `lang` varchar(255) NOT NULL DEFAULT 'zh' COMMENT '语言，与全局语言包一致，如“en”、“zh”等，目前只支持“zh”',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型，如blog,credit等',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2，备用类型，可留空。如“credit_blog”等',
  `is_cache` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用默认的模板缓存系统进行缓存，0：否；1：是',
  `ctime` int(11) DEFAULT NULL COMMENT '模板建立时间戳'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_template_record`       模板使用记录，用不到
--

CREATE TABLE `ls_template_record` (
  `tpl_record_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '模板使用者UID',
  `tpl_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名',
  `tpl_alias` varchar(255) DEFAULT NULL COMMENT '模板别名',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2',
  `data` text COMMENT '记录模板变量数据',
  `ctime` int(11) DEFAULT NULL COMMENT '模板调用时间戳'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_tips`     这个不知道啥用途
--

CREATE TABLE `ls_tips` (
  `id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL COMMENT '资源ID',
  `source_table` varchar(20) NOT NULL COMMENT '资源所在表',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `type` tinyint(2) NOT NULL COMMENT '类型（0表示支持。1表示反对）',
  `ctime` int(11) NOT NULL COMMENT '添加时间',
  `ip` varchar(20) NOT NULL COMMENT '操作者IP'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user`       关键的，用户信息表
--

CREATE TABLE `ls_user` (
  `uid` int(11) UNSIGNED NOT NULL COMMENT '主键UID',
  `uname` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码的md5摘要',
  `email` varchar(255) DEFAULT NULL COMMENT '用户email',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别 1：男、2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `star_sign` varchar(20) DEFAULT NULL COMMENT '星座',
  `location` varchar(255) DEFAULT NULL COMMENT '所在省市的字符串',
  `introduce` varchar(255) DEFAULT NULL COMMENT '用户简介',
  `is_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核：0-未通过，1-已通过',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已激活 1：激活、0：未激活',
  `is_init` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否初始化用户资料 1：初始化、0：未初始化',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '注册时间',
  `identity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '身份标识（1：用户，2：组织）',
  `domain` char(80) NOT NULL DEFAULT '' COMMENT '保留字段，用于用户分表',
  `province` mediumint(6) NOT NULL DEFAULT '0' COMMENT '省ID、关联area表',
  `city` int(5) NOT NULL DEFAULT '0' COMMENT '城市ID，关联area表',
  `area` int(5) NOT NULL DEFAULT '0' COMMENT '地区ID，关联area表',
  `reg_ip` varchar(64) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `lang` varchar(64) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `timezone` varchar(10) NOT NULL DEFAULT 'PRC' COMMENT '时区',
  `is_del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁用，0不禁用，1：禁用',
  `login_salt` char(5) DEFAULT NULL COMMENT '10000 到 99999之间的随机数，加密密码时使用',
  `last_login_time` int(11) UNSIGNED DEFAULT '0' COMMENT '用户最后一次登录时间',
  `last_post_ip` int(13) UNSIGNED DEFAULT '0' COMMENT '用户最后发表分享的ip地址',
  `last_post_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户最后发表分享的时间',
  `blog_num` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '微博数',
  `fans_num` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `follow_num` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关注数',
  `search_key` varchar(255) DEFAULT NULL COMMENT '搜索字段',
  `avatar_40` char(80) DEFAULT NULL COMMENT '头像40*40',
  `avatar_80` char(80) DEFAULT NULL COMMENT '头像80*80',
  `avatar_180` char(80) DEFAULT NULL COMMENT '头像180*180',
  `theme` varchar(20) DEFAULT 'default' COMMENT '主题模板'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_user`      用户信息转存
--

INSERT INTO `ls_user` (`uid`, `uname`, `password`, `email`, `phone`, `gender`, `birthday`, `star_sign`, `location`, `introduce`, `is_audit`, `is_active`, `is_init`, `create_time`, `identity`, `domain`, `province`, `city`, `area`, `reg_ip`, `lang`, `timezone`, `is_del`, `login_salt`, `last_login_time`, `last_post_ip`, `last_post_time`, `blog_num`, `fans_num`, `follow_num`, `search_key`, `avatar_40`, `avatar_80`, `avatar_180`, `theme`) VALUES
(1, '管理员', 'd0d7b61b34c5f3705c2553d251a8f3f4', 'antipe@outlook.com', NULL, 1, NULL, NULL, '北京 北京市 海淀区', '', 1, 1, 1, 1493137763, 1, '', 1, 2, 10, '127.0.0.1', 'zh-cn', 'PRC', 0, '11111', 1493205697, 0, 0, 0, 0, 0, '管理员 guanliyuan', NULL, NULL, NULL, 'default');

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_blacklist`     用户黑名单统计
--

CREATE TABLE `ls_user_blacklist` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `fid` int(11) NOT NULL COMMENT '被屏蔽的用户UID',
  `ctime` int(11) NOT NULL COMMENT '操作时间戳'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_disable`      未激活用户统计
--

CREATE TABLE `ls_user_disable` (
  `user_disable_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` char(10) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_official`          官方用户统计，有用吗？后续删掉
--

CREATE TABLE `ls_user_official` (
  `official_id` int(11) NOT NULL COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `user_official_category_id` int(11) NOT NULL COMMENT '官方分类ID',
  `info` varchar(255) DEFAULT NULL COMMENT '官方用户信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_official_category`    这个没用
--

CREATE TABLE `ls_user_official_category` (
  `user_official_category_id` int(11) NOT NULL COMMENT '官方用户分类',
  `title` varchar(255) NOT NULL COMMENT '官方用户分类名称',
  `pid` int(11) NOT NULL COMMENT '父级分类ID',
  `sort` int(11) NOT NULL COMMENT '排序值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_user_official_category`    这个没用
--

INSERT INTO `ls_user_official_category` (`user_official_category_id`, `title`, `pid`, `sort`) VALUES
(1, '站长', 0, 0),
(2, '测试修改', 0, 0),
(3, 'TS站长', 0, 0),
(4, '二次开发者', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_online`        在线用户信息
--

CREATE TABLE `ls_user_online` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `ctime` int(11) NOT NULL COMMENT '最后一次操作动作时间戳，与当前时间相隔五分钟之内为在线'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_profile`        用户简介信息，估计用不到
--

CREATE TABLE `ls_user_profile` (
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户UID',
  `field_id` smallint(8) UNSIGNED NOT NULL COMMENT '数据资料ID',
  `field_data` text NOT NULL COMMENT '资料数据字段名',
  `privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：所有人，1：好友， 2：互相关注，3：关注我的，4：我关注的'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_profile_setting`         用户简介设置，估计用不到
--

CREATE TABLE `ls_user_profile_setting` (
  `field_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '数据类型：1、分组，2、字段',
  `field_key` varchar(120) NOT NULL COMMENT '字段键值',
  `field_name` varchar(120) NOT NULL COMMENT '字段名称',
  `field_type` int(5) NOT NULL DEFAULT '0' COMMENT '字段类型ID，值为上一级字段ID，值为0时代表根分类',
  `visiable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否空间展示：默认1=可展示',
  `editable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可修改：默认1=可修改',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项：默认0=非必填',
  `privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：所有人，1：好友， 2：互相关注，3：关注我的，4：我关注的',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '字段排序符号值',
  `form_type` varchar(120) DEFAULT NULL COMMENT '字段表单类型：input、textarea、select、radio、checkbox、timeinput',
  `form_default_value` text COMMENT '默认选择的数据项',
  `validation` varchar(120) DEFAULT NULL COMMENT '前台表单验证的方法名',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示说明',
  `is_system` int(2) NOT NULL DEFAULT '0' COMMENT '是否系统配置0不是，1是，系统的配置项不能删除，不能改key'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_user_profile_setting`       用户简历，不要这些
--

INSERT INTO `ls_user_profile_setting` (`field_id`, `type`, `field_key`, `field_name`, `field_type`, `visiable`, `editable`, `required`, `privacy`, `display_order`, `form_type`, `form_default_value`, `validation`, `tips`, `is_system`) VALUES
(23, 2, 'edu_year', '入学年份', 21, 1, 1, 1, 0, 0, 'date', '" placeholder="请选择入学年份', '', '', 0),
(22, 2, 'edu_degrees', '学历', 21, 1, 1, 0, 0, 0, 'select', '博士|硕士|大学|高中|初中|小学', '', '', 0),
(24, 2, 'edu_school', '学校名称', 21, 1, 1, 1, 0, 0, 'input', '" placeholder="请输入学校名称', '', '', 0),
(21, 1, 'edu', '教育信息', 0, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ls_user_style`            用户皮肤统计，暂时用不到
--

CREATE TABLE `ls_user_style` (
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户UID',
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '皮肤的样式表名称',
  `background` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '肤的皮背景图片地址',
  `change_time` varchar(13) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_w3g_slide_show`        这个没用，后续删掉
--

CREATE TABLE `ls_w3g_slide_show` (
  `id` int(10) NOT NULL COMMENT 'id',
  `image` int(10) NOT NULL COMMENT '图片ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_webpage`     网页内容信息统计
--

CREATE TABLE `ls_webpage` (
  `webpage_id` int(11) NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hash` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables     下面的是数据库更改记录     
--
                                                  
--
-- Indexes for table `ls_atme`     

--


ALTER TABLE `ls_atme`
  ADD KEY `atme_id` (`atme_id`);

--
-- Indexes for table `ls_blog`
--
ALTER TABLE `ls_blog`
  ADD PRIMARY KEY (`blog_id`);


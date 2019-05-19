/*
Navicat MySQL Data Transfer

Source Server         : 115.28.94.189
Source Server Version : 50634
Source Host           : 115.28.94.189:3306
Source Database       : yatai

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-05-08 10:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_ad
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');

-- ----------------------------
-- Table structure for cmf_comments
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cmf_guestbook
-- ----------------------------
INSERT INTO `cmf_guestbook` VALUES ('1', 'lalala', 'hh@qq.com', null, 's', '2017-03-23 21:05:46', '1');

-- ----------------------------
-- Table structure for cmf_links
-- ----------------------------
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_links
-- ----------------------------
INSERT INTO `cmf_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for cmf_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_menu
-- ----------------------------
INSERT INTO `cmf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `cmf_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `cmf_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `cmf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '0', '备份管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `cmf_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `cmf_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `cmf_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `cmf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `cmf_nav` VALUES ('4', '1', '0', '关于我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-4');
INSERT INTO `cmf_nav` VALUES ('5', '1', '0', '新闻中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-5');
INSERT INTO `cmf_nav` VALUES ('6', '1', '0', '产品展示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-6');
INSERT INTO `cmf_nav` VALUES ('7', '1', '0', '成功案例', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '0', '0', '0-7');
INSERT INTO `cmf_nav` VALUES ('8', '1', '0', '解决方案', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-8');
INSERT INTO `cmf_nav` VALUES ('9', '1', '0', '联系我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-9');

-- ----------------------------
-- Table structure for cmf_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of cmf_nav_cat
-- ----------------------------
INSERT INTO `cmf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for cmf_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_options
-- ----------------------------
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_options
-- ----------------------------
INSERT INTO `cmf_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `cmf_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u96c5\\u6cf0\\u6b4c\\u601d\",\"site_admin_url_password\":\"\",\"site_tpl\":\"yatai\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"hu01232002@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u96c5\\u6cf0\\u6b4c\\u601d\",\"site_seo_keywords\":\"SAW\\u58f0\\u8868\\u9762\\u6ce2\",\"site_seo_description\":\"\\u96c5\\u6cf0\\u6b4c\\u601d\\uff08\\u4e0a\\u6d77\\uff09\\u901a\\u8baf\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f4d\\u4e8e\\u6d66\\u4e1c\\u65b0\\u533a\\u5f20\\u6c5f\\u9ad8\\u79d1\\u6280\\u56ed\\u533a\\u3002\\u805a\\u7126\\u4e8e\\u7269\\u8054\\u7f51\\u4f20\\u611f\\u6280\\u672f\\u548c\\u8fd0\\u8425\\u7ea7\\u65e0\\u7ebf\\u6570\\u636e\\u4f20\\u8f93\\u6280\\u672f\\uff0c\\u662f\\u4e3a\\u56fd\\u5185\\u8fd0\\u8425\\u5546\\uff08\\u79fb\\u52a8\\u3001\\u8054\\u901a\\u3001\\u7535\\u4fe1\\uff09\\u53ca\\u653f\\u4f01\\u884c\\u4e1a\\u63d0\\u4f9b\\u65e0\\u7ebf\\u7f51\\u7edc\\u8bbe\\u5907\\u548c\\u5e94\\u7528\\u89e3\\u51b3\\u65b9\\u6848\\u7684\\u9ad8\\u79d1\\u6280\\u4f01\\u4e1a\\u3002\",\"urlmode\":\"2\",\"html_suffix\":\"\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `cmf_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');
INSERT INTO `cmf_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for cmf_plugins
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_posts
-- ----------------------------
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of cmf_posts
-- ----------------------------
INSERT INTO `cmf_posts` VALUES ('1', '1', '', null, '2017-03-20 15:22:57', '', '关于我们', '', '1', '1', '2017-03-20 15:22:49', null, '0', '2', '', '0', '{\"template\":\"about_us\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('2', '1', '', null, '2017-03-20 15:23:27', '', '新闻中心', '', '1', '1', '2017-03-20 15:23:00', null, '0', '2', '', '0', '{\"template\":\"blog\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('3', '1', '', null, '2017-03-20 15:23:39', '', '产品展示', '', '1', '1', '2017-03-20 15:23:28', null, '0', '2', '', '0', '{\"template\":\"products\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('4', '1', '', null, '2017-03-20 15:24:54', '', '成功案例', '', '1', '1', '2017-03-20 15:23:41', null, '0', '2', '', '0', '{\"template\":\"careers\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('5', '1', '', null, '2017-03-20 15:25:11', '<h3>有线传输的局限性</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>当前的数据传输主要承载媒介是光纤，但受制于光纤的无法布放而影响数据传输的建设.</p></li><li><p>城市的建设、规划、拆迁等临时通讯保障.</p></li><li><p>湖泊、森林、山区、湿地、沙漠、草原等苛刻环境数据传输.</p></li><li><p>人烟稀少，维护人员难以迅速响应的区域，需要无线传输方式作为补充.</p></li><li><p>无线传输技术的发展，在国外，无线第一次超越有线的投资，代表了无线的未来发展趋势.</p></li><li><p>以前的无线传输产品分为两类：微波产品 、 网桥产品.</p></li><li><p>其致命缺陷使得对数据传输要求苛刻的场景无法规模应用.</p></li><li><p>现实的信息数据传输发展是随着对数据业务的爆炸式需求，光纤的到达率、覆盖率远不能满足需求.</p></li><li><p>迫切需要高带宽、高可靠、高性能的创新型无线传输设备来满足市场需求.</p></li></ul></blockquote><h3>广泛的应用场景</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>平安城市、智慧城市的主干互补场景.</p></li><li><p>石油、煤矿、水利等对数据实时性场景.</p></li><li><p>电力行业，变电站数据传输场景.</p></li><li><p>湖泊、森林、山区、湿地、沙漠、草原数据传输.</p></li><li><p>政府安全维稳、舆情监控、数据安全传输场景.</p></li><li><p>迫切需要高带宽、高可靠、高性能的创新型无线传输设备来满足市场需求.</p></li></ul></blockquote><p></p><p><br/></p><h2 class=\"heading underline\">我们的优势</h2><p class=\"text-center\"><br/></p><h3>完善的公司架构，完整的运营体系</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>公司拥有高新技术制造业整体链条，涵盖研发、生产、销售体系.</p></li><li><p>领域内长期沉淀的精英团队，对行业发展的精确把握，将领先技术有效转换为市场价值.</p></li><li><p>经过全行业中最为苛刻指标要求的运营商认可，产品经过运营商检验及大量应用.</p></li></ul></blockquote><h3>以市场为导向，团结而富有激情的精英团队</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>敏锐的市场嗅觉，洞察客户潜在需求的能力，基于此创造出蓝海市场得到最大价值回报.</p></li><li><p>全面以市场为导向，销售，商务，研发，服务整体链条完全服务于市场需求，时刻响应市场需要.</p></li><li><p>团队化的工作模式和务实高效的工作方式，专注服务客户，以客户满意度提升为工作目标，扩大市场份额空间，为公司创造价值.</p></li></ul></blockquote><h3>独有性、持续增长性</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>数据传输领域投资且呈递增态势；无线市场在国外已经超过有线投资.</p></li><li><p>公司产品独有性，行业内仅有H公司类似产品，昂贵的N，E，C等公司产品因为低性价比逐步退出中国市场.</p></li><li><p>持续恒定发展的市场，对产品需求有稳定性、连续性、增长性.</p></li></ul></blockquote><h3>行业市场领域</h3><blockquote><ul class=\" list-paddingleft-2\"><li><p>公共安全维稳、舆情监控、数据安全传输场景.</p></li><li><p>湖泊、森林、山区、湿地、沙漠、草原数据传输.</p></li><li><p>平安城市、智慧城市的主干互补场景.</p></li><li><p>石油、煤矿、水利等对数据实时性场景.</p></li><li><p>电力行业，变电站数据传输场景.</p></li><li><p>军队等移动应急需要快速部署传输场景.</p></li></ul></blockquote>', '解决方案', '', '1', '1', '2017-03-20 15:24:56', null, '0', '2', '', '0', '{\"template\":\"services\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('6', '1', '', null, '2017-03-20 15:25:22', '', '联系我们', '', '1', '1', '2017-03-20 15:25:13', null, '0', '2', '', '0', '{\"template\":\"contact_us\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('7', '1', '硕导，博士', '', '2017-03-21 16:21:33', '', '陈智军', '​南航副教授，08年毕业于上海交大，从事声表研究10余年。', '3', '1', '2017-03-22 17:28:05', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e2cf1a1ed.jpg\",\"template\":\"\"}', '1', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('8', '1', '博士研究生', '', '2017-03-21 16:23:38', '', '黄鑫', '从事声表研究，声表延迟线型传感器系统研究，声表面波仿真分析，硬件系统设计，研究近十年。', '1', '1', '2017-03-27 23:12:35', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e31ef1977.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('9', '1', '硕士', '', '2017-03-21 16:24:02', '', '蒋玲', '15年毕业，主要从事声表延迟线型器件设计与算法研究。', '1', '1', '2017-03-22 17:28:54', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e33445788.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('10', '1', '硕士', '', '2017-03-21 16:24:24', '', '叶金伟', '11年毕业，精通FPGA编程与算法实现。', '1', '1', '2017-03-27 23:07:15', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e34be7d78.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('11', '1', '硕士', '', '2017-03-21 16:24:47', '', '陆锋', '14年毕业，主要从事声表延迟线型器件阅读系统研究。保密国防工作，参与某型 电子对抗设备研发定型。', '1', '1', '2017-03-27 23:17:24', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e358110a7.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('12', '1', '硕士', '', '2017-03-21 16:25:09', '', '王昕辰', '16年毕业，主要从事声表延迟线型器件阅读系统研究。\r\n', '1', '1', '2017-03-27 23:13:26', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170321\\/58d0e36c6abf7.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('13', '1', '', '', '2017-03-22 15:56:56', '<p style=\"line-height:1.5em;\"><strong>我们是什么（一）</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">雅泰歌思（上海）通讯科技有限公司位于浦东新区张江高科技园区。聚焦于物联网传感技术和运营级无线数据传输技术，是为国内运营商（移动、联通、电信）及政企行业提供无线网络设备和应用解决方案的高科技企业。</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\"><br/></span></p><p style=\"line-height:1.5em;\"><strong>我们是什么（二）</strong></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p class=\"ue_t\">以完全自主知识产权为依托的科技公司</p></li><li><p class=\"ue_t\">SAW声表面波一体化解决方案的领先团队</p></li><li><p>新一代无线传输平台---WTN产品的发明人<br/></p></li><li><p>研发、生产、销售为一体的方案供应商</p></li></ol><p><img src=\"/data/upload/ueditor/20170322/58d22f764cdd7.jpg\" title=\"QQ截图20170322155806.jpg\" alt=\"QQ截图20170322155806.jpg\"/></p><p><br/></p><p style=\"line-height:1.5em;\"><strong>我们是什么（三）</strong></p><ol class=\" list-paddingleft-2\" style=\"width: 1150.64px; white-space: normal;\"><li><p>通讯领域长期沉淀，富有激情的领军带头人</p></li><li><p class=\"ue_t\">来至于各大厂商（华为，中兴等）通讯行业丰富工作经验的优秀人士组成的核心团队</p></li><li><p>多年积累的研发能力是拥有自主知识产权的基础，专注于自主知识产权的研发力量</p></li></ol><p><br/></p><hr/><p><br/><strong>我们的使命</strong></p><p class=\"ue_t\" style=\"text-indent:2em;\">雅泰歌思的追求是实现客户的梦想，以客户需求为导向，保护客户的投资，降低客户的成本和风险，提高客户竞争力和盈利能力，全心的为客户打造最好最适用的产品。</p><p style=\"text-indent:2em;\">聚焦客户关注的挑战和压力，提供行业领先的通信解决方案和服务，持续为客户创造最大价值。</p><p style=\"text-indent:2em;\"><br/></p><hr/><p><strong>宗旨与愿景</strong></p><p style=\"white-space: normal; text-indent: 2em;\">丰富人们的沟通和生活；以客户服务为中心；客户需求是我们发展的原动力。</p><p style=\"white-space: normal; text-indent: 2em;\">质量好、服务好、运作成本低，优先满足客户需求，提升客户竞争力和赢利能力。</p><p style=\"white-space: normal; text-indent: 2em;\">持续管理变革，实现高效的流程化运作，确保端到端的优质交付。&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp;与友商共同发展，既是竞争对手，也是合作伙伴，共同创造良好的生存空间，共享价值链的利益 。</p><hr/><p><strong>核心价值观</strong></p><p><br/></p><p><img src=\"/data/upload/ueditor/20170322/58d230d5abb54.jpg\" title=\"QQ截图20170322160738.jpg\" alt=\"QQ截图20170322160738.jpg\"/></p>', '公司简介', '', '1', '1', '2017-03-22 16:32:41', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('19', '1', '', '', '2017-03-22 18:00:46', '<p class=\"otitle\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">（原标题：外交部：当前半岛局势已经非常紧张，“双暂停”倡议值得重视）</p><p class=\"f_center\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://cms-bucket.nosdn.127.net/dde3e88da6654cedbdb5cfdf6045f19a20170322170958.jpeg?imageView&thumbnail=550x0\" alt=\"undefined\" style=\"vertical-align: top; border: 0px; margin: 0px auto; display: block;\"/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">央视新闻客户端3月22日消息，据韩国媒体报道，朝鲜今天（3月22日）发射数枚导弹，但疑似未获成功。中国外交部发言人华春莹在今天（3月22日）的例行记者会上表示，有关各方应保持冷静克制，中方的“双轨并进”思路和“双暂停”倡议值得各方重视。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>外交部发言人 华春莹：</strong>&nbsp;当前半岛局势已经非常紧张，甚至可以用剑拔弩张来形容，我们呼吁有关各方都保持冷静和克制，避免采取相互刺激、可能引起误判的行动。我们希望各方本着对地区负责的态度，多做一些有利于缓和紧张局势的事。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">华春莹指出，中方提出的推进实现半岛无核化与建立半岛和平机制的“双轨并行”思路以及为此找到突破口的“双暂停”倡议，是摆脱当前半岛困境的客观公正、合情合理的方案。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>外交部发言人 华春莹：</strong>半岛核问题由来已久、错综复杂，其症结在于朝鲜与美韩之间的矛盾，以及彼此间根深蒂固的敌对和互不信任。解铃还须系铃人，我们认为任何只顾追求自身绝对安全、只从自身利益出发而采取的单边行动只会使问题更加复杂化，不仅无法实现自身的真正安全，反而会使相关目标的实现更加困难。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">华春莹说，有关问题如果要标本兼治，需要寻找能兼顾各方合理关切的解决方案。中方提出的“双轨并行”思路和“双暂停”倡议值得各方高度重视、认真思考。</p><p><br/></p>', '朝鲜今发射数枚导弹失败 中方:半岛局势非常紧张', '央视新闻客户端3月22日消息，据韩国媒体报道，朝鲜今天（3月22日）发射数枚导弹，但疑似未获成功。中国外交部发言人华春莹在今天（3月22日）的例行记者会上表示，有关各方应保持冷静克制，中方的“双轨并进”思路和“双暂停”倡议值得各方重视。', '1', '1', '2017-03-22 18:04:05', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170322\\/58d24bffd6f2a.jpg\",\"template\":\"\"}', '5', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('14', '1', '', '', '2017-03-22 16:10:23', '<p>2004年-2011年，上海交大陈智军和李庆亮团队完成声表面波射频识别理论到实践的过程。</p>', '​2004年-2011年', '', '1', '1', '2017-03-22 16:11:18', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('15', '1', '', '', '2017-03-22 16:11:19', '<p>2011年-2014年，江苏省科技支撑计划工业项目，参与声表面波射频识别系统样机开发。并获得江苏省自然科学科技进步三等奖。</p>', '2011年-2014年', '', '1', '1', '2017-03-22 16:11:30', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('16', '1', '', '', '2017-03-22 16:11:31', '<p>2014年-2016年，与某研究所合作开发一套基于声表面波标签的RFID系统。</p><p>技术要求：百万编码容量，三米识别距离，能够在恶劣工作环境下达到99%的识别率。</p><p>该系统工作在国家规定的物联网频段：920MHz-925MHz。</p><p>延伸：该项目验证了多种理论并实践，同时在现有编码方案条件下，降低编码容量即可实现大量程测温功能。<br/></p><p><br/></p>', '2014年-2016年', '', '1', '1', '2017-03-22 16:12:05', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('17', '1', '', '', '2017-03-22 16:12:06', '<p>2014年-2016年，航空科学基金，基于谐振型声表面波技术的航空发动机扭矩传感研究，基本原理与温度传感类似。</p>', '2014年-2016年（现阶段）', '', '1', '1', '2017-03-22 16:12:27', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('18', '1', '', '', '2017-03-22 16:12:28', '<p>2015年-2018年，国家自然科学基金面上项目，具有防碰撞识别功能的无源无线乐甫波液体多参数传感。</p><p><br/></p>', '2015年-2018年（现阶段）', '', '1', '1', '2017-03-22 16:12:44', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('20', '1', '', '', '2017-03-22 18:04:06', '<p class=\"otitle\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">（原标题：南方雨水不休24日降水又来 京津冀等地将迎雨雪降温）</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">中国天气网讯 预计今天(22日)，江南、华南的降水仍然较强，江西、广西等5省区有大雨。明天，南方的雨势暂时减弱，西北、华北地区的大范围雨雪天气将上线。在冷空气和雨雪的双重打压下，北方地区的气温将出现明显转折，北京后天可能度过近1个月来最冷一天。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>广西湖南等局地暴雨24日新一轮降水又来袭</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">3月以来，南方雨水不断，多地降水量已明显偏多，却仍无休止之意。中央气象台预计，今天江淮、江南大部、华南等地有小到中雨，其中广西北部、湖南南部、江西中部、浙江西部、福建中部的部分地区有大雨。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">明天，江南、华南的雨势减弱，但后天起，新一轮降雨过程又将来袭，中央气象台预计，24日至26日，西南地区东部、江南、华南大部等地先后有中到大雨，局地暴雨。上述局部地区还将伴有短时强降水、雷雨大风或冰雹等强对流天气。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.chinanews.com/photo/\" rel=\"sexylightbox[gp]\" target=\"_self\" class=\"f_center\" style=\"color: rgb(15, 107, 153); text-decoration: none; text-align: center; text-indent: 0px;\"><img alt=\"点击进入下一页\" src=\"http://cms-bucket.nosdn.127.net/catchpic/1/12/1236d150d96de5558aea780841fdc15d.jpg?imageView&thumbnail=550x0\" style=\"vertical-align: top; border: 0px; max-width: 580px; cursor: pointer; margin: 0px auto; display: block;\"/></a></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">在阴雨笼罩下，太阳严重“缺勤”，南方多地的气温也跌入近期低谷，长江中下游一带的最高气温跌至10℃出头，江苏、安徽的部分地区甚至不足10℃，十分潮湿阴凉。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">气象专家提醒，近期南方雨水和低温双重施压，对公众出行和生活造成不便，需注意防雨防寒；农民朋友则要防范阴雨寡照天气以及局地强对流对于春播的不利影响。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>北方雨雪即将上线 周四气温大转折</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">受暖湿气流和冷空气的共同影响，西北地区东部及华北大部将自西向东出现一次明显的雨雪天气过程。昨天起，降水已在西北地区东部拉开帷幕，逐步向东推进。由于前期温度较高，大部分时段将以降雨为主，明后天，后续冷空气的到来将使降水相态逐步转为雨夹雪或降雪，京津冀一带部分地区有望见雪。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.chinanews.com/photo/\" rel=\"sexylightbox[gp]\" target=\"_self\" class=\"f_center\" style=\"color: rgb(15, 107, 153); text-decoration: none; text-align: center; text-indent: 0px;\"><img alt=\"点击进入下一页\" src=\"http://cms-bucket.nosdn.127.net/catchpic/5/52/52d3646aad505a21fc5d9047c523795f.jpg?imageView&thumbnail=550x0\" style=\"vertical-align: top; border: 0px; max-width: 580px; cursor: pointer; margin: 0px auto; display: block;\"/></a></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">中央气象台预计，今天内蒙古中部、甘肃中东部、华北北部等地的部分地区有小雪或雨夹雪；明天，新疆南疆南部、内蒙古中部、华北北部等地有小雪或雨夹雪。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">在雨雪和后续冷空气的双重打压下，西北地区东部、内蒙古中西部、华北等地将出现明显大风降温天气，周四气温将发生转折，大部地区降温幅度有4～6℃，其中华北的部分地区气温恐掉至0℃左右，北京本周五的最高气温仅有5℃，将是近1个月来最冷的一天。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">气象专家提醒，常年来看，3月仍是冷空气活动频繁期，气温波动较大，公众需及时关注最新天气预报预警信息，注意做好防寒保暖措施。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><br/></p>', '南方雨水不休24日降水又来 京津冀将迎雨雪降温', '中国天气网讯 预计今天(22日)，江南、华南的降水仍然较强，江西、广西等5省区有大雨。明天，南方的雨势暂时减弱，西北、华北地区的大范围雨雪天气将上线。在冷空气和雨雪的双重打压下，北方地区的气温将出现明显转折，北京后天可能度过近1个月来最冷一天。', '1', '1', '2017-03-22 18:05:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170322\\/58d24c5589ebe.jpg\",\"template\":\"\"}', '5', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('21', '1', '', '', '2017-03-22 18:05:22', '<p class=\"f_center\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"房地产地域差异大:宁去大城市排队 三四线成鬼城\" src=\"http://cms-bucket.nosdn.127.net/catchpic/f/fc/fc8df2811074295cca115cdc98e7d69e.jpg?imageView&thumbnail=550x0\" style=\"vertical-align: top; border: 0px; display: block; margin: 0px auto; max-width: 100%; border-radius: 4px; background: rgb(239, 239, 239);\"/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">作者 相均泳(中国人民大学重阳金融研究院产业研究部副主任、中新经纬特约专家)李下蹊(中国人民大学重阳金融研究院实习研究员)</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">3月21日，央行发布的《2017年第一季度城镇储户问卷调查报告》显示，52.2%的居民认为目前房价“高，难以接受”，42.9%的居民认为目前房价“可以接受”，4.9%的居民认为“令人满意”。实际上，在一线城市不难感受到房价的高涨以及随之而来的限购。然而，在更多的三四线城市楼市又是另一番景象——房屋供需失衡，有效需求不足。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">近期，房地产一直是个热门的话题。2016年12月中旬，中央经济工作会议提出，要坚持“房子是用来住的，不是用来炒的”的定位，要坚持分类调控，因城因地施策，重点解决三四线城市房地产库存过多问题。今年两会政府工作报告中提出，2017年因城施策去库存，坚持住房的居住属性，加快建立和完善促进房地产市场平稳健康发展的长效机制。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">3月17日，北京市大幅加码房地产限购政策，不仅认房又认贷，而且把二套普通住房首付比例加高到6成，非普通住房提升到8成，甚至暂停发放贷款期限25年以上的个人住房贷款。数小时之后，广州迅速跟进，也宣布出台楼市限购和差别化信贷新政。一夜之间，离婚买房者哭晕在民政局，高企的房价让奋斗的“北漂”“海漂”们望而却步。房子在人们生活中扮演的角色和房子自身的根本属性正在慢慢发生改变。作为刚性需求应该要“住”的房子摇身一变，成为了投资的工具，房子作为“投资品”的派生属性正愈演愈烈，使房价越“炒”越热，而真正需要房屋居住的消费者只能望“房”兴叹。相比火爆的一线城市房市，三、四线城市的房价还是相对“亲民”，咬咬牙可以负担得起的。房地产业发展出现了地域之间严重的不平衡，如果没有限购，楼市依然是“日光盘”和“鬼城”共舞。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>房地产的地域差异为哪般？</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">整体而言，中国近年来的房地产行业发展迅猛，房价呈上涨趋势。但若细细探究不难发现，“买房难”甚至是“摇号买房”现象，更多的是发生在政治、经济等社会活动处于重要地位且基础交通设施较为完善的一、二线城市，相对而言，以中东部地区地级市和县级市为主的三、四线城市的房价上涨就难以如此牵动居民的心并引起如此高的关注，甚至存在大量房屋闲置并亟待出售去库存的状况。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">房地产地域差异的背后，体现城市具备的要素的差异。相对于发达城市，三四线城市的基础设施、交通设施、产业结构、教育水平落后，发展机遇少，从而造成人口大量迁移至发展迅猛、机会众多的一二线城市，尤其是年轻人，这样一来，房屋的刚性需求都跟不上，更别谈用来“炒房”的投资需求。与此同时，三、四线城市却跟随前几年房地产行业炙热发展的趋势，也着手于各地楼盘的开发，建造房屋并计划出售。但由于三、四线城市发展相对落后，当地需求跟不上，房屋难以出售，最后形成了一个个房屋林立却人迹罕见的“鬼城”。例如，仅花五年就建成的鄂尔多斯市康巴什新城区，需求的滞后造成当年新建成的楼房存量大量积压，房屋供给与需求严重不对称，人们宁愿去大城市排队“等”买房也不愿在当地消费。相对比，历经五年后，康巴什的房屋入住率得到了明显改善，据当地中介介绍，这与相应的减少房屋供给，增加周围大量的工作机会及当地中学入学率的提升是密切相关的。因此，缺乏刚性需求为前提的盲目供给，只能适得其反，且不利于当地房地产业跟随大城市前进的步伐。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>三、四线城市可吸引农村人口进城</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">如果说一、二线城市吸引了三、四线城市的人口流入，那么三、四线城市相对而言就应具备吸引农村人口的条件。这样的条件是存在的，党的十八大提出了新型城镇化概念，城乡建设统筹、互促共进。然而，农民的生存严重依赖于土地，土地是农民的“命根子”，因此，进城就意味着离开他们的“命根子”。进城后土地该如何处置，也是牵绊农民进城的一大阻力，因此，推进新型城镇化的同时，也要解决农民的土地问题。我国历史上历经三次大型土地改革，一直致力于解决农民与土地的关系问题。于2016年印发的《关于完善农村土地所有权承包权经营权分置办法的意见》中，推行实施“三权分置”政策，即农民对土地的所有权、承包权和经营权相分离，旨在落实集体所有权，稳定农户承包权，放活土地经营权，充分发挥“三权”的各自功能和整体效用，形成层次分明、结构合理、平等保护的格局。《意见》的出台，增加了农民对土地处置的灵活性，也拓宽了农民的就业范围。解决好农民的土地问题，让农民没有后顾之忧，才能进城进得安心、舒心与放心，进而推进城镇化，增加三、四线城市需求活力，才能推动三、四线城市摆脱“鬼城”。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>打铁还需自身硬，三、四线城市重在提升实力</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">要切实消除“鬼城”问题，推动三、四线城市的房地产业良性健康发展，就要解决好本地房屋供需对称问题，同时让农民入城无后顾之忧。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">要满足居民需求，就要解决基础设施、交通设施、产业结构、教育水平落后的问题。对于三、四线城市，抓住机遇发展自身硬条件是重中之重，满足于现状是不行的，要不断地审时度势，跟随国家相关意见政策的步伐，发展硬实力。比如河北省的地级市张家口市，就应抓好2022年北京——张家口冬奥会的契机，利用好中央现阶段对其大量的基础设施建设投资，规划相关建设，借势宣传自己的资源优势，打出自身的资源特色，吸引投资，留住人才，刺激房屋需求，实现房屋供给与需求相平衡。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">子女的教育问题和房屋的需求直接挂钩，“学区房”是炒房当中的“佼佼者”。为了让子女接受更好的教育，处于教育水平相对落后的三、四线城市的父母不惜花费大量的时间与金钱选择去教育水平优质的大城市买房，因此，提高三、四线城市的教育水平将助力解决当地房屋供大于需的难题。为此，其一，国家应鼓励年轻的师资到三、四线城市就业，并制订相应的福利政策，毕竟师资力量是教育水平的关键。同时，要加大对教育基础设施的投资，改善教育环境，争取缩小大、中、小城市的教育水平，实现当地人在当地上好学校的夙愿。其二，从根本上改变“学区房”概念。两会也在讨论，将试点采取就近入学政策，不让“学区房”的高价售卖有可乘之机，同时为其它普通住房的出售提供平等机会。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">解决农民进城后农村土地和户籍等问题。农民生活依靠土地，且收入来源大量基于第一产业农、林、牧、渔业。此次“三权分置”改革，就是在鼓励大量农业人口向二、三产业转移，而农村电商、绿色农业、农业互联网化等也为将农民从单一的靠土地为生中“解救”出来。同时，户籍问题也是农民进城难的另一大原因。农村劳动力仍然是“离乡不离土”的模式，非农业户和农业户这一从出生就自动划分的户籍制度亟需改革，因此，只有深化户籍管理制度改革，才能更好的促进新型城镇化水平，鼓励农民积极到三、四线城市买房、入学、就业、发展。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><br/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">抑制大城市房价上涨是中央工作的重点，但也不能忽视三、四线城市房屋供需严重失衡的问题。找到病灶并对症下药是解决三四线城市“鬼城”问题的关键。只有完善一揽子政策组合，综合运用金融、土地、财税、投资、立法等手段，并尽快建立符合国情、适应市场规律的基础性制度和长效机制，才能实现真正的大中小城市与乡村经济共同发展，解决“限购”与“鬼城”齐飞的难题。(APP)</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">【专家简介】相均泳，中国人民大学重阳金融研究院产业研究部副主任、研究员。曾任韩国庆熙大学管理学院科研教授、中国社会科学院财经战略研究院副研究员。主要从事产业经济和互联网经济等领域研究。</p><p><br/></p>', '房地产地域差异大:大城市排队限购 三四线成鬼城', '3月21日，央行发布的《2017年第一季度城镇储户问卷调查报告》显示，52.2%的居民认为目前房价“高，难以接受”，42.9%的居民认为目前房价“可以接受”，4.9%的居民认为“令人满意”。实际上，在一线城市不难感受到房价的高涨以及随之而来的限购。然而，在更多的三四线城市楼市又是另一番景象——房屋供需失衡，有效需求不足。', '1', '1', '2017-03-22 18:07:01', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170322\\/58d24cc0982a3.jpg\",\"template\":\"\"}', '57', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('22', '1', '', '', '2017-03-23 15:09:13', '<p><img src=\"/data/upload/ueditor/20170323/58d3752d466b0.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d37535ead08.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d3753ab2333.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d37546a253c.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d3754d551c6.png\" title=\"blob.png\" alt=\"blob.png\"/><img src=\"/data/upload/ueditor/20170323/58d375543436e.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p>工作于物联网频段：920MHz-925MHz；编码容量：298万；</p><p>最远识别距离：≥3米；芯片工作温度范围：-40~150℃；</p><p>识别率：99%。</p><h1 label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d\">产品特性</span></h1><h3><span class=\"ue_t\" style=\"font-family:幼圆\">芯片纯无源特性</span></h3><p class=\"ue_t\" style=\"text-indent:2em;\">无需电池，CT线圈等供能，利用反向散射原理直接从空中截获电磁波取能，大大提高了可靠性，降低了维护成本；由于纯机械振动，不涉及电子迁移，在强电磁场环境下不受影响。</p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">芯片温度特性与算法的解码能力</span></h3><p class=\"ue_t\" style=\"text-indent:2em;\">芯片的性能随温度变化，开发出一套完全有自主知识产权的解码算法去除温度对芯片的影响。芯片压电基底熔点1240℃，金属结构熔点660℃，算法温度校正范围<span style=\"color: rgb(255, 0, 0);\">5000℃</span>！</p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">系统读取速度快，根据距离自适应调整</span></h3><p style=\"text-indent: 2em;\">芯片一次读取时间只有5微秒，采用电子对抗技术的读取装置完成一次99%准确率读取的时间只需10毫秒。另外根据装置与芯片距离自适应调整发射功率与接收增益。整个系统灵敏度达到-80dBm（阅读器天线增益14dBi）。</p><p><br/></p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">声表面波简介</span></h3><p style=\"white-space: normal; text-indent: 2em;\">声表面波（SAW，Surface Acoustic Wave）是在固体半空间表面存在的一种沿表面传播，能量集中于表面附近的弹性波。声表面波是英国物理学家瑞利（Rayleigh）在19世纪80 年代研究地震波的过程中偶尔发现的一种能量集中于地表面传播的声波。</p><p style=\"white-space: normal; text-indent: 2em;\">1965年，美国科学家White和Voltmer在应用物理杂志上发表题为“Direct piezoelectric coupling to surface acoustic waves”的论文，文中指出利用沉积在压电基片上的叉指换能器有效地激励出SAW，此后SAW技术才得到飞速发展。</p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">声表面波器件分为谐振型和延迟线性</span></h3><p style=\"white-space: normal; text-indent: 2em;\"><img src=\"/data/upload/ueditor/20170323/58d3762a46e3f.png\" title=\"blob.png\" alt=\"blob.png\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"/data/upload/ueditor/20170323/58d37638a28f1.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><br/></p><p>延迟线性SAW器件特别适合射频识别（RFID）应用，但起步较晚，远落后与基于IC的射频识别技术。</p><p>压电基底在不同的切向对不同的物理量进行敏感，因此将识别与传感结合才是SAW器件的最大优势。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p><img src=\"/data/upload/ueditor/20170323/58d3764bc4d8a.png\" title=\"blob.png\" alt=\"blob.png\"/>&nbsp;&nbsp;<img src=\"/data/upload/ueditor/20170323/58d3764f02355.png\" title=\"blob.png\" alt=\"blob.png\"/></p><h1 class=\"ue_t\" label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">国内外发展现状及应用前景</span></h1><h3><span class=\"ue_t\" style=\"font-family:幼圆\"></span></h3><p style=\"text-indent: 2em;\">1.德国西门子公司1994年推出了SOFIS声表面波RFID系统，该系统采用2.45GHz 声表面波标签，应用于德国慕尼黑火车进站精确定位系统。</p><p><br/></p><p style=\"text-indent: 2em;\">2.美国新兴的SAW标签公司RF-SAW发明制作的GST（Global SAW Tag）符合EPC标准，编码容量达到了128位以上，具有3～10米的读取距离和防碰撞能力，被美国国家航空航天局(NASA)选择了应用于国际空间站的包裹分拣。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">上海交大与南京大学在声表面波理论仿真方面做出了不少贡献。南开大学与安徽大学分别在标签与阅读器方面进行设计与制作，遗憾的是目前并未见到成熟的样机。</p><p style=\"text-indent: 2em;\">中电第五十五研究所对声表面波标签进行了初步探究，进行了标签的设计制作与测试。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">从国内来看，迄今为止只有上海交通大学研制出了较完备的包括SAW标签和SAW阅读器的声表面波射频识别系统样机。</p><hr/><p>目前谐振型用于密闭空间的温度传感，已有应用：高压开关柜触点温度测量。</p><p><img src=\"/data/upload/ueditor/20170323/58d37707d26ad.jpg\" title=\"QQ截图20170323151926.jpg\" alt=\"QQ截图20170323151926.jpg\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d3771e51a14.jpg\" title=\"QQ截图20170323151950.jpg\" alt=\"QQ截图20170323151950.jpg\"/></p><p><span style=\"font-size: 18px;\"><strong>现有谐振型SAW测温系统</strong></span></p><p><span style=\"font-size: 18px;\"><strong><img src=\"/data/upload/ueditor/20170323/58d37741bd728.png\" title=\"blob.png\" alt=\"blob.png\"/><img src=\"/data/upload/ueditor/20170323/58d377443c808.png\" title=\"blob.png\" alt=\"blob.png\"/></strong></span></p><p><img src=\"/data/upload/ueditor/20170323/58d3775727b75.jpg\" title=\"QQ截图20170323152043.jpg\" alt=\"QQ截图20170323152043.jpg\"/></p><p><br/></p>', 'SAW声表面波无源无线识别传感系统', '声表面波（SAW，Surface Acoustic Wave）是在固体半空间表面存在的一种沿表面传播，能量集中于表面附近的弹性波。声表面波是英国物理学家瑞利（Rayleigh）在19世纪80 年代研究地震波的过程中偶尔发现的一种能量集中于地表面传播的声波。\r\n1965年，美国科学家White和Voltmer在应用物理杂志上发表题为“Direct piezoelectric coupling to surface acoustic waves”的论文，文中指出利用沉积在压电基片上的叉指换能器有效地激励出SAW，此后SAW技术才得到飞速发展。', '1', '1', '2017-03-23 15:21:00', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170323\\/58d3751304ee4.jpg\",\"template\":\"\"}', '26', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('23', '1', '', '', '2017-03-23 15:21:06', '<p>运营级的无线传输平台（WTN）</p><p><img src=\"/data/upload/ueditor/20170323/58d377a4e3764.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p><img src=\"/data/upload/ueditor/20170323/58d377a9e5dea.png\" title=\"blob.png\" alt=\"blob.png\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"/data/upload/ueditor/20170323/58d377b009207.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p>独有的5G—40G频段无线传输系统，提供等同于光纤性能指标的无线传输方案，在运营商，军队，公安，交通，能源，电力等市场具有很好的应用前景，快速、安全、可靠，成为各行业作为光纤传输互补的首选产品与解决方案。</p><p><br/></p><p style=\"text-align: center;\"><strong><span style=\"font-size: 20px;\">产品特性</span></strong><br/></p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">设备体积小</span></h3><p style=\"text-indent:2em;\">室外设备与天线一体化，设备体积小巧，安装便捷。</p><p style=\"text-indent:2em;\"><img src=\"/data/upload/ueditor/20170323/58d378407be4a.png\" title=\"blob.png\" alt=\"blob.png\"/></p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">提供高质量的网络传输</span></h3><p class=\"ue_t\" style=\"text-indent:2em;\">链路规划取微波、WLAN无线链路优点，克服其缺点，因此能够提供高于传统微波链路的传输质量，其传输质量更远远高于普通网桥的传输质量。</p><p class=\"ue_t\" style=\"text-indent:2em;\"><img src=\"/data/upload/ueditor/20170323/58d378546ea62.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p class=\"ue_t\" style=\"text-indent:2em;\"><br/></p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">极低的传输时延</span></h3><p style=\"text-indent: 2em;\">传输时延小于1ms，<span style=\"text-indent: 2em;\">满足运营级的苛刻传输时延。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><img src=\"/data/upload/ueditor/20170323/58d3789580dc6.png\" title=\"blob.png\" alt=\"blob.png\"/></p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">抗干扰能力强</span></h3><p style=\"text-indent: 2em;\">一方面得益于微波技术的抗干扰设计理念，克服其短板取其长处。</p><p style=\"text-indent: 2em;\">另一方面采用LDPC编码进一步提高纠错增益，从而提高抗干扰能力。</p><p class=\"ue_t\" style=\"white-space: normal; text-indent: 2em;\"><img src=\"/data/upload/ueditor/20170323/58d378b627d35.png\" title=\"blob.png\" alt=\"blob.png\"/></p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">自适应调制技术</span></h3><p style=\"text-indent: 2em;\">发射机和接收机将相互协商可支持的最高的数据速率，然后随着条件变化动态上调和下调速率，可以始终在当前的功率限制下提供最大的性能。</p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"text-indent: 2em;\"></span><br/></p><p style=\"white-space: normal; text-indent: 2em;\"><img src=\"/data/upload/ueditor/20170323/58d378e16e3ee.png\" title=\"blob.png\" alt=\"blob.png\"/></p><h3 style=\"white-space: normal;\"><span class=\"ue_t\" style=\"font-family: 幼圆;\">提供原生E1/T1</span></h3><p style=\"white-space: normal; text-indent: 2em;\">RR-C500提供原生的E1，提供高质量E1传输的同时消除E1租赁成本。</p><p style=\"white-space: normal; text-indent: 2em;\"></p><h3 style=\"white-space: normal;\"><font face=\"幼圆\">规格</font></h3><p><font face=\"幼圆\"><img src=\"/data/upload/ueditor/20170323/58d3790e176f7.jpg\" title=\"QQ截图20170323152807.jpg\" alt=\"QQ截图20170323152807.jpg\"/></font></p><p><font face=\"幼圆\"><img src=\"/data/upload/ueditor/20170323/58d3791ba8ea4.jpg\" title=\"QQ截图20170323152823.jpg\" alt=\"QQ截图20170323152823.jpg\"/></font></p><p><br/></p>', '运营级的无线传输平台（WTN）', '独有的5G—40G频段无线传输系统，提供等同于光纤性能指标的无线传输方案，在运营商，军队，公安，交通，能源，电力等市场具有很好的应用前景，快速、安全、可靠，成为各行业作为光纤传输互补的首选产品与解决方案。', '1', '1', '2017-03-23 15:28:52', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170323\\/58d37791a44f6.jpg\",\"template\":\"\"}', '13', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('24', '1', '本科', '', '2017-03-27 23:17:44', '', '魏益民', '14年毕业，从事保密国防工作   参与某型 电子对抗设备研发定型', '1', '1', '2017-03-27 23:20:57', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170327\\/58d92dd66e744.png\",\"template\":\"\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of cmf_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of cmf_term_relationships
-- ----------------------------
INSERT INTO `cmf_term_relationships` VALUES ('13', '7', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('14', '8', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('15', '9', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('16', '10', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('17', '11', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('18', '12', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('7', '13', '7', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('8', '14', '9', '1', '1');
INSERT INTO `cmf_term_relationships` VALUES ('9', '15', '9', '2', '1');
INSERT INTO `cmf_term_relationships` VALUES ('10', '16', '9', '3', '1');
INSERT INTO `cmf_term_relationships` VALUES ('11', '17', '9', '4', '1');
INSERT INTO `cmf_term_relationships` VALUES ('12', '18', '9', '5', '1');
INSERT INTO `cmf_term_relationships` VALUES ('19', '19', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('20', '20', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('21', '21', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('22', '22', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('23', '23', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('24', '24', '11', '0', '1');

-- ----------------------------
-- Table structure for cmf_terms
-- ----------------------------
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of cmf_terms
-- ----------------------------
INSERT INTO `cmf_terms` VALUES ('4', '产品展示', '', 'article', '', '0', '0', '0-4', '', '', '', 'list', 'article', '5', '1');
INSERT INTO `cmf_terms` VALUES ('3', '新闻中心', '', 'article', '', '0', '0', '0-3', '', '', '', 'list', 'article', '1', '1');
INSERT INTO `cmf_terms` VALUES ('6', '关于我们', '', 'article', '', '0', '0', '0-6', '', '', '', 'list', 'article', '15', '1');
INSERT INTO `cmf_terms` VALUES ('7', '公司简介', '', 'article', '', '6', '0', '0-6-7', '', '', '', 'list', 'article', '1', '1');
INSERT INTO `cmf_terms` VALUES ('9', '研发历程', '', 'article', '', '6', '0', '0-6-9', '', '', '', 'list', 'article', '3', '1');
INSERT INTO `cmf_terms` VALUES ('11', '研发团队', '', 'article', '', '6', '0', '0-6-11', '', '', '', 'list', 'article', '10', '1');

-- ----------------------------
-- Table structure for cmf_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_users
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_users
-- ----------------------------
INSERT INTO `cmf_users` VALUES ('1', 'admin', '###fe5cc9bfa0743cb7d740b996dcfb7e4d', 'admin', 'hu01232002@qq.com', '', null, '0', '2000-01-01', null, '223.72.75.111', '2017-05-08 10:26:35', '2017-03-16 03:51:26', '', '1', '0', '1', '0', '');

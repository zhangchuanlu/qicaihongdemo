const API_HOST_PROD_URL = 'http://101.132.141.118:8005';


/**个人中心 */

///用户登录
const USER_LOGIN_URL="/user/login";

///用户详情
const USER_INFO_URL="/user/getuserinfo";

///用户退出
const USER_LOGOUT_URL="/user/logout";

///修改昵称
const USER_NICKNAME_URL="/user/nickname";

///修改性别
const USER_GENDER_URL="/user/gender";

///意见反馈
const USER_FEEDBACK_URL="/user/feedback";

///注册
const USER_REGISTER_URL="/user/register";

///修改密码
const USER_UPDATEPASSWORD_URL="/user/password/modify";

///获得用户头像列表
const USER_GETAVATAR_URL="/user/getavatar";

///修改用户头像
const USER_UPDATEUSERIMGURL_URL="/user/updateuserimgurl";

///发送短信验证码
const COMMON_SMS_CREATE_URL="/common/sms/send";


/**专家 */

///获得专家列表信息
const EXPERT_LIST_URL="/expert/getexpert";

///获得已关注专家列表信息
const EXPERT_FOLLOW_URL="/expert/getfollowexpert";

///获得专家详情信息
const EXPERT_INFO_URL="/expert/getexpertinfo";

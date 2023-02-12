<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="cn"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>用户登录 - 问答小屋</title><meta name="description" content="问答小屋"><meta name="keywords" content="">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/layui.css">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/global.css">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/main.css">

</script><link id="layuicss-layer" rel="stylesheet" href="./用户登录 - 问答小屋_files/layer.css" media="all"><link id="layuicss-laydate" rel="stylesheet" href="./用户登录 - 问答小屋_files/laydate.css" media="all"></head>
<body>
<div>
<div id="header" style="display:inline-block;"><%@ include file="/头部.jsp"%></div>
  <div class="fly-panel fly-panel-user" pad20="">
    <div class="layui-tab layui-tab-brief" lay-filter="user">
    <li>${result}</li><font color=red></font>
      <ul class="layui-tab-title">
        <li class="layui-this">注册</li>
        <li></li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form method="post" action="insert">
            <input type="hidden" id="forward" name="return_url" value="https://www.wendaxiaowu.com/user/login.htm">
<input type="hidden" id="authtype" name="authtype" value="">
  <input type="hidden" id="tokenkey" name="tokenkey" value="85efc7667dc4902eee3a21286be190e0">
              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" placeholder="账号" autocomplete="off" id="xm-login-user-name" name="name" required="" lay-verify="required" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input placeholder="密码" type="password" id="xm-login-user-password" name="word" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
          
              <div class="layui-form-item">
            
                          <input type="submit" name="submit" class="layui-btn" value=" 注册 "> 
        
                
              </div>
                            
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="/尾部.jsp"%>
 <!-- 公共底部 --> 
﻿

 <script>
layui.use(['jquery', 'layer'], function(){ 
  var $ = layui.$ //重点处
  ,layer = layui.layer;
  var tips;
  $(".link-tips").hover(function () { 
      tips = layer.tips($(this).attr("title"), $(this),{
         tips: [1, '#555555']
         // 上右下左四个方向，通过1-4进行方向设定
     });
     
 },function(){
 	layer.close(tips);
 }); $(".lazy").each(function(){
 $(this).attr("src",$(this).attr("data-original"))
 })
});
</script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1  ,avatar: 'https://www.wendaxiaowu.com//static/css/default/avatar.gif'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: 'https://www.wendaxiaowu.com/static/responsive_fly/res/mods/' 
}).extend({
  fly: 'index'
}).use('fly');
</script>
<script src="./用户登录 - 问答小屋_files/clipboard.min.js.下载" type="text/javascript"></script> 

</body></html>
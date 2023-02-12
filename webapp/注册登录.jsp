<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/layui.css">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/global.css">
<link rel="stylesheet" href="./用户登录 - 问答小屋_files/main.css">
</head>
<body><div id="header" style="display:inline-block;"><%@ include file="/头部.jsp"%></div>
<div class="layui-container fly-marginTop">
  <div class="fly-panel fly-panel-user" pad20="">
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title">
        <li class="layui-this">登入</li>
        <li></li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form method="post" action="select">


              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" placeholder="账号" autocomplete="off" id="xm-login-user-name" name="username" required=" "  class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input placeholder="密码" type="password" id="xm-login-user-password" name="password" required=" "  autocomplete="off" class="layui-input">
                </div>
              </div>
          
              <div class="layui-form-item">  
                          <input type="submit" name="submit" class="layui-btn" value=" 立即登录 "> 
        
                <span style="padding-left:20px;">
                  <a href="http://127.0.0.1:8080/Javaweb/%E6%B3%A8%E5%86%8C.jsp" class="layui-btn">注册</a>
                </span>
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
 
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  
}).extend({
  fly: 'index'
}).use('fly');
</script>
<script src="./用户登录 - 问答小屋_files/clipboard.min.js.下载" type="text/javascript"></script> 

<ul class="layui-fixbar"><li class="layui-icon" lay-type="bar1" style="background-color:#009688"></li><li class="layui-icon layui-fixbar-top" lay-type="top" style="background-color:#009688"></li></ul></body></html>
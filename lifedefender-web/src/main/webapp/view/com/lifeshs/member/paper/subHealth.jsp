<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<t:base type="jquery,vue"></t:base>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="IE=Edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="/static/css/paper/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/paper/magic-check.css">
    <link rel="stylesheet" type="text/css" href="/static/css/paper/questionnaire.css">
    <!-- <script src="jquery/jquery-2.1.1.min.js"></script> -->
    <title>调查问卷_亚健康</title>
    <style>
    	[v-cloak] {
    		display: none;
    	}
    </style>
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<header id="header" class="header">
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
	        	<div class="navbar-header">
		            <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
			            <span class="sr-only">切换导航</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
		            </button>
		            <a href="#" class="navbar-brand scroll-top logo">
		            	<img src="/static/images/index/logo.png" class="img-responsive" alt="Responsive image">
		            </a>
	        	</div>
	        	<!--/.navbar-header-->
		        <div id="main-nav" class="collapse navbar-collapse">
		            <ul class="nav navbar-nav" id="mainNav">
			            <li class="active"><a href="#home" class="scroll-link">首页</a></li>
						<li>
							<a href="#" class="scroll-link">APP介绍</a>
							<ul>
							    <li><a href="#">机构端</a></li>
							    <li><a href="#">用户端</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="scroll-link">产品与服务</a>
							<ul>
							    <li><a href="#">机构服务</a></li>
							    <li><a href="#">健康问诊</a></li>
							    <li><a href="#">智能设备</a></li>
							    <li><a href="#">健康咨询</a></li>
							</ul>
						</li>
						<li><a href="#" class="scroll-link">商家入住</a></li>
						<li>
							<a href="#" class="scroll-link">关于我们</a>
							<ul>
							    <li><a href="#">公司介绍</a></li>
							    <li><a href="#">帮助中心</a></li>
							    <li><a href="#">联系我们</a></li>
							</ul>
						</li>
						<li><a href="#" class="scroll-link">注册</a></li> 
						<li><a href="#" class="scroll-link">登录</a></li> 
		            </ul>
		        </div>
		        <!--/.navbar-collapse-->
		    </nav>
		    <!--/.navbar-->
		</div>
		<!--/.container-->
	</header><!-- /header -->
	<section class="item-content subHealthModel">
		<div class="container">
			<div>
				<div class="item-title">
					<h3>亚健康评估问卷</h3>
				</div>
				<p class="item-content-border">
					亚健康是指处于健康与疾病之间的一种临界状态，亚健康状态即可以向好的方向妆花恢复到健康状态，也可以向坏的方向转化为进一步发展为各种疾病。本测试题共有18道题，请耐心答完。
				</p>
			</div>
			<%@include file="subHealthCommon.jsp"%>
			<!-- <div class="item-quetion">
				<h4 class="item-sub" v-cloak>第{{currentTopicNumber}}题,共{{totalTopic}}道题</h4>
				<form>
					<h4 v-cloak>{{currentTopicNumber}}. {{currentTopicName}}</h4>
					<ul class = "options">
					    <li v-cloak v-for = "(o, index) in questionnaireOptions">
					    	<input type="radio" name="2" :id="checkedCss(index)" @click = "nextTopic(o.score, o.topicType)" class="magic-radio">
					    	<label :for="checkedCss(index)">{{o.name}}</label>
					    </li>
					</ul>
				</form>
				<p class="text-center"><button v-if = "(currentTopicNumber > 1)" @click = "preTopic()" class="btn" v-cloak>上一题</button></p>
			</div> -->

		</div>
	</section>
	<footer id="footer" class="footer"> 
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12">
					<ul>
					    <li><h5>广州通众电气实业有限公司&copy;版权所有</h5></li>
					    <li><a href="#">粤ICP备13019866号-3</a></li>
					    <li>400-026-1003</li>
					</ul>
				</div>
				<div class="col-md-5 col-sm-4">
					<div class="row clearMargin">
						<div class="col-xs-6">
							<h4>关于我们</h4>
							<ul>
							    <li><a href="#">关于健康管理平台</a></li>
							    <li><a href="#">官方网站</a></li>
							    <li><a href="#">加入我们</a></li>
							    <li><a href="#">联系我们</a></li>
							</ul>
						</div>
						<div class="col-xs-6">
							<h4>免费下载APP</h4>
							<ul>
							    <li>
							    	<a href="#">IOS下载</a>
							    </li>
							    <li>
							    	<a href="#">IOS下载</a>
							    </li>
							</ul>
						</div>
					</div>
					
				</div>
				<div class="col-md-3 col-sm-4">
					<a href="#" class="item-code">
						<img src="/static/images/index/QR_Code.png" alt="">
						<h4>生命守护公众号</h4>
					</a>
				</div>
			</div>
		</div>
	</footer>

	<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/static/com/lifeshs/paper/subHealth.js"></script>
	<script>
		$(function () {
			vueModel.getSubHealth().questionnaire = '${questionnaire}' == '[]' ? '' : JSON.parse('${questionnaire}');
			vueModel.getSubHealth().questionnaireOptions = '${questionnaireOption}' == '[]' ? '' : JSON.parse('${questionnaireOption}');
		});
	</script>
</body>
</html>
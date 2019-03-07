<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<!-- <meta charset="UTF-8"> -->
		<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
		<script src="../../static/plugins/angularJS/angular.min.js"></script>
		<script src="../../static/plugins/layui/v2.1.2/layui.all.js"></script>
		<script src="../../static/plugins/http.js"></script>
		<link rel="stylesheet" href="/static/semantic/semantic.css" />
		<script type="text/javascript" src="/static/semantic/semantic.js" ></script>
		<title></title>

		<style>
			body {
				margin: 0;
				padding: 0;
				background-color: #f5f5f5;
				font-size: 1rem;
			}
			
			/*联系人块*/
			.div_contact{
				width: 100%;
				height: 5.5rem;
				background-color: white;
				margin-bottom: 1rem;
				font-size:1.3rem;
			}
			
			.contact_describe{
				position: relative;
				padding:0.5rem 1.5rem 0.5rem 1.8rem;
			}
			.contact_describe > label:nth-of-type(1){
				float: left;
			}
			.contact_describe > label:nth-of-type(2){
				float: right;
			}
			
			.contact_address{
				clear: both;
				padding:0.8rem 1.5rem 0.8rem 1.5rem;
				display:flex;
				justify-content:space-between;
				align-items: center;
			}
			
			
		</style>
		<link rel="stylesheet" href="/static/css/shop/css/comman.css" />
		<link rel="stylesheet" href="/static/css/shop/css/subcontent.css" />
		<link rel="stylesheet" href="/static/css/shop/css/slide.css" />
		<!--自适应js-->
		<script type="text/javascript" src="/static/js/mode.js"></script>
		<script type="text/javascript" src="/static/js/jq.js"></script>
		<style>
			/*商品条*/
			.product_bar{
				background-color: white;
				overflow: hidden;
				padding:0.5rem 0 0.5rem 0;
				margin-bottom: 1rem;
			}
			
			.product_bar_header{
				padding:0.8rem 0.5rem 0.8rem 0.5rem;
				border-bottom: 1px solid #eeeeee;
				font-size:1.4rem;
			}
			
			.product_bar_img{
				float: left;
				margin:0.5rem 0.5rem 0 0.5rem;
				padding: 0.5rem 0.5rem 0.5rem 0.5rem;
				border:1px solid #eeeeee;
				background-color: white;
				border-radius: 0.5rem;
			}
			
			.product_bar_title_text{
				font-size:0.8rem;
				margin-top: 0.5rem;
				display: flex;
				flex-direction: column;
				padding-left:1rem;
				padding-right: 1rem;
			}
			
			.product_bar_title{
				display: flex;
				flex-direction: row;
				justify-content: space-between;
			}
			
			.order_bar{
				display: flex;
				justify-content: space-between;
				padding:1rem 0.5rem 1rem 0.5rem;
				border-bottom: 1px solid #eeeeee;
				background-color: white;
				font-size:1.3rem;
				color:#5c5757;
			}
		</style>
	
		<script type="text/javascript">
			var app = angular.module('myShop',[]);
			app.controller('detailsController1',function($scope,$element){
												
				$scope.order = {addressId:{},shop:[],skuId:[],LoadingList:[{"invoice":{},"orderNotes":""},{"invoice":{},"orderNotes":{}},{"invoice":{},"orderNotes":{}},{"invoice":{},"orderNotes":{}},{"invoice":{},"orderNotes":{}}],paymentType:1,money:{}};		
				$scope.list = ${loadingList};
				$scope.JudgementStock = ${JudgementStock};
				$scope.init = function(){
										
					$scope.getAddress();
					$scope.priceSum();	
					
					if($scope.JudgementStock){
						layer.msg("要购买的商品有超过商品库存的，请更改数量再购买", {offset: 350}); 
						history.go(-1);
					};
					
				}
				
				$scope.getAddress = function(){
					var url = "/shop/getAddress";
					http.ajax.get(true,true,url,null,http.ajax.CONTENT_TYPE_1,function(result){		            	
		                $scope.$apply(function(){
		                    if(result.success){
		                    	$scope.address = result.obj;
		                    	if($scope.address == null || $scope.address.length == 0 ){
		                    		layer.msg("没有收货地址，请添加收货地址，1秒后跳转到添加页面", {offset: 350}); 
		                    		setTimeout(function () {                                              	 
		                    			window.location = "/shop/addressPage?judge="+false;
		                           	},1000)		                    				                    				                    				                    				                  		
		                    	}
		                    	for(var i = 0;i<$scope.address.length;i++){
		                    		if($scope.address[i].selected == 1){
		                    			$scope.order.addressId = $scope.address[i].id; //添加地址id到封装对象
		                    		}
		                    	}
		                    }
		                })
			        });
				}
				
				$scope.priceSum = function(){
					
					var prict = 0;  //金额统计
					var discount = 0; //优惠统计
					
					for(var i=0;i <$scope.list.length;i++){
						 $scope.order.shop.push($scope.list[i].sellerId);
						 for(var j=0;j< $scope.list[i].orderItemList.length;j++){							 
							prict += $scope.list[i].orderItemList[j].favorablePrice * $scope.list[i].orderItemList[j].num;														
							discount += $scope.list[i].orderItemList[j].marketPrice * $scope.list[i].orderItemList[j].num - $scope.list[i].orderItemList[j].favorablePrice * $scope.list[i].orderItemList[j].num;							
							$scope.order.skuId.push(i +"-"+ $scope.list[i].orderItemList[j].id)   //添加skuid到封装对象   
						 }						 
					 }
					$("#priceSum").html("实付:￥ "+prict.toFixed(2));
					$scope.order.money = prict.toFixed(2);  //添加总金额到封装对象
					$("#discount").html("￥ "+discount);
				};
				
				$scope.backOff = function(){
					history.go(-1);
				};
				
				$scope.placeOrder = function(){
					var url = "/shop/GenerateOrder";
					var data = JSON.stringify($scope.order);
					http.ajax.post(true,true,url,data,http.ajax.CONTENT_TYPE_2,function(result){		            	
		                $scope.$apply(function(){
		                    if(result.success){
		                    	var order = result.obj;
		                    	window.location = "/shop/payment?orderNo="+order.orderNo;
		                    	/* $scope.getOrderInfoNew(order.paymentType,order.orderNo,9,order.money); */
		                    }
		                })
			        });
				};
				
				
				/* $scope.getOrderInfoNew = function(payType,orderNumber,orderType,money){
					var url = "/shop/getOrderInfoNew";
					var data = {
							"payType":payType,
							"orderNumber":orderNumber,
							"orderType":orderType,
							"money":money
					};
					var data2 = JSON.stringify(data);
					http.ajax.post(true,true,url,data2,http.ajax.CONTENT_TYPE_2,function(result){		            	
		                $scope.$apply(function(){
		                    if(result.success){
		                    	
		                    }
		                })
			        });
				}; */
				
				$scope.showAddress = function(){					
					window.location = "/shop/showAddress";
				}
				
				
			})
		</script>
	</head>

	<body ng-app="myShop" ng-controller="detailsController1" ng-init="init()">
		<!--标题-->		
		<div class="mainbg main_title" style="position:relative;padding:0.5rem 0 0.5rem 0;border-bottom: 1px solid #f4f4f4;">
			<div>
				<div class="main_title_img" ng-click="backOff()" z-index = 20;><img src="/static/images/shop/img/icon_return.png" style="width: 0.8rem;height: 1rem;" /></div>
				<div class="main_title_text">全部商品</div>
				<div>&nbsp;</div>
			</div>
		</div>
		<!--end 标题-->		
		<!--联系人信息-->		
		<div class="div_contact" ng-repeat="addr in address"  ng-if="addr.selected == 1">  			
			<div class="contact_describe" >
				<label>联系人：{{addr.receiverName}}</label>
				<label>{{addr.contactNumber}}</label>
			</div>
			<div class="contact_address">
				<label><img src="/static/images/shop/img/map.png" style="width: 1rem;height: 1rem;bottom:0;"/>&nbsp;&nbsp;地址：{{addr.address}}&nbsp;{{street}}&nbsp;&nbsp;</label>
				<span style="vertical-align: text-bottom;" ng-click="showAddress()"><img src="/static/images/shop/img/right.png" style="width: 0.8rem;height: 1rem;"/></span>
			</div>					
		</div>
		<!--end 联系人信息-->		
		
		<!--信息-->
		
		<div class="product_bar" ng-repeat = "sku in list">
			<div class="product_bar_header">{{sku.seller}}</div>
			<div ng-repeat = "item in sku.orderItemList" style="width:100%;height:8rem;">
			
				<div class="product_bar_img" ng-repeat="pic in item.pictureUrls" ng-if="pic.masterGraph==0">				
					<img src="{{pic.pictureUrl}}" style="width: 4.5rem;height:4.5rem;"/>
				</div>
			
				<div class="product_bar_title_text" style="padding-top:1.5rem;height:74.99px" >
					<div>
						<label style="font-size:1.3rem;color:black;">{{item.goodsName}} </label>
						<label style="font-size:1.3rem;">{{item.attribute1+item.attribute2+item.attribute3}}</label>					
						<label style="float:right;font-size:1.3rem;">X{{item.num}}</label>
					</div>
					<div style="color: red;font-size:1.3rem;">￥{{item.favorablePrice}}</div>					
				</div>
				
			</div>			
			<div class="order_bar">
				<label>需要发票</label>
				<div class="inline field">
					<div class="ui toggle checkbox">
					    <input type="checkbox" ng-model="order.LoadingList[$index].invoice">					   
					    <label></label>
					</div>
				</div>
			</div>
			<div class="order_bar">
				<label>运费</label>
				<label style="color:red;" ng-value="order.LoadingList[$index].transportCosts" >0.00</label>				
			</div>
			<div class="order_bar">
				<label>备注</label>
				<label><input type="text" style="border:0;text-align: right;" placeholder="选填" ng-model="order.LoadingList[$index].orderNotes" /></label>	 		
			</div>
		</div>
		<!--end 信息-->
		
		<!--支付群体-->
		<div class="order_bar_div">
			<div class="order_bar">
				<label>支付方式</label>
				<label>在线支付&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="/static/images/shop/img/right.png" style="width: 0.6rem;height: 0.8rem;"/> --></label>
			</div>			
			
			<div class="order_bar">
				<label>优惠</label>
				<label style="color:red;" id="discount">0.00</label>
			</div>
						
			<!-- <div class="order_bar">
				<label>实付</label>
				<label style="color:red;">￥398.00</label>
			</div> -->
		</div>
		<!--end 支付群体-->
		
		<!--背景块-->
		<div style="position: relative;padding:1rem 0.5rem 1rem 0.5rem;height:5rem;"></div>
		<!--end 背景块-->
		
		<!--提交订单-->
		<div style="position: fixed;width: 100%;bottom: 0;">
			<div class="order_bar" style="float: left;width: 70%;">
				<label style="color: red;font-size:1.4rem;" id="priceSum">实付:￥ 0.00</label>
			</div>
			<div id="placeOrder" style="background-color: #44c660;color: white;padding:1rem 0.5rem 1rem 0.5rem;text-align: center;" ng-click="placeOrder()">提交订单</div>
		</div>
		<!--end 提交订单-->
	</body>

</html>
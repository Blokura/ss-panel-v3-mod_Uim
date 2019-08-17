<!DOCTYPE HTML> 
{if $config['appName'] == '跑路'}
<script>window.location.href='{$config["baseUrl"]}/paolu.html';</script>
{/if}
<html>
 <head>
  <meta charset="utf-8" />
  <title>萌SSR - 可能是最萌的SSR服务商</title>
  <meta name="renderer" content="webkit" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=1280" />
  <link rel="stylesheet" href="assets/css/i.css?20181010" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="MoeSSR" />
  <meta name="google" value="notranslate" />
   <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?f144d64db4601ea0d08042757ada9a7d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

 </head>
 <body>
   <script src="/assets/js/fuck.js"></script>
  <div id="stage">
   <article class="step-1">
    <div class="step-1-in">
     <div id="test">
      <header>
       <div class="layout">
        <h1>萌SSR</h1>
        <nav>
          {if $user->isLogin}
         <a href="./user" class="login-link">进入后台</a>
           <a href="./user/logout" class="login-link">退出登陆</a>
          {else}
         <a href="./auth/login" class="login-link">登录</a>
         <a href="./auth/register" class="login-link">注册</a>
          {/if}
        </nav>
       </div>
      </header>
      <h2><span class="line line-1">可能是<span class="moji-1">最萌</span>的</span> <span class="line line-2">SSR服务商</span></h2>
      <i class="bg"></i> 
      <i class="hr"></i>
      <div class="shell-box">
       <i class="shell-shadow"></i> 
       <i class="shell"><span></span></i>
      </div>
       {if $user->isLogin}
       <a class="link-reg" href="./user">进入后台</a>
       {else}
      <a class="link-reg" href="./auth/login">立即使用</a>
       {/if}
      <i class="light"></i>
     </div>
    </div>
   </article>
   <span class="tip tip-1">向下滚动</span>
   <article class="step-2">
    <div class="content">
     <h3 class="ui-h ui-h-1">技术优势</h3>
     <ul>
      <li class="feature-1">
       <div class="icon">
        <i></i>
        <big>1</big>
        <cite>Second</cite>
       </div><h4>秒级状态监控</h4><p>感受全节点心跳，性能瓶颈秒定位</p></li>
      <li class="feature-2">
       <div class="icon">
        <i></i>
        <big>1</big>
        <cite>Minute</cite>
       </div><h4>配置只需1分钟</h4><p>快速连接所需线，想连就连无压力</p></li>
      <li class="feature-3">
       <div class="icon">
        <i></i>
        <big>1</big>
        <cite>Hour</cite>
       </div><h4>工单小时级回复</h4><p>快速响应的客服服务是关键！</p></li>
      <li class="feature-4">
       <div class="icon">
        <i></i>
        <big>1</big>
        <cite>Gbps</cite>
       </div><h4>G口外网直连</h4><p>G口三网全直连，看片无需再等待</p></li>
      <li class="feature-5">
       <div class="icon">
        <i></i>
        <big></big>
        <cite>SmartQuota</cite>
       </div><h4>动态资源配额</h4><p>大户邻居不可怕，智能配额控制它</p></li>
      <li class="feature-6">
       <div class="icon">
        <i></i>
        <cite>API</cite>
       </div><h4>开放接口支持</h4><p>节点更新从此变得So Easy！</p></li>
     </ul>
    </div>
    <i class="after"></i>
   </article>
   <article class="step-3">
    <h3 class="ui-h ui-h-2">服务购买</h3>
     <div class="switch index-nav" id="switch">
     <div id="span-2" onclick="selectDatacenter(&quot;vip&quot;)" class="span-2 active">
      VIP套餐
     </div>
    </div>
    <ul>
     <li>
      <div class="head">
       <h4 id="price-1"><big>?元/月</big> <small>海外节点专用</small></h4>
      </div>
      <ul>
       <li><i>流量</i> <b>10GB</b></li>
       <li><i>连接数</i> <b>不限制</b></li>
       <li><i>速率</i> <b>不限制</b></li>
      </ul><a class="button" href="https://moessr.xyz/user/shop">购买</a></li>
     <li>
      <div class="head">
       <h4 id="price-2"><big>?元/月</big> <small>海外节点专用</small></h4>
      </div>
      <ul>
       <li><i>流量</i> <b>100GB</b></li>
       <li><i>连接数</i> <b>不限制</b></li>
       <li><i>速率</i> <b>不限制</b></li>
      </ul><a class="button" href="https://moessr.xyz/user/shop">购买</a></li>
     <li>
      <div class="head">
       <h4 id="price-3"><big>?元/月</big> <small>海外节点专用</small></h4>
      </div>
      <ul>
       <li><i>流量</i> <b>300GB</b></li>
       <li><i>连接数</i> <b>不限制</b></li>
       <li><i>速率</i> <b>不限制</b></li>
      </ul><a class="button" href="https://moessr.xyz/user/shop">购买</a></li>
     <li>
      <div class="head">
       <h4 id="price-4"><big>?元/月</big> <small>海外节点专用</small></h4>
      </div>
      <ul>
       <li><i>流量</i> <b>500GB</b></li>
       <li><i>连接数</i> <b>不限制</b></li>
       <li><i>速率</i> <b>不限制</b></li>
      </ul><a class="button" href="https://moessr.xyz/user/shop">购买</a></li>
    </ul>
    <div class="note layout" id="price-note">
     <p>※ 速度受到用户网速的限制与服务器在线用户数量限制，默认不限速，具体速率以实际为准</p>
    </div>
   </article>
   <article class="step-4">
    <div id="step4">
     <div class="content">
      <i></i>
      <h3 class="ui-h ui-h-3">24小时响应</h3>
      <div class="note layout">
       <p>节点多到爆炸，这个不能用就换一个</p>
       <p>总有一条线路适合您</p>
      </div>
      <a class="button" href="https://moessr.xyz/user/shop" target="_blank">VIP特权</a>
      <div class="note layout">
       <p class="op5">※ 不保证100%可用性</p>
      </div>
     </div>
     <i class="shell-2"></i>
    </div>
   </article>
   <footer class="step-5">
    <div class="htko">
     <p>一切的开端，梦的延续</p>
    </div>
    <div class="layout">
     <div class="l">
      <a href="https://moessr.xyz/" target="_blank">@萌SSR</a> 
      <a href="https://www.caixiaojing.com" target="_blank">Powered by Blokura</a> 
      <a href="https://moessr.xyz/staff">基于sspanel v3 mod 再次修改版</a>
     </div>
     <div class="r">
      <a href="http://www.miitbeian.gov.cn/" target="_blank">SSR站怎么可能会有备案号</a>
     </div>
    </div>
   </footer>
  </div>
  <script src="assets/css/c.js?20181010"></script>
 </body>
</html>
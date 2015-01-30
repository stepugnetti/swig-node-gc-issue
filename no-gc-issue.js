p=require('safe-module');
var i=0;
setInterval(function(){console.log(++i + new p.DummyObject());return;},10);


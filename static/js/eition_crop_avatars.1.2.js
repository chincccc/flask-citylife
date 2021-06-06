var _eition={
    el:"eition",
    elDom:null,
    width:300,
    height:300,
    _width:100,
    _height:100,
    _left:0,
    _top:0,
    thumbEl:null,
    _img:new Image(),
    _imgDataUrl:null,
    drag:null,
    isPC:function(){
        if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
          return false;
        }else{
          return true;
        }
    },
    start:function(){
   
        this.elDom= document.getElementById(this.el);
        this.elDom.className="eitionCss";
        this.drag=document.createElement("div");
        this.drag.className="drag";
        this.elDom.appendChild(this.drag);
        var canvas=document.createElement("canvas");
        var c=canvas.getContext("2d");
        if(this.thumbEl!=null){
        var thumb=document.getElementById(this.thumbEl);
        }
        canvas.width=this._width;
        canvas.height=this._height;
        this.elDom.style.width=this.width+"px";
        this.elDom.style.height=this.height+"px";
        this.drag.style.width=this._width+"px";
        this.drag.style.height=this._height+"px";
        
        if(this.isPC()){
                this.drag.onmousedown = function(e){
                var e = e || window.event ; 
                var diffX = e.clientX - _eition.drag.offsetLeft; 
                var diffY = e.clientY - _eition.drag.offsetTop;  
                if(typeof _eition.drag.setCapture!='undefined'){ _eition.drag.setCapture(); }  
                 document.onmousemove = function(e) {var e = e || window.event ; _eition.rePosition(e,diffX,diffY,canvas);};  
                 document.onmouseup = function(e) {this.onmousemove = null;this.onmouseup = null;if(typeof _eition.drag.releaseCapture!='undefined'){_eition.drag.releaseCapture();}};  
            };
        }
        else{
                this.drag.addEventListener("touchstart",function(e){
                  var e = e.touches[0]; 
                  var diffX = e.clientX - _eition.drag.offsetLeft; 
                  var diffY = e.clientY - _eition.drag.offsetTop;  
                  if(typeof _eition.drag.setCapture!='undefined'){ _eition.drag.setCapture();} 
                      _eition.drag.addEventListener("touchmove",function(e){var e = e.touches[0]; _eition.rePosition(e,diffX,diffY,canvas);},false);
                      _eition.drag.addEventListener("touchend",function(e){this.touchmove = null;this.touchstart = null;if(typeof _eition.drag.releaseCapture!='undefined'){_eition.drag.releaseCapture();}});
                },false);
        }
    },
    rePosition:function(e,diffX,diffY,canvas){
       _eition._left=e.clientX-diffX;
        _eition._top=e.clientY-diffY;  
        if(_eition._left<0){_eition._left=0;}else if(_eition._left >_eition.width - _eition.drag.offsetWidth){_eition._left = _eition.width - _eition.drag.offsetWidth;}  
        if(_eition._top<0){ _eition._top=0;}else if(_eition._top >_eition.height - _eition.drag.offsetHeight){_eition._top = _eition.height - _eition.drag.offsetHeight;}
        _eition.drag.style.left = _eition._left+"px";_eition.drag.style.top = _eition._top+"px";
        canvas.height=canvas.height;
        var rule=(_eition._img.width/_eition.width);
        var startLeft=_eition._left*rule;
        var startTop=_eition._top*rule;
        var overWidth=_eition._width*rule;
        var overHeight=_eition._height*rule;
        canvas.getContext("2d").drawImage(_eition._img,startLeft,startTop,overWidth,overHeight,0,0,_eition._width,_eition._height);
        _eition._imgDataUrl=canvas.toDataURL("image/png");
        if(thumb!=null){
            thumb.src=_eition._imgDataUrl;
        } 
    },
    openFile:function (fileDom){
        if(fileDom.files[0]){
        if (window.FileReader) {
            var reader = new FileReader();
            var file = fileDom.files[0];
            var imageType = /^image\//;
            if (!imageType.test(file.type)) {
                alert("请选择图片作为头像。也不是说其他的不行，会变成乱码头像！");
                return;
            }
            reader.onload = function(e) {
                _eition.elDom.style.backgroundImage="url('"+e.target.result+"')"; 
                _eition._img.src=e.target.result;
            };
                reader.readAsDataURL(file);
             }
             else {
              alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
            }
        }
    },
    result:function(){
        return this._imgDataUrl;
    }
};


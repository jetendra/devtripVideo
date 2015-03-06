/**
*
Copyright (c) 2014-15 Kavindra Dubey - kavindra.dubey@gmail.com [personal site - devtrip.com]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name(s) of the above copyright holders shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization.

The end-user documentation included with the redistribution, if any, must include the following acknowledgment: "This product includes software developed by The DevtripVideo Project, (http://www.devtrip.com/) and its contributors", in the same place and form as other third-party acknowledgments. Alternately, this acknowledgment may appear in the software itself, in the same form and location as other such third-party acknowledgments.
*
**/

var devtripVideo = function(){

	var assetsPath = "";
	
	function getSupport(video,str)
	{
		var support = video.canPlayType(str);//"probably" if codec is also passed.
		if (support == "maybe") {
			return str;
		} else if (support == "") {
			return "";
		}
	}; 

	function getExtension(video){
		var mp4 = 'video/mp4';ogg = 'video/ogg';webm = 'video/webm';
		var extension = '.dt';
		if(getSupport(video,mp4) == mp4){
			extension = '.mp4';
		} else {
			if(getSupport(video,webm) == webm){
				extension = '.webm';
			} else {
				if(getSupport(video,ogg) == ogg){
					extension = '.ogg';
				}
			}
		}
		
		return extension;
	};

	function getMimeType(video){
		var mp4 = 'video/mp4';ogg = 'video/ogg';webm = 'video/webm';
		var MIMEType = 'video/dt';
		if(getSupport(video,mp4) == mp4){
			MIMEType = mp4;
		} else {
			if(getSupport(video,webm) == webm){
				MIMEType = webm;
			} else {
				if(getSupport(video,ogg) == ogg){
					MIMEType = ogg;
				}
			}
		}
		
		return MIMEType;
	};

	function addEvent( element, event, callback, capture) {
		if( window.addEventListener ) {
			element.addEventListener( event, callback, capture );
		} else if( document.attachEvent ) {
			element.attachEvent( 'on' + event, callback );
		} else {
			element[ 'on' + event ] = callback;
		}
	} ;

	function removeEvent( element, event, callback, capture) {
		if( window.removeEventListener ) {
			element.removeEventListener( event, callback, capture);
		} else if( document.detachEvent ) {
			element.detachEvent ( 'on' + event, callback );
		} else {
			element[ 'on' + event ] = null;
		}
	} ;


	function errorHandler(e) {
		switch (e.target.error.code) {
		 case e.target.error.MEDIA_ERR_ABORTED:
		   alert('You aborted the video playback.');
		   break;
		 case e.target.error.MEDIA_ERR_NETWORK:
		   alert('A network error caused the video download to fail part-way.');
		   break;
		 case e.target.error.MEDIA_ERR_DECODE:
		   alert('The video playback was aborted due to a corruption problem or because the video used features your browser did not support.');
		   break;
		 case e.target.error.MEDIA_ERR_SRC_NOT_SUPPORTED:
		   alert('The video could not be loaded, either because the server or network failed or because the format is not supported.');
		   break;
		 default:
		   alert('An unknown error occurred.');
		   break;
		}
		cllback_errorHandler.call();
	};

	function addEvents(DT_id){
		
		var videoElement = document.getElementById(DT_id);
		addEvent(videoElement,'error',errorHandler, true); //video error with message 
	};

	function removeEvents(DT_id){
		var videoElement = document.getElementById(DT_id);
		removeEvent(videoElement,'error',errorHandler, true); //video error with message 
	};
	
	function createHTML5Player(params) {
		var container = document.getElementById(params.containerId);
		var video = document.createElement('video');
		video.id = 'videoplayer';
		video.width = params.width;
		video.height = params.height;
		video.src = assetsPath + params.video + getExtension(video);
		video.type = getMimeType(video);
		video.autoplay = params.autoplay;
		video.controls = true;
		video.muted = true;
		video.poster = assetsPath + params.videoImage;
		container.appendChild(video);
		addEvents('videoplayer');
		addCallbackFunction('videoplayer');
	};
	
	function loadScript(url, callback, params){
		var script = document.createElement("script")
		script.type = "text/javascript";
		script.id = "swfLoader";
		if (script.readyState){  //IE
			script.onreadystatechange = function(){
				if (script.readyState == "loaded" ||
						script.readyState == "complete"){
					script.onreadystatechange = null;
					callback();
				}
			};
		} else {  //Others
			script.onload = function(){
				callback();
			};
		}
		script.src = url;
		document.getElementsByTagName("head")[0].appendChild(script);
	};
	
	function createFlashPlayer(params) {
		loadScript( assetsPath + "swfobject.js" , function(){
			var par = new Object();
			par.DT_width = params.width,par.DT_height = params.height,par.DT_video = params.video + '.mp4',par.DT_autoplay = params.autoplay,par.DT_videoImage = params.videoImage,par.DT_assetsPath = assetsPath;
			new swfobject().embedSWF( assetsPath + "player.swf", params.containerId, params.width, params.height,"9.0.0",assetsPath + "expressInstall.swf",par);
			});
	};
	
	function supports_video() {
	  return document.createElement('video').canPlayType;
	};
	
	function init(params) {
		if(supports_video()){
			createHTML5Player(params);
		} else {
			createFlashPlayer(params);
		}
	};
	
	function dispose() {
		removeEvents('videoplayer');
	};
	
	function setPath(str){
		assetsPath = str;
	};
	
	// expose publicaly available methods
	return {
		init 							: init,
		dispose 						: dispose,
		setPath 						: setPath
	}; 
};
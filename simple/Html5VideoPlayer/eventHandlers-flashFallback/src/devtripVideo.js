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

	var assetsPath = "assets/",
	cllback_errorHandler = function(){},
	cllback_loadedmetadataHandler = function(){},
	cllback_timeupdateHandler = function(){},
	cllback_pauseHandler = function(){},
	cllback_playingHandler = function(){},
	cllback_volumechangeHandler = function(){},
	cllback_loadstartHandler = function(){},
	cllback_loadeddataHandler = function(){},
	cllback_endedHandler = function(){},
	cllback_emptiedHandler = function(){},
	cllback_stalledHandler = function(){},
	cllback_waitingHandler = function(){},
	cllback_progressHandler = function(){},
	cllback_durationchangeHandler = function(){},
	cllback_canplaythroughHandler = function(){};
	
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

	// a simple facade that masks the various browser-specific methods
	function addEvent( element, event, callback, capture) {
		if( window.addEventListener ) {
			element.addEventListener( event, callback, capture );
		} else if( document.attachEvent ) {
			element.attachEvent( 'on' + event, callback );
		} else {
			element[ 'on' + event ] = callback;
		}
	} ;

	// a simple facade that masks the various browser-specific methods
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

	function loadedmetadataHandler(e){
		cllback_loadedmetadataHandler.call();
	};

	function timeupdateHandler(e){
		cllback_timeupdateHandler.call();
	};

	function pauseHandler(e){
		cllback_pauseHandler.call();
	};

	function playingHandler(e){
		cllback_playingHandler.call();
	};
	

	function volumechangeHandler(e){
		cllback_volumechangeHandler.call();
	};

	function loadstartHandler(e){
		cllback_loadstartHandler.call();
	};

	function loadeddataHandler(e){
		cllback_loadeddataHandler.call();
	};

	function endedHandler(e){
		cllback_endedHandler.call();
	};

	function emptiedHandler(e){
		cllback_emptiedHandler.call();
	};

	function stalledHandler(e){
		cllback_stalledHandler.call();
	};

	function waitingHandler(e){
		cllback_waitingHandler.call();
	};

	function progressHandler(e){
		cllback_progressHandler.call();
	};

	function durationchangeHandler(e){
		cllback_durationchangeHandler.call();
	};

	function canplaythroughHandler(e){
		cllback_canplaythroughHandler.call();
	};

	function addEvents(DT_id){
		
		var videoElement = document.getElementById(DT_id);
		addEvent(videoElement,'error',errorHandler, true); //video error with message 
		addEvent(videoElement,"loadedmetadata", loadedmetadataHandler, false);//Metadata loaded
		addEvent(videoElement,"timeupdate", timeupdateHandler,false);//Time updated
		addEvent(videoElement,"pause", pauseHandler,false);//video paused
		addEvent(videoElement,'playing',playingHandler,false);//playing video
		addEvent(videoElement,"volumechange", volumechangeHandler,false);//Volume Changed
		addEvent(videoElement,"loadstart", loadstartHandler,false);//Started
		addEvent(videoElement,"loadeddata", loadeddataHandler,false);//Data was loaded
		addEvent(videoElement,"ended", endedHandler,false);//Playback ended
		addEvent(videoElement,"emptied", emptiedHandler,false);//Video reset
		addEvent(videoElement,"stalled", stalledHandler,false);//Download was stalled
		addEvent(videoElement,"waiting", waitingHandler,false);//Player waiting for content
		addEvent(videoElement,"progress", progressHandler,false);//progress status
		addEvent(videoElement,"durationchange", durationchangeHandler,false);//Duration has changed
		addEvent(videoElement,"canplaythrough", canplaythroughHandler,false);//Ready to play whole video
	};

	function removeEvents(DT_id){
		var videoElement = document.getElementById(DT_id);
		removeEvent(videoElement,'error',errorHandler, true); //video error with message 
		removeEvent(videoElement,"loadedmetadata", loadedmetadataHandler, false);//Metadata loaded
		removeEvent(videoElement,"timeupdate", timeupdateHandler,false);//Time updated
		removeEvent(videoElement,"pause", pauseHandler,false);//video paused
		removeEvent(videoElement,'playing',playingHandler,false);//playing video
		removeEvent(videoElement,"volumechange", volumechangeHandler,false);//Volume Changed
		removeEvent(videoElement,"loadstart", loadstartHandler,false);//Started
		removeEvent(videoElement,"loadeddata", loadeddataHandler,false);//Data was loaded
		removeEvent(videoElement,"ended", endedHandler,false);//Playback ended
		removeEvent(videoElement,"emptied", emptiedHandler,false);//Video reset
		removeEvent(videoElement,"stalled", stalledHandler,false);//Download was stalled
		removeEvent(videoElement,"waiting", waitingHandler,false);//Player waiting for content
		removeEvent(videoElement,"progress", progressHandler,false);//progress status
		removeEvent(videoElement,"durationchange", durationchangeHandler,false);//Duration has changed
		removeEvent(videoElement,"canplaythrough", canplaythroughHandler,false);//Ready to play whole video
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
	}
	
	// expose publicaly available methods
	return {
		// Have used revealing module pattern, with the following using ":"
		init 							: init,
		dispose 						: dispose,
		setPath 						: setPath,
		// Have used facade pattern, where we mask the internals so no one has direct access by doing this:
		cllback_errorHandler 			: function(fun){cllback_errorHandler = fun;},
		cllback_loadedmetadataHandler 	: function(fun){cllback_loadedmetadataHandler = fun;},
		cllback_timeupdateHandler 		: function(fun){cllback_timeupdateHandler = fun;},
		cllback_pauseHandler 			: function(fun){cllback_pauseHandler = fun;},
		cllback_playingHandler 			: function(fun){cllback_playingHandler = fun;},
		cllback_volumechangeHandler 	: function(fun){cllback_volumechangeHandler = fun;},
		cllback_loadstartHandler 		: function(fun){cllback_loadstartHandler = fun;},
		cllback_loadeddataHandler 		: function(fun){cllback_loadeddataHandler = fun;},
		cllback_endedHandler 			: function(fun){cllback_endedHandler = fun;},
		cllback_emptiedHandler 			: function(fun){cllback_emptiedHandler = fun;},
		cllback_stalledHandler 			: function(fun){cllback_stalledHandler = fun;},
		cllback_waitingHandler 			: function(fun){cllback_waitingHandler = fun;},
		cllback_progressHandler 		: function(fun){cllback_progressHandler = fun;},
		cllback_durationchangeHandler 	: function(fun){cllback_durationchangeHandler = fun;},
		cllback_canplaythroughHandler 	: function(fun){cllback_canplaythroughHandler = fun;}
	}; 
};
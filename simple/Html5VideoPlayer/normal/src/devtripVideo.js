var assetsPath = "assets/";

function getSupport(video,str)
{
	var support = video.canPlayType(str);
	if (support == "maybe") {
		return str;
	} else if (support == "") {
		return "";
	}
}

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
}

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
}

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
}

// a simple facade that masks the various browser-specific methods
function addEvent( element, event, callback ) {
	if( window.addEventListener ) {
		element.addEventListener( event, callback, false );
	} else if( document.attachEvent ) {
		element.attachEvent( 'on' + event, callback );
	} else {
		element[ 'on' + event ] = callback;
	}
} 

// a simple facade that masks the various browser-specific methods
function removeEvent( element, event, callback ) {
	if( window.removeEventListener ) {
		element.removeEventListener( event, callback, false );
	} else if( document.detachEvent ) {
		element.detachEvent ( 'on' + event, callback );
	} else {
		element[ 'on' + event ] = null;
	}
} 

function addEvents(DT_id){
	
	var videoElement = document.getElementById(DT_id);
	addEvent(videoElement,'error',errorHandler);
	//videoElement.addEventListener('error', errorHandler, true); //video error with message 
}

function removeEvents(DT_id){
	var videoElement = document.getElementById(DT_id);
	removeEvent(videoElement,'error',errorHandler)
	//videoElement.removeEventListener('error', errorHandler, true); //video error with message 
}

function init(){
	var container = document.getElementById(DT_containerId);
	var video = document.createElement('video');
	video.id = DT_id;
	video.width = DT_width;
	video.height = DT_height;
	video.src = assetsPath + DT_video + getExtension(video);
	video.type = getMimeType(video);
	video.autoplay = DT_autoplay;
	video.controls = true;
	video.muted = true;
	video.poster = assetsPath + DT_videoImage;
	container.appendChild(video);
	addEvents(DT_id);
}

function dispose(DT_id){
	removeEvents(DT_id);
}
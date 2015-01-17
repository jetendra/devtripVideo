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

import src.com.utils.base.uiBase;
import src.com.vo.devtripVo;

class src.com.ui.videoplayer extends uiBase {
	
	private static var _instance : videoplayer = null;
	private static var _conVideo : NetConnection = null;
	private static var _netStrm : NetStream = null;
	private static var _data : Object;
	private static var _ui : MovieClip;
	private var _isPlaying : Boolean;

	public function videoplayer() {
		if (_instance != null) throw Error('Singelton error');
		_instance = this;
		init();
	}
	
	public static function get instance() : videoplayer {
		if(_instance == null){
			_instance = new videoplayer();
		}
		return _instance;
	}
	
	private function initBaseProperties() : Void {
		super.initBaseProperties();
		_ui = devtripVo.instance.ui.videoplayer;
		_data = devtripVo.instance.params;
		
		_ui.attachMovie("videocontrols","videocontrols",2,{_x : this._x, _y : this._y + this._height - 36 * devtripVo.instance.resizeFactor});
		devtripVo.instance.ui.videoplayer.attached = true;
		addElement(devtripVo.instance.ui.videoplayer);
	}
	
	private function loadHandler() : Void {
		super.loadHandler();
		resizeElements();
		loadPoster();
		setVideo();
	}
	
	private function unloadHandler() : Void {
		super.unloadHandler();
	}
	
	private function resizeElements():Void{
		var _resizeFactor : Object = devtripVo.instance.resizeFactor;
		_ui.video._xscale =  _resizeFactor.widthRatio;
		_ui.video._yscale = _resizeFactor.heightRatio;
		_ui.videocontrols._xscale =  _resizeFactor.widthRatio;
		_ui.videocontrols._yscale =  _resizeFactor.heightRatio;
		_ui.poster._xscale =  _resizeFactor.widthRatio;
		_ui.poster._yscale =  _resizeFactor.heightRatio;
	}
	
	private function loadPoster() : Void {
		_ui.poster.loadMovie( _data.assetsPath + _data.videoImage );
		_ui.poster.loadedmovie = true;
		addElement(_ui.poster);
	}
	
	public function hidePoster() : Void {
		_ui.poster._visible = false;
	}
	
	public function showPoster() : Void {
		_ui.poster._visible = false;
	}
	
	private function setVideo():Void {
		//trace(file + "    file")
		if (!_conVideo) {
			_conVideo = new NetConnection();
			_conVideo.connect(null);
		}
		if (!_netStrm) {
			_netStrm = new NetStream(_conVideo);
			_netStrm.setBufferTime(3);
			_netStrm.onStatus = function(info) {
				trace(info.code)
				switch(info.code){
					case "NetStream.Buffer.Empty" :
						// BUFFER EMPTY - Data is not being received quickly enough to fill the buffer. 
						// Data flow will be interrupted until the buffer refills, at which time a NetStream.Buffer.Full 
						// message will be sent and the stream will begin playing again.
						break;
					case "NetStream.Buffer.Full":
						// BUFFER FULL - The buffer is full and the stream will begin playing.
						break;
					case "NetStream.Buffer.Flush":
						//Data has finished streaming, and the remaining buffer will be emptied.
						break;
					case "NetStream.Play.Start":
						// PLAYBACK STARTED - Playback has started.
						break;
					case "NetStream.Play.Stop":
						// PLAYBACK STOPPED - Playback has stopped.
						this._isPlaying = false;
						//
						//_netStrm.resume();
						break;
					case "NetStream.Play.StreamNotFound":
						//The FLV passed to the play() method can't be found.
						break;
					case "NetStream.Seek.InvalidTime":
						// For video downloaded with progressive download, the user has tried to seek 
						// or play past the end of the video data that has downloaded thus far, 
						// or past the end of the video once the entire file has downloaded. 
						// The message.details property contains a time code that indicates the 
						// last valid position to which the user can seek.
						break;
					case "NetStream.Seek.Notify":
						// 	The seek operation is complete.
						break;
				}
			}
		}
		_ui.video.attachVideo(_netStrm);
	}
	
	public function playVideo(): Void {
		this._isPlaying = true;
		_netStrm.play(devtripVo.instance.params.video);
	}
	
	public function pauseVideo(){
		if(!this._isPlaying)_netStrm.seek(0);
		_netStrm.pause();
	}
	
	public function get isPlaying():Boolean{
		return _isPlaying;
	}
	
}
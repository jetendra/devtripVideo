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

package src.com.ui {
	
	import src.com.utils.base.uiBase;
	import src.com.vo.devtripVo;
	import src.com.ui.videocontrols;
	import flash.net.NetConnection;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetStream;
	import flash.events.AsyncErrorEvent;
	import flash.media.Video;
	import flash.media.SoundTransform;
	import flash.utils.*;

	
	public class videoplayer extends uiBase {
		
		private static var _instance : videoplayer = null;
		private var _videocontrols : videocontrols;
		private var _conVideo : NetConnection = null;
		private var _netStrm : NetStream = null;
		private var _client : Object;
		public var video : Video;
		
		private var _loadedInterval:uint;
		private var _videoVolumeTransform : SoundTransform;
		
		/**
		 * Constructor: videoplayer
		 * @Constructor Initializes the object.
		 * */
		public function videoplayer() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class]
		 * */
		public static function get instance() : videoplayer {
			if(_instance == null){
				_instance = new videoplayer();
			}
			return _instance;
		}
		
		/**
		 * @Derived from base
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function initBaseProperties() : void {
			attachVideoControl();
		}
		
		/**
		 * @Derived from base
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function loadHandler() : void {
			resizeElements();
			loadPoster();
			setVideo();
		}
		
		/**
		 * @private attach Video Controls with player
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		private function attachVideoControl() : void {
			_videocontrols = videocontrols.instance;
			_videocontrols.y = devtripVo.instance.params.height;
			addElement(_videocontrols);
		}
		
		/**
		 * @Private resize element handler
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function resizeElements():void{
			/*var _resizeFactor : Object = devtripVo.instance.resizeFactor;
			_ui.video._xscale =  _resizeFactor.widthRatio;
			_ui.video._yscale = _resizeFactor.heightRatio;
			_ui.videocontrols._xscale =  _resizeFactor.widthRatio;
			_ui.videocontrols._yscale =  _resizeFactor.heightRatio;
			_ui.poster._xscale =  _resizeFactor.widthRatio;
			_ui.poster._yscale =  _resizeFactor.heightRatio;*/
		}
		
		/**
		 * @Private load poster handler
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function loadPoster() : void {
			//this.poster.loadMovie( _data.assetsPath +"/"+_data.videoImage );
			//_ui.poster.loadedmovie = true;
			//addElement(_ui.poster);
		}
		
		/**
		 * @Public hide poster handler
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function hidePoster() : void {
			//this.poster.visible = false;
		}
		
		/**
		 * @Private set video stream and connection
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function setVideo():void {
			if (!_conVideo) {
				_conVideo = new NetConnection();
				_conVideo.addEventListener(NetStatusEvent.NET_STATUS, connectionStatusHandler);
				_conVideo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler);
				_conVideo.connect(null);
			}
		}
		
		/**
		 * @Private connection status handler
		 * @param - [NetStatusEvent] 
		 * @return - [void]
		 * */
		private function connectionStatusHandler(evt : NetStatusEvent) : void {
			switch (evt.info.code) {
                case "NetConnection.Connect.Success": //status
                    connectStream();
                    break;
                case "NetConnection.Connect.Closed": //status
					//The connection was closed successfully.
					break;
				case "NetConnection.Connect.Failed"://error
					//The connection attempt failed.
					break;
				case "NetConnection.Connect.IdleTimeout": //error
					//Flash Media Server disconnected the client because the client was idle longer than the configured value for <MaxIdleTime>. On Flash Media Server, <AutoCloseIdleClients> is disabled by default. When enabled, the default timeout value is 3600 seconds (1 hour). 
					break;
				case "NetConnection.Connect.InvalidApp": //error
					//The application name specified in the call to NetConnection.connect() is invalid.
					break;
				case "NetConnection.Connect.NetworkChange": //status
					//Flash Player has detected a network change, for example, a dropped wireless connection, a successful wireless connection,or a network cable loss.
					//Use this event to check for a network interface change. Don't use this event to implement your NetConnection reconnect logic. Use "NetConnection.Connect.Closed" to implement your NetConnection reconnect logic.
					break;
				case "NetConnection.Connect.Rejected": //error
					//The connection attempt did not have permission to access the application.
					break;
            }
		}
		
		/**
		 * @Private security error handler
		 * @param - [SecurityErrorEvent] 
		 * @return - [void]
		 * */
		private function securityHandler(evt : SecurityErrorEvent) : void {
			trace("securityErrorHandler: " + evt);
		}
		
		/**
		 * @Private connect stream
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function connectStream() : void {
			if (_netStrm)_netStrm.close();
			_videoVolumeTransform = new SoundTransform();
			_netStrm = new NetStream(_conVideo);
            _client = new Object();
            _client.onMetaData = metaDataHandler;
            _netStrm.client = _client;
			_netStrm.addEventListener(NetStatusEvent.NET_STATUS, streamStatusHandler);
            _netStrm.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
           	video.attachNetStream(_netStrm);
		}
		
		/**
		 * @Private stream status handler
		 * @param - [NetStatusEvent] 
		 * @return - [void]
		 * */
		private function streamStatusHandler(evt : NetStatusEvent) : void {
			switch (evt.info.code) {
				case "NetStream.Buffer.Empty":
				 	_videocontrols.setPlaySpinner();
					//Flash Player is not receiving data quickly enough to fill the buffer. Data flow is interrupted until the buffer refills, at which time a NetStream.Buffer.Full message is sent and the stream begins playing again.
					break;
				case "NetStream.Buffer.Full": //status
					_videocontrols.setPauseSpinner();
					//The buffer is full and the stream begins playing.
					break;
				case "NetStream.Buffer.Flush": //status
					//Data has finished streaming, and the remaining buffer is emptied. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Connect.Closed": //status
					//The P2P connection was closed successfully. The info.stream property indicates which stream has closed. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Connect.Failed": //status
					//The P2P connection attempt failed. The info.stream property indicates which stream has failed. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Connect.Rejected": //status
					//The P2P connection attempt did not have permission to access the other peer. The info.stream property indicates which stream was rejected. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Connect.Success": //status
					//The P2P connection attempt succeeded. The info.stream property indicates which stream has succeeded. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.DRM.UpdateNeeded": //status
					//A NetStream object is attempting to play protected content, but the required Flash Access module is either not present, not permitted by the effective content policy, or not compatible with the current player. To update the module or player, use the update() method of flash.system.SystemUpdater. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Failed": //status
					//(Flash Media Server) An error has occurred for a reason other than those listed in other event codes. 
					break;
				case "NetStream.MulticastStream.Reset": //status
					//A multicast subscription has changed focus to a different stream published with the same name in the same group. Local overrides of multicast stream parameters are lost. Reapply the local overrides or the new stream's default parameters will be used.
					break;
				case "NetStream.Pause.Notify": //status
					//The stream is paused.
					break;
				case "NetStream.Play.Failed": //status
					//An error has occurred in playback for a reason other than those listed elsewhere in this table, such as the subscriber not having read access. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Play.FileStructureInvalid": //status
					//(AIR and Flash Player 9.0.115.0) The application detects an invalid file structure and will not try to play this type of file. Note: Not supported in AIR 3.0 for iOS. 
					break;
				case "NetStream.Play.InsufficientBW": //warning
					//(Flash Media Server) The client does not have sufficient bandwidth to play the data at normal speed. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Play.NoSupportedTrackFound": //status
					//(AIR and Flash Player 9.0.115.0) The application does not detect any supported tracks (video, audio or data) and will not try to play the file. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Play.PublishNotify": //status
					//he initial publish to a stream is sent to all subscribers.
					break;
				case "NetStream.Play.Reset": //status
					//Caused by a play list reset. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Play.Start": //status
					//Playback has started.
					break;
				case "NetStream.Play.Stop": //status
					//Playback has stopped.
					devtripVo.instance.isPlaying = false;
					clearInterval(_loadedInterval);
					_loadedInterval = 0;
					_videocontrols._playBtn.gotoAndStop(1);
					_videocontrols.setPauseSpinner();
					break;
				case "NetStream.Play.StreamNotFound": //error
					//The file passed to the NetStream.play() method can't be found.
					break;
				case "NetStream.Play.Transition": //status
					//(Flash Media Server 3.5) The server received the command to transition to another stream as a result of bitrate stream switching. This code indicates a success status event for the NetStream.play2() call to initiate a stream switch. If the switch does not succeed, the server sends a NetStream.Play.Failed event instead. When the stream switch occurs, an onPlayStatus event with a code of "NetStream.Play.TransitionComplete" is dispatched. For Flash Player 10 and later. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Play.UnpublishNotify": //status
					//An unpublish from a stream is sent to all subscribers.
					break;
				case "NetStream.Seek.Failed": //status
					//The seek fails, which happens if the stream is not seekable.
					break;
				case "NetStream.Seek.InvalidTime": //status
					//For video downloaded progressively, the user has tried to seek or play past the end of the video data that has downloaded thus far, or past the end of the video once the entire file has downloaded. The info.details property of the event object contains a time code that indicates the last valid position to which the user can seek.
					break;
				case "NetStream.Seek.Notify": //status
					//The seek operation is complete.
					//Sent when NetStream.seek() is called on a stream in AS3 NetStream Data Generation Mode. The info object is extended to include info.seekPoint which is the same value passed to NetStream.seek().
					break;
				case "NetStream.Seek.Failed": //status
					//The seek fails, which happens if the stream is not seekable.
					break;
				case "NetStream.Step.Notify": //status
					//The step operation is complete. Note: Not supported in AIR 3.0 for iOS.
					break;
				case "NetStream.Unpause.Notify": //status
					//The stream is resumed..
					break;
				case "NetStream.Unpublish.Success": //status
					//The unpublish operation was successfuul.
					break;
				case "NetStream.Video.DimensionChange": //status
					//The video dimensions are available or have changed. Use the Video or StageVideo videoWidth/videoHeight property to query the new video dimensions. New in Flash Player 11.4/AIR 3.4.
					break;
				case "NetStream.Publish.BadName": //error
					//Attempt to publish a stream which is already being published by someone else.
					break;
				case "NetStream.Publish.Idle": //status
					//The publisher of the stream is idle and not transmitting data.
					break;
				case "NetStream.Publish.Start": //status
					//Publish was successful.
					break;
				case "NetStream.Record.AlreadyExists": //status
					//The stream being recorded maps to a file that is already being recorded to by another stream. This can happen due to misconfigured virtual directories.
					break;
				case "NetStream.Record.Failed": //status
					//An attempt to record a stream failed.
					break;
				case "NetStream.Record.NoAccess": //status
					//Attempt to record a stream that is still playing or the client has no access right.
					break;
				case "NetStream.Record.Start": //status
					//Recording has started.
					break;
				case "etStream.Record.Stop": //status
					//	Recording stopped.
					break;
				case "NetStream.SecondScreen.Start": //status
					//Sent when the PlayTo session starts. The description field attached to this event will contain the name of the device that will be getting the video. Applies only to Windows 8.1, IE11, modern mode.
					break;
				case "NetStream.SecondScreen.Stop": //status
					//Sent when the PlayTo session ends. Applies only to Windows 8.1, IE11, modern mode.
					break;
			}
		}
		
		/**
		 * @Private asynch error handler
		 * @param - [AsyncErrorEvent] 
		 * @return - [Void]
		 * */
		private function asyncErrorHandler(evt : AsyncErrorEvent) : void {
			
		}
		
		/**
		 * @Private meta data handler
		 * @param - [Object] 
		 * @return - [Void]
		 * */
		private function metaDataHandler(infoObject:Object) : void {
			devtripVo.instance.infoObject = infoObject;
			for (var propName:String in infoObject) {
				trace(propName + " = " + infoObject[propName]);
			}
        }
		
		/**
		 * @Public play video 
		 * @param - [NA] 
		 * @return - [Void]
		 * */
		public function playVideo() : void {
			if(devtripVo.instance.isPlaying){
				_netStrm.resume();
			} else {
				devtripVo.instance.isPlaying = true;
				_loadedInterval = setInterval(checkBytesLoaded,100);
				_netStrm.play(devtripVo.instance.params.video.toString());
			}
		}
		
		/**
		 * @Public pause video
		 * @param - [NA] 
		 * @return - [Void]
		 * */
		public function pauseVideo(str : String) : void{
			if(!devtripVo.instance.isPlaying)_netStrm.seek(0);
			if(str == "play"){
				_netStrm.pause();
			}else{
				_netStrm.resume();
			}
			if(_loadedInterval == 0) {
				_loadedInterval = setInterval(checkBytesLoaded,100);
			} else {
				clearInterval(_loadedInterval);
				_loadedInterval = 0;
			}
		}
		
		public function setVolume(l:Number) : void {
			_videoVolumeTransform.volume = Math.floor(l);
			if(_netStrm)_netStrm.soundTransform = _videoVolumeTransform;
		}
		
		/**
		 * @Public set stream time
		 * @param - [Number] 
		 * @return - [Void]
		 * */
		public function setSteramTime(l:Number) : void {
			if(devtripVo.instance.isPlaying && _netStrm)_netStrm.seek(l / 100 * devtripVo.instance.infoObject.duration);
		}
		
		/**
		 * @Private check bytes loaded and set seek slider
		 * @param - [NA] 
		 * @return - [Void]
		 * */
		private function checkBytesLoaded() : void {
			_videocontrols._progressSlider.setSeek(_netStrm.time / devtripVo.instance.infoObject.duration * 100);
		}
	}
}

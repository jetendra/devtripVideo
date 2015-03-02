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

package src.com.utils {
 
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	public class imageLoader
	{	
		private static var _instance : imageLoader;
		private var _imgContainer : MovieClip;
		private var loader : Loader;
		private var content:DisplayObject;
				
		/**
		 * Constructor: dataLoader [Singelton]
		 * @Constructor [Initializes the object.]
		 * */
		public function imageLoader()
		{
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class]
		 * */
		public static function get instance() : imageLoader {
			if(_instance == null){
				_instance = new imageLoader();
			}
			return _instance;
		}
		
		/**
		 * @Public [loadImage]
		 * @param - [imgUrl and imgContainer] 
		 * @return - [void]
		 * */
		public function loadImage(imgUrl : String, imgContainer :MovieClip):void
		{
			_imgContainer = imgContainer;
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.OPEN,openEvent);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressEvent);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			var URL:String = imgUrl;
			loader.load(new URLRequest(URL));
		}
		
		/**
		 * @Private [removeListeners]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function removeListeners():void
		{
			loader.contentLoaderInfo.removeEventListener(Event.OPEN,openEvent);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressEvent);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
		}
		
		/**
		 * @Private [errorHandler]
		 * @param - [IOErrorEvent] 
		 * @return - [void]
		 * */
		private function errorHandler(evt:IOErrorEvent):void
		{
			removeListeners();
			
		}
		
		/**
		 * @Private [openEvent]
		 * @param - [Event] 
		 * @return - [void]
		 * */
		private function openEvent(evt:Event):void
		{
			trace("url open event handler");
		}
		
		/**
		 * @Private [progressEvent]
		 * @param - [ProgressEvent] 
		 * @return - [void]
		 * */
		private function progressEvent(evt:ProgressEvent):void
		{
			trace("load progress event handler");
		}
		
		/**
		 * @Private [loadComplete handler]
		 * @param - [Event] 
		 * @return - [void]
		 * */
		private function loadComplete(evt:Event):void
		{
			removeListeners();
			var bitMap:Bitmap = Bitmap(evt.currentTarget.content);
			bitMap.smoothing = true;
			content = bitMap;
			_imgContainer.addChild(content);
			
		}
		
		/**
		 * @Private [clearLoader]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function clearLoader():void
		{
			loader.unloadAndStop();
			content = null;
			loader = null;
		}
		
		/**
		 * @Private [getLoader]
		 * @param - [NA] 
		 * @return - [available instance of Loader]
		 * */
		public function getLoader():Loader
		{
			return loader;
		}
	}
}
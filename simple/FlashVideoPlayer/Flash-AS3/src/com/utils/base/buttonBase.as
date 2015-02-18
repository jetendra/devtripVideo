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

package src.com.utils.base {

	import src.com.utils.interfaces.buttonInterface;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class buttonBase extends MovieClip implements buttonInterface {
		
		private var _elementArr : Array = [];
		
		/**
		 * Constructor : buttonBase
		 * @Constructor Initializes the object.
		 * */ 
		public function buttonBase() {
			//this.addEventListener(Event.ADDED_TO_STAGE, AddedHandler);
		}
		
		/**
		 * @init() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		protected function init() : void {
			initBaseProperties();
			this.addEventListener(Event.ADDED_TO_STAGE, AddedHandler);
		}
		
		/**
		 * @AddedHandler(evt) Event.ADDED_TO_STAGE Handler
		 * @param - [evt : Event] 
		 * @return - [NA]
		 * */
		private function AddedHandler(evt : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, AddedHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE,RemovedHandler);
			initBaseProperties();
			addEvents();
			loadHandler();
		}
		
		/**
		 * @RemovedHandler(evt) Event.REMOVED_FROM_STAGE Handler
		 * @param - [evt : Event] 
		 * @return - [NA]
		 * */
		private function RemovedHandler(evt : Event) : void {
			this.removeEventListener(Event.REMOVED_FROM_STAGE,RemovedHandler);
			unloadHandler();
			removeEvents();
			removeElement();
		}
		
		/**
		 * @addEvents() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function addEvents() : void {
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this.addEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		/**
		 * @removeEvents() definition
		 * @param - [NA]
		 * @return - [void]
		 * */
		private function removeEvents() : void {
			this.removeEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this.removeEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this.removeEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		/**
		 * @MouseDownHandler(evt) definition
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		protected function MouseDownHandler(evt : MouseEvent) : void {
		
		}
		
		/**
		 * @MouseUpHandler(evt) definition
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		protected function MouseUpHandler(evt : MouseEvent) : void {
			
		}
		
		/**
		 * @MouseClickHandler(evt) definition
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		protected function MouseClickHandler(evt : MouseEvent) : void {
			
		}
		
		/**
		 * @loadData() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		protected function loadData() : void {
			
		}
		
		/**
		 * @initBaseProperties() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		protected function initBaseProperties() : void {
			trace('here in initBaseProperties from base class');
		}
		
		/**
		 * @loadHandler() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		protected function loadHandler() : void {
			trace('here in load handler');
		}
		
		/**
		 * @unloadHandler() definition
		 * @param - [NA] 
		 * @return - [void]
		 * */
		protected function unloadHandler() : void {
			trace('here in unload handler');
			removeElement();
		}
		
		/**
		 * @addElement() definition
		 * @param - [MovieClip] 
		 * @return - [void]
		 * */
		protected function addElement(mc : *) : void {
			addChild(mc);
			_elementArr.push(mc);
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * Removed loaded / attached movie clip from the referenced symbol.
		 * */
		private function removeElement() : void {
			for (var i : String in _elementArr){
				removeChild(_elementArr[i]);
			}
		}
		
		/**
		 * @onPressHandler() definition
		 * @param - [NA] 
		 * @return - [NA]
		 * */
		public function onPressHandler() : void {
			setState('normal');
		}
		
		/**
		 * @setState() definition
		 * @param - [state string] 
		 * @return - [NA]
		 * */
		protected function setState(str : String) : void {
			this.gotoAndStop(str)
		}
	}
}
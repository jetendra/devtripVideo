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

package src.com{
	
	import flash.display.LoaderInfo;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import src.com.utils.base.uiBase;
	import src.com.utils.dataLoader;
	import src.com.vo.devtripVo;
	import src.com.ui.videoplayer;
	
	public class player extends uiBase {
		
		private var _dataLoader:dataLoader;
		private var _videoplayer : videoplayer;
		
		/**
		 * Constructor
		 * */
		public function player() {
			loadData();
		}
		
		/**
		 * @overriding base class method loadData
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function loadData() : void {
			var paramObj:Object = LoaderInfo(this.parent.loaderInfo).parameters;
			_dataLoader = new dataLoader();
			_dataLoader.instance.loadData(paramObj , dataLoadHandler);
		}
		
		/**
		 * @Private call back function on data load handler
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function dataLoadHandler() : void {
			init();
		}
		
		/**
		 * @overriding base class method initBaseProperties
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function initBaseProperties() : void {
			attachVideoUI();
			configureContextMenue();
		}
		
		/**
		 * @Private
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function attachVideoUI() : void {
			_videoplayer = new videoplayer();
			addElement(_videoplayer);
		}
		
		/**
		 * @Private
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function configureContextMenue() : void {
			var myMenu:ContextMenu = new ContextMenu();
			myMenu.hideBuiltInItems();
			var copyrightNotice:ContextMenuItem = new ContextMenuItem(devtripVo.instance.copyright.info);
			var mySiteLink:ContextMenuItem = new ContextMenuItem(devtripVo.instance.copyright.visitdata);
			mySiteLink.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, gotoMySite)
			myMenu.customItems.push(mySiteLink, copyrightNotice);
			contextMenu = myMenu;
			copyrightNotice.separatorBefore = true;
		}
		
		/**
		 * @Private
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function gotoMySite(evt:Event) : void {
			navigateToURL(new URLRequest(devtripVo.instance.copyright.visiturl),"_blank");
		}
	}//End of Class
}//End of Package

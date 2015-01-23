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

import src.com.vo.devtripVo;
import src.com.utils.base.uiBase;

class src.com.player extends uiBase {
	
	private static var _instance : player = null;
	
	/**
	 * Constructor [Singelton]
	 * */
	public function player(ui:MovieClip) {
		devtripVo.instance.ui = ui;
		init();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function initBaseProperties() : Void {
		super.initBaseProperties();
		attachVideoUI();
		configureContextMenue();
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function attachVideoUI() : Void {
		devtripVo.instance.ui.attachMovie("videoplayer","videoplayer",1);
		devtripVo.instance.ui.attached = true;
		addElement(devtripVo.instance.ui);
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function configureContextMenue() : Void {
		var myMenu:ContextMenu = new ContextMenu();
		myMenu.hideBuiltInItems();
		var copyrightNotice:ContextMenuItem = new ContextMenuItem(devtripVo.instance.copyright.info, deadClick);
		var mySiteLink:ContextMenuItem = new ContextMenuItem(devtripVo.instance.copyright.visitdata, gotoMySite);
		myMenu.customItems.push(mySiteLink, copyrightNotice);
		_root.menu = myMenu;
		copyrightNotice.separatorBefore = true;
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function deadClick() : Void {
	
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function gotoMySite() : Void {
		_root.getURL(devtripVo.instance.copyright.visiturl, "_top");
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function loadHandler() : Void {
		super.loadHandler();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function unloadHandler() : Void {
		super.unloadHandler();
	}
}
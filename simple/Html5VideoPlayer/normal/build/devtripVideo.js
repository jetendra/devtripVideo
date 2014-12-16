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
var assetsPath="assets/";function getSupport(a,b){var c=a.canPlayType(b);if("maybe"==c)return b;if(""==c)return""}function getExtension(a){ogg="video/ogg";webm="video/webm";var b=".dt";"video/mp4"==getSupport(a,"video/mp4")?b=".mp4":getSupport(a,webm)==webm?b=".webm":getSupport(a,ogg)==ogg&&(b=".ogg");return b}
function getMimeType(a){ogg="video/ogg";webm="video/webm";var b="video/dt";"video/mp4"==getSupport(a,"video/mp4")?b="video/mp4":getSupport(a,webm)==webm?b=webm:getSupport(a,ogg)==ogg&&(b=ogg);return b}
function errorHandler(a){switch(a.target.error.code){case a.target.error.MEDIA_ERR_ABORTED:alert("You aborted the video playback.");break;case a.target.error.MEDIA_ERR_NETWORK:alert("A network error caused the video download to fail part-way.");break;case a.target.error.MEDIA_ERR_DECODE:alert("The video playback was aborted due to a corruption problem or because the video used features your browser did not support.");break;case a.target.error.MEDIA_ERR_SRC_NOT_SUPPORTED:alert("The video could not be loaded, either because the server or network failed or because the format is not supported.");
break;default:alert("An unknown error occurred.")}}function addEvent(a,b,c){window.addEventListener?a.addEventListener(b,c,!1):document.attachEvent?a.attachEvent("on"+b,c):a["on"+b]=c}function removeEvent(a,b,c){window.removeEventListener?a.removeEventListener(b,c,!1):document.detachEvent?a.detachEvent("on"+b,c):a["on"+b]=null}function addEvents(a){a=document.getElementById(a);addEvent(a,"error",errorHandler)}
function removeEvents(a){a=document.getElementById(a);removeEvent(a,"error",errorHandler)}function init(){var a=document.getElementById(DT_containerId),b=document.createElement("video");b.id=DT_id;b.width=DT_width;b.height=DT_height;b.src=assetsPath+DT_video+getExtension(b);b.type=getMimeType(b);b.autoplay=DT_autoplay;b.controls=!0;b.muted=!0;b.poster=assetsPath+DT_videoImage;a.appendChild(b);addEvents(DT_id)}function dispose(a){removeEvents(a)};

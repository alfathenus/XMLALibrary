package com.xmlalibrary.rpc
{
	import com.xmlalibrary.utils.SOAPUtils;
	
	import mx.core.mx_internal;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.rpc.AsyncDispatcher;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.http.HTTPService;
	
	use namespace mx_internal;
	
	public class XMLAService extends HTTPService
	{
		//-----------------------------------
		// Constants
		//-----------------------------------
		/**
		 * TODO add documentation
		 */
		public const DISCOVER_SOAP_ACTION:String = '"urn:schemas-microsoft-com:xml-analysis:Discover"';
		/**
		 * TODO add documentation
		 */
		public const EXECUTE_SOAP_ACTION:String = '"urn:schemas-microsoft-com:xml-analysis:Execute"'; 
		private const ERROR_XMLA_FUNCTION_REQUIRED:String = "Client.XMLAFunctionRequired";
		
		//-----------------------------------
		// Variables
		//-----------------------------------
		/**
		 * Use soap action on the request.
		 */
		public var useSoapAction:Boolean;
		
		
		//-----------------------------------
		// Constructor
		//-----------------------------------
		/**
		 * Constructor
		 */
		public function XMLAService(rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
			this.initXMLAService();
			
		}
		
		//-----------------------------------
		// Getters and Setters
		//-----------------------------------
		/**
		 * @inheritDoc
		 */
		override public function set request(r:Object):void
		{
			super.request = r;
			this.setXMLAHeaders(r as XML);
		}
		
		override public function set method(m:String):void
		{
			//Do nothing
		}
		
		override public function set contentType(c:String):void
		{
			//Do nothing
		}
		
		override  public function set resultFormat(rf:String):void
		{
			//Do nothing
		}
		
		//-----------------------------------
		// Public methods
		//-----------------------------------
		/**
		 * @inheritDoc
		 */
		override public function send(parameters:Object = null):AsyncToken
		{
			if ( parameters != null ) {
				this.setXMLAHeaders(parameters as XML);
			}
			
			var data:XML = (parameters != null)?parameters as XML:this.request as XML;
			
			if ( !this.validateRequest(data) ) {
				var token:AsyncToken = new AsyncToken(null);
				//TODO: use resourceManager
				var msg:String = "XMLA Function not defined";//resourceManager.getString("rpc", "urlNotSpecified");
				var fault:Fault = new Fault(ERROR_XMLA_FUNCTION_REQUIRED, msg);
				var faultEvent:FaultEvent = FaultEvent.createEvent(fault, token);
				new AsyncDispatcher(this.dispatchRpcEvent, [faultEvent], 10);
				
				return token;
			}
			
			return super.send(SOAPUtils.getSoapXML(data) as Object);
		}
		
		
		//-----------------------------------
		// Private methods
		//-----------------------------------
		private function initXMLAService():void {
			super.method=HTTPRequestMessage.POST_METHOD;
			super.contentType=HTTPService.CONTENT_TYPE_XML;
			super.resultFormat=HTTPService.RESULT_FORMAT_E4X;
		}
		
		private function validateRequest(data:XML):Boolean {
			if ( data == null ) {
				return false;
			}
			if ( this.isDiscover(data) || this.isExecute(data) ) {
				return true;
			}
			
			return false;
		}
		
		private function setXMLAHeaders(data:XML):void {
			if ( this.isDiscover(data) ) {
				this.headers = this.getDiscoveryHeaders();
			}
			else if ( this.isExecute(data) ) {
				this.headers = this.getExecuteHeaders();
			}
			else {
				this.headers = null;
			}
		}
		
		private function isDiscover(data:XML):Boolean {
			if ( data != null && data is XML ) {
				var nodeName:String = data.name().toString();
				return nodeName != null && nodeName != "" && nodeName.indexOf("Discover") > -1;
			}
			return false;
		}
		
		private function isExecute(data:XML):Boolean {
			if ( data != null && data is XML ) {
				var nodeName:String = data.name().toString();
				return nodeName != null && nodeName != "" && nodeName.indexOf("Execute") > -1;
			}
			return false;
		}
		
		private function getDiscoveryHeaders():Object {
			var o:Object={};
			if ( this.useSoapAction ) {
				o["SOAPAction"]= DISCOVER_SOAP_ACTION;
			}
			o["Content-Type"]="text/xml";
			return o;
		}
		
		private function getExecuteHeaders():Object {
			var o:Object={};
			if ( this.useSoapAction ) {
				o["SOAPAction"]= EXECUTE_SOAP_ACTION;
			}
			o["Content-Type"]="text/xml";
			return o;
		}
	}
}

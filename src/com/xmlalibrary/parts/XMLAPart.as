package com.xmlalibrary.parts
{
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.interfaces.IXMLAPart;
	
	import flash.utils.Dictionary;
	
	/**
	 * Define a part of XMLA function.
	 * 
	 * @TODO code formatter
	 */
	public class XMLAPart implements IXMLAPart
	{
		//---------------------------------
		// Variables
		//---------------------------------
		private var _context:IXMLAContextPart;
		private var _propDic:Dictionary;
		private var _propertyCount:int;
		
		//---------------------------------
		// Constructor
		//---------------------------------
		/**
		 * Constructor
		 */
		public function XMLAPart()
		{
			this.initXMLAPart();
		}
		
		//---------------------------------
		// Getters and Setters
		//---------------------------------
		/**
		 * @inheritDoc
		 */
		public function get context():IXMLAContextPart 
		{
			return this._context;
		}
		public function set context(value:IXMLAContextPart):void 
		{
			this._context = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get propertiesCount():int {
			return this._propertyCount;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get propertyList():Dictionary {
			var dic:Dictionary = new Dictionary();
			var elem:String;
			for ( elem in this._propDic ) {
				dic[elem] = this._propDic[elem];
			}
			return dic;
		}
		
		//---------------------------------
		// Public methods
		//---------------------------------
		/**
		 * @inheritDoc
		 */
		public function add(name:String, value:String):void
		{
			if ( name == null || name == "" ) 
			{
				return;
			}
			if ( value == null || value == "" ) 
			{
				return;
			}
			if ( this.validate(name) ) 
			{
				if ( !this._propDic.hasOwnProperty(name) ) {
					this._propertyCount++;
				}
				this._propDic[name] = value;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function rem(name:String):void
		{
			if ( name == null || name == "" ) 
			{
				return;
			}
			if ( this._propDic && this._propDic.hasOwnProperty(name) ) 
			{
				this._propDic[name] = null;
				delete this._propDic[name];
				this._propertyCount--;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void
		{
			this._propDic = new Dictionary();
			this._propertyCount = 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():XML {
			if ( this._context == null ) {
				return new XML();
			}
			
			var template:XML = this._context.template();
			if ( template == null ) {
				return new XML();
			}
			
			//make a copy
			template = template.copy();
			
			var nodeDepth:int = this._context.nodeDepth;
			if ( isNaN(nodeDepth) ) {
				nodeDepth = 0;
			}
			var node:XML = template;
			try {
				for ( var i:int = 0; i < nodeDepth; i++){
					node = node.children()[0];
				}
			}
			catch (e:Error) {
				//for time out
				node = template;
			}
			
			if (node == null ) 
			{
				return template;
			}
			
			var elem:String;
			for (elem in this._propDic) 
			{
				node.appendChild(new XML("<" + elem + ">" + this._propDic[elem] + "</" + elem + ">"));
			}
			
			if ( !this.context.useRootNode() ) {
				if ( template != null && template.children() != null && template.children().length() > 0 ) {
					template = template.children()[0];
				}
			}
			return template;
		}
		
		//---------------------------------
		// Private methods
		//---------------------------------
		private function initXMLAPart():void {
			this._propDic = new Dictionary();
			this._propertyCount = 0;
		}
		
		private function validate(name:String):Boolean {
			if (name == null || name == "") {
				return false;
			}
			if ( this._context == null) {
				return true;
			}
			return this._context.validate(name); 
		}
	}
}
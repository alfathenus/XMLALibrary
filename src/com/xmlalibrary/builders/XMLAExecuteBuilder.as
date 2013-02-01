package com.xmlalibrary.builders
{
	import com.xmlalibrary.context.commands.StatementCommandContext;
	import com.xmlalibrary.interfaces.IXMLACommandPart;
	import com.xmlalibrary.interfaces.IXMLAExecuteBuilder;
	import com.xmlalibrary.interfaces.IXMLAPropertyPart;

	public class XMLAExecuteBuilder implements IXMLAExecuteBuilder
	{
		//------------------------------------
		// Variables
		//------------------------------------
		private var _propertyPart:IXMLAPropertyPart;
		private var _commandPart:IXMLACommandPart;
		
		//------------------------------------
		// Constructor
		//------------------------------------
		/**
		 * Constructor
		 */
		public function XMLAExecuteBuilder()
		{
		}
		
		//------------------------------------
		// Public methods
		//------------------------------------
		/**
		 * @inheritDoc
		 */
		public function setPropertiesPart(part:IXMLAPropertyPart):void {
			this._propertyPart = part;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setCommandPart(part:IXMLACommandPart):void {
			this._commandPart = part;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addProperty(name:String, value:String):void {
			if ( this._propertyPart != null ) {
				this._propertyPart.add(name, value);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addCommand(name:String, value:String):void {
			if ( this._commandPart != null ) {
				this._commandPart.add(name, value);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():XML {
			var execute:XML=<Execute xmlns="urn:schemas-microsoft-com:xml-analysis"></Execute>;
			
			if ( this._commandPart != null ) {
				execute.appendChild(this._commandPart.generate());
			}
			
			if ( this._propertyPart != null ) {
				execute.appendChild(this._propertyPart.generate());
			}
			
			return execute;
		}
	}
}
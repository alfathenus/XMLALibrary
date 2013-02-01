package com.xmlalibrary.parts
{
	import com.xmlalibrary.context.commands.StatementCommandContext;
	import com.xmlalibrary.interfaces.IXMLACommandPart;

	public class XMLACommandPart extends XMLAPart implements IXMLACommandPart
	{
		//-------------------------------
		// Constructor
		//-------------------------------
		/**
		 * Constructor
		 */
		public function XMLACommandPart()
		{
			super();
			this.initXMLACommandPart();
		}
		
		//-------------------------------
		// Private methods
		//-------------------------------
		private function initXMLACommandPart():void {
			this.context = new StatementCommandContext();
		}
	}
}
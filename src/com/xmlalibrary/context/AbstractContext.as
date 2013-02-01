package com.xmlalibrary.context
{
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	
	import flash.errors.IllegalOperationError;

	public class AbstractContext implements IXMLAContextPart
	{
		//-------------------------------------
		// Constructor
		//-------------------------------------
		/**
		 * Constructor
		 */
		public function AbstractContext()
		{
			if(Object(this).constructor === AbstractContext) {
				throw new IllegalOperationError("AbstractContext must not be directly instantiated");
			}
		}
		
		//-------------------------------------
		// Getters and Setters
		//-------------------------------------
		/**
		 * @inheritDoc
		 */
		public function get nodeDepth():int {
			return 1;
		}
		
		/**
		 * @inheritDoc
		 */
		public function useRootNode():Boolean {
			return true;
		}
		
		//-------------------------------------
		// Public methods
		//-------------------------------------
		/**
		 * @inheritDoc
		 */
		public function acceptProperties():Array {
			return [];
		}
		
		/**
		 * @inheritDoc
		 */
		public function template():XML
		{
			return <root><PropertyList></PropertyList></root>;
		}
		
		/**
		 * @inheritDoc
		 */
		public function validate(name:String):Boolean {
			if ( name == null || name == "" ) {
				return false;
			}
			if ( this.acceptProperties() == null || this.acceptProperties().length == 0 ) {
				return true;
			}
			return this.acceptProperties().indexOf(name) > -1;
		}
	}
}
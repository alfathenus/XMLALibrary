package com.xmlalibrary.context.discovertype
{
	import com.xmlalibrary.context.AbstractContext;
	
	/**
	 * Define the values that can be accept the discover type
	 */
	public class DiscoverTypeContext extends AbstractContext
	{
		//-------------------------------------------
		// Constant
		//-------------------------------------------
		/**
		 * @TODO documentar
		 */
		static public const REQUEST_TYPE:String = "RequestType";
		
		//----------------------------------
		// Constructor
		//----------------------------------
		/**
		 * Constructor
		 */
		public function DiscoverTypeContext()
		{
			super();
		}
		
		//-------------------------------------
		// Getters and Setters
		//-------------------------------------
		/**
		 * @inheritDoc
		 */
		override public function get nodeDepth():int {
			return 0;
		}
		/**
		 * @inheritDoc
		 */
		override public function useRootNode():Boolean {
			return false;
		}
		//----------------------------------
		// Public methods
		//----------------------------------
		/**
		 * @inheritDoc
		 */
		override public function template():XML
		{
			return <root></root>;
		}
		/**
		 * @inheritDoc
		 */
		override public function acceptProperties():Array {
			return [REQUEST_TYPE];
		}
	}
}
package com.xmlalibrary.context
{
	public class BaseCommandContext extends AbstractContext
	{
		//----------------------------------
		// Constructor
		//----------------------------------
		/**
		 * Constructor
		 */
		public function BaseCommandContext()
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
		
		//----------------------------------
		// Public methods
		//----------------------------------
		/**
		 * @inheritDoc
		 */
		override public function template():XML
		{
			return <Command></Command>;
		}
	}
}
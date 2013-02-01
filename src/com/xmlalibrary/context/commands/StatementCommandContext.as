package com.xmlalibrary.context.commands
{
	import com.xmlalibrary.context.BaseCommandContext;

	public class StatementCommandContext extends BaseCommandContext
	{
		//-------------------------------------------
		// Constant
		//-------------------------------------------
		/**
		 * @TODO documentar
		 */
		static public const STATEMENT:String = "Statement";
		
		//----------------------------------
		// Constructor
		//----------------------------------
		/**
		 * Constructor
		 */
		public function StatementCommandContext()
		{
			super();
		}
		
		//----------------------------------
		// Public methods
		//----------------------------------
		/**
		 * @inheritDoc
		 */

		override public function acceptProperties():Array {
			return [STATEMENT];
		}
	}
}
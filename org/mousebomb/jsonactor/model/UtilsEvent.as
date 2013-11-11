package org.mousebomb.jsonactor.model
{
	import flash.events.Event;

	/**
	 * @author Mousebomb
	 */
	public class UtilsEvent extends Event
	{
		/** 对时完成 */
		public static const TIME_VALIDATED : String = "TIME_VALIDATED";
		/** 错误列表获得 */
		public static const ERROR_LIST_UPDATED : String = "ERROR_LIST_UPDATED";
		
		public function UtilsEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

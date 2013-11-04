package org.mousebomb.jsonactor.gateway
{
	import org.mousebomb.utils.LogWriter;

	import flash.events.Event;

	/**
	 * @author Mousebomb
	 */
	public class ActorReadyEvent extends Event
	{
		/** 
		 *  Actor准备完毕 可以用来调用网关
		 */
		public static const ACTOR_READY : String = "ACTOR_READY";

		public function ActorReadyEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			LogWriter.log("Event:"+type );
		}
	}
}

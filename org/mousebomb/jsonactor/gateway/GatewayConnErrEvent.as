package org.mousebomb.jsonactor.gateway
{
	import org.mousebomb.utils.LogWriter;

	import flash.events.Event;

	/**
	 * 底层通信错误
	 * @author mousebomb mousebomb@gmail.com
	 * created: 2012-10-17 
	 * last modified: 2012-10-17
	 */
	public class GatewayConnErrEvent extends Event
	{
		/** 底层通信错误 */
		public static const GATEWAY_CONN_ERR : String = "GATEWAY_CONN_ERR";
		public var faultString : String;

		public function GatewayConnErrEvent(type : String, faultString_ : String)
		{
			super(type);
			this.faultString = faultString_;
			LogWriter.log("Event:" + type + " fault=" + faultString_);
		}
	}
}

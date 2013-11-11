package org.mousebomb.jsonactor.command
{
	import org.mousebomb.jsonactor.gateway.ActorReadyEvent;
	import org.mousebomb.jsonactor.model.UtilsEvent;
	import org.robotlegs.mvcs.Command;

	/**
	 * 检查是否就绪
	 * @author Mousebomb
	 */
	public class CheckReadyCmd extends Command
	{
		[Inject]
		public var e : UtilsEvent;

		public function CheckReadyCmd()
		{
		}

		private static var ready : int = 0;

		override public function execute() : void
		{
			switch(e.type)
			{
				case UtilsEvent.ERROR_LIST_UPDATED:
					ready++;
				commandMap.unmapEvent(UtilsEvent.ERROR_LIST_UPDATED, CheckReadyCmd);
					break;
				case UtilsEvent.TIME_VALIDATED:
					ready++;
				commandMap.unmapEvent(UtilsEvent.TIME_VALIDATED, CheckReadyCmd);
					break;
				default:
					break;
			}
			if (ready == 2)
			{
				dispatch(new ActorReadyEvent(ActorReadyEvent.ACTOR_READY));
			}
		}
	}
}

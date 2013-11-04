package org.mousebomb.jsonactor.command
{
	import org.mousebomb.jsonactor.model.TimeModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Mousebomb
	 */
	public class ValidateTimeCmd extends Command
	{
		public function ValidateTimeCmd()
		{
		}

		[Inject]
		public var timeModel : TimeModel;

		override public function execute() : void
		{
			timeModel.validTime();
		}
	}
}

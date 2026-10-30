package ar.edu.unlp.info.oo1.jobScheduler;

public class PriorityJobScheduler extends JobScheduler {
	@Override
	public JobDescription jobToSchedule() {
		return jobs.stream().max((j1, j2) -> Double.compare(j1.getPriority(), j2.getPriority())).orElse(null);
	}
}

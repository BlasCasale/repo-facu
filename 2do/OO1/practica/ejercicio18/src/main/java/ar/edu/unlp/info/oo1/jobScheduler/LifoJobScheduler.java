package ar.edu.unlp.info.oo1.jobScheduler;

public class LifoJobScheduler extends JobScheduler {
	@Override
	public JobDescription jobToSchedule() {
		return jobs.get(jobs.size() - 1);
	}
}

package ar.edu.unlp.info.oo1.jobScheduler;

public class FifoScheduler extends JobScheduler {
	@Override
	public JobDescription jobToSchedule() {
		return jobs.get(0);
	}

}

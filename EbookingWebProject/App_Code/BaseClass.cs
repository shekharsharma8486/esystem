using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BaseClass
/// </summary>
public class BaseClass
{
	public BaseClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> GetTimeIntervals()
    {
        List<string> timeIntervals = new List<string>();
        TimeSpan startTime = new TimeSpan(0, 0, 0);
        DateTime startDate = new DateTime(DateTime.MinValue.Ticks); // Date to be used to get shortTime format.
        for (int i = 0; i < 48; i++)
        {
            int minutesToBeAdded = 30 * i;      // Increasing minutes by 30 minutes interval
            TimeSpan timeToBeAdded = new TimeSpan(0, minutesToBeAdded, 0);
            TimeSpan t = startTime.Add(timeToBeAdded);
            DateTime result = startDate + t;
            timeIntervals.Add(result.ToShortTimeString());      // Use Date.ToShortTimeString() method to get the desired format                
        } 

        return timeIntervals;
    }
}
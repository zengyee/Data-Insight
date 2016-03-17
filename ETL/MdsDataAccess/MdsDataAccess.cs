namespace MdsDataAccessClientLib
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading;
    using Microsoft.Cis.Monitoring.DataAccess;
    using Microsoft.Cis.Monitoring.Mds.mdscommon;
    using Microsoft.Cis.Monitoring.Mds.MdsStorageClient;
    using Microsoft.Cis.Monitoring.Mds.Subscription;
    using Microsoft.Cis.Monitoring.Mds.MdsActiveClient;
    using System.Data.SqlClient;
    using System.Data;

    class MdsDataAccess
    {
        //static string tableName = "FaCounterFiveMinuteNode";
        //static string tableRegExpr = "FaCounterFiveMinuteNode*";
        //static DateTimeOffset startTime = Convert.ToDateTime("9/25/2015 1:20:33 PM -07:00");
        //static DateTimeOffset endTime = Convert.ToDateTime("9/25/2015 1:25:33 PM -07:00");

        static string queryString = "(CounterName.Equals(\"\\Hyper-V Hypervisor Logical Processor(_Total)\\% Total Run Time\") || CounterName.Equals(\"\\Memory\\Available Mbytes\") ||CounterName.Equals(\"\\PhysicalDisk(_Total)\\Avg. Disk sec/Write\") ||CounterName.Equals(\"\\PhysicalDisk(_Total)\\Avg. Disk sec/Read\") || CounterName.Equals(\"\\LogicalDisk(*)\\MIN APP % Free Space\")) && (DataCenter.Contains(\"SH\") || DataCenter.Contains(\"BJB\") || DataCenter.Contains(\"OS\"))";
        //static int maxRetry = 6;

        #region Synchronous GetTabularData API sample
        //static void FetechDataUsingSyncApi()
        //{
        //    // Intialization of the MdsDataAccessClient
        //    string mdsEndPoint = "https://monitoring.core.chinacloudapi.cn";
        //    MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

        //    int retryNum = 0;
        //    int counter = 0;

        //    while (retryNum < maxRetry)
        //    {
        //        try
        //        {
        //            //Fetching data using the MdaDataAccessClient
        //            IEnumerable<GenericLogicEntity> gles = mdsDataAccessClient.GetTabularData(tableName, startTime, endTime, queryString, false);

        //            counter = 0;
        //            foreach (GenericLogicEntity gle in gles)
        //            {
        //                counter++;
        //            }

        //            Console.WriteLine(
        //                "FetechDataUsingSyncApi : Table = {0}, StartTime ={1}, EndTime = {2}, QueryString = {3}, UseIndex = true : Found {4} rows \n",
        //                tableName, startTime, endTime, queryString, counter);
        //            break;
        //        }
        //        catch (Exception e)
        //        {
        //            Console.Write(e.ToString());
        //            Console.WriteLine("counter = " + counter);
        //            System.Threading.Thread.Sleep(5000);
        //            retryNum++;
        //        }
        //    }
        //}
        #endregion

        //#region Asynchronous APIs Sample
        //static void FetechDataUsingAsyncApi()
        //{
        //    string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
        //    MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

        //    int retryNum = 0, counter = 0;

        //    while (retryNum < maxRetry)
        //    {
        //        try
        //        {
        //            counter = 0;
        //            IAsyncResult asyncResult = mdsDataAccessClient.BeginGetTabularData(tableName, startTime, endTime, queryString, false);

        //            IEnumerable<GenericLogicEntity> gles = mdsDataAccessClient.EndGetTabularData(asyncResult);
        //            foreach (GenericLogicEntity gle in gles)
        //            {
        //                counter++;
        //            }
        //            Console.WriteLine(
        //                "FetechDataUsingAsyncApi : Table = {0}, StartTime ={1}, EndTime = {2}, QueryString = {3}, UseIndex = false : Found {4} rows \n",
        //                tableName, startTime, endTime, queryString, counter);
        //            break;
        //        }
        //        catch (Exception e)
        //        {
        //            Console.Write(e.ToString());
        //            Console.WriteLine("counter = " + counter);
        //            System.Threading.Thread.Sleep(5000);
        //            retryNum++;
        //        }

        //    }
        //}
        //#endregion
        //#region Asynchronous API with callback sample
        //static void MyAsyncCallBack(IAsyncResult result)
        //{
        //    Console.WriteLine("MyAsyncCallBack begin : ThreadId = {0} ", Thread.CurrentThread.ManagedThreadId);
        //    IEnumerable<GenericLogicEntity> gles;

        //    MdsDataAccessClient dataAccessClient = result.AsyncState as MdsDataAccessClient;
        //    gles = dataAccessClient.EndGetTabularData(result);

        //    int numRows = 0;
        //    foreach (GenericLogicEntity gle in gles)
        //    {
        //        string tableName = gle["SourceTableName"] as string;
        //        if (tableName == "MdsAuditEventEtwTableVer9v0")
        //        {
        //            numRows++;
        //        }
        //    }

        //    Console.WriteLine("MyAsyncCallBack end : Fetched {0} rows \n", numRows);
        //}

        //public static void FetechDataUsingAsyncApiWithCallback()
        //{
        //    string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
        //    MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

        //    int retryNum = 0;

        //    while (retryNum < maxRetry)
        //    {
        //        try
        //        {
        //            IAsyncResult asyncResult = mdsDataAccessClient.BeginGetTabularData(tableName, startTime, endTime, queryString, false, null, MyAsyncCallBack, mdsDataAccessClient);

        //            while (!asyncResult.IsCompleted)
        //            {
        //                Thread.Sleep(100);
        //            }
        //            break;
        //        }
        //        catch (Exception e)
        //        {
        //            Console.Write(e.ToString());
        //            System.Threading.Thread.Sleep(5000);
        //            retryNum++;
        //        }
        //    }
        //}
        //#endregion

        //#region Fetch data from multiple tables
        //static void FetchDataFromMultipleTables()
        //{
        //    string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
        //    MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

        //    int retryNum = 0;
        //    int counter = 0;

        //    while (retryNum < maxRetry)
        //    {
        //        try
        //        {
        //            IEnumerable<GenericLogicEntity> gles = mdsDataAccessClient.GetTabularData(tableRegExpr, 2, startTime, endTime, queryString, true);

        //            counter = 0;
        //            foreach (GenericLogicEntity gle in gles)
        //            {
        //                counter++;
        //            }

        //            Console.WriteLine(
        //                "FetchDataFromMultipleTables : Table = {0}, nLatestVersion= {1}, StartTime ={2}, EndTime = {3}, QueryString = {4}, UseIndex = true : Found {5} rows \n",
        //                tableName, 2, startTime, endTime, queryString, counter);
        //            break;
        //        }
        //        catch (Exception e)
        //        {
        //            Console.Write(e.ToString());
        //            Console.WriteLine("counter = " + counter);
        //            System.Threading.Thread.Sleep(5000);
        //            retryNum++;
        //        }
        //    }

        //}
        //#endregion

        //#region Fetching data for specific MDS table partitions
        //static void FetchDataInSpecificMdsParititions()
        //{
        //    string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
        //    MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

        //    int retryNum = 0;
        //    int totalNum = 0, counter = 0;

        //    int numPartitions = 100;

        //    for (int paritionIndex = 0; paritionIndex < numPartitions; paritionIndex++)
        //    {
        //        while (retryNum < maxRetry)
        //        {
        //            try
        //            {
        //                Console.Write("FetchDataInSpecificMdsParititions : getting data from partition {0}", paritionIndex);

        //                IEnumerable<GenericLogicEntity> gles = mdsDataAccessClient.GetTabularData(tableName, startTime, endTime, queryString, false, paritionIndex);

        //                counter = 0;
        //                foreach (GenericLogicEntity gle in gles)
        //                {
        //                    counter++;
        //                }

        //                Console.WriteLine(" --  {0} rows", counter);

        //                totalNum += counter;
        //                break;
        //            }
        //            catch (Exception e)
        //            {
        //                Console.Write(e.ToString());
        //                counter = 0;
        //                System.Threading.Thread.Sleep(5000);
        //                retryNum++;
        //            }
        //        }
        //    }

        //    Console.WriteLine(
        //        "FetchDataInSpecificMdsParititions : Table = {0}, StartTime ={1}, EndTime = {2}, QueryString = {3}, UseIndex = false : Found {4} rows \n",
        //        tableName, startTime, endTime, queryString, totalNum);
        //}
        //#endregion

        #region Get MDS table names using GetTables API
        static void GetMdsTables()
        {
            string mdsTableNameRegExp = "MdsAudit.*";
            int nLatestVersions = 3;
            string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
            MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

            IEnumerable<string> tables = mdsDataAccessClient.GetTables(mdsTableNameRegExp, nLatestVersions);

            Console.WriteLine("Found {0} tables : ", tables.Count());
            foreach (string tn in tables)
            {
                Console.WriteLine(tn);
            }
            Console.WriteLine();
        }
        #endregion 

        #region Get MDS table names usng BeginGetTables/EndGetTables async API
        static void GetMdsTablesAsync()
        {
            string mdsTableNameRegExp = "MdsAudit.*";
            int nLatestVersions = 3;
            string mdsEndPoint = "https://test1.diagnostics.monitoring.core.windows.net";
            MdsDataAccessClient mdsDataAccessClient = new MdsDataAccessClient(mdsEndPoint);

            IAsyncResult asyncResult = mdsDataAccessClient.BeginGetTables(mdsTableNameRegExp, nLatestVersions);
            IEnumerable<string> tables = mdsDataAccessClient.EndGetTables(asyncResult);

            Console.WriteLine("Found {0} tables : ", tables.Count());
            foreach (string tn in tables)
            {
                Console.WriteLine(tn);
            }
            Console.WriteLine();
        }
        #endregion 

        static void Main(string[] args)
        {

            //FetechDataUsingSyncApi();
            //FaCounterFiveMinuteNodeTableBJBVer22v0

            DateTimeOffset StartTime;

            if (string.IsNullOrEmpty(Properties.Settings.Default.StartTime))
            {
                StartTime = GetMaxTimeStamp();
            }
            else
            {
                StartTime = Convert.ToDateTime(Properties.Settings.Default.StartTime);
            }

            DateTimeOffset EndTime;
            if (string.IsNullOrEmpty(Properties.Settings.Default.EndTime))
            {
                EndTime = DateTime.UtcNow;
            }
            else
            {
                EndTime = Convert.ToDateTime(Properties.Settings.Default.EndTime);
            }

            MdsQueryTableRegExpr q = new MdsQueryTableRegExpr();
            while (StartTime < EndTime)
            {
                Console.WriteLine("Fetching data From: " + StartTime.ToString());
                IEnumerable<GenericLogicEntity> gles = q.ExecuteQuery(queryString, StartTime);
                if (gles != null)
                {
                    q.InsertTable(gles);
                }

                StartTime = StartTime.AddMinutes(Properties.Settings.Default.IntervalInMinutes);

            }
            //Console.WriteLine("2. Fetching data using MdsDataAccessClient.BeginGetTabularData/EndGetTabularData");
            //FetechDataUsingAsyncApi();

            //Console.WriteLine("3. Fetching data using MdsDataAccessClient.BeginGetTabularData wtih Async callback");
            //FetechDataUsingAsyncApiWithCallback();

            //Console.WriteLine("4. Fetching data from multiple tables using MdsDataAccessClient.BeginGetTabularData by using regex as table name");
            //FetchDataFromMultipleTables();

            //Console.WriteLine("5. Fetching data from given specific MDS paritions");
            //FetchDataInSpecificMdsParititions();

            //Console.WriteLine("6. Fetching MDS tables that matches the reg expression using MdsDataAccessClient.GetTables");
            //GetMdsTables();

            //Console.WriteLine("7. Fetching MDS tables that matches the reg expression using MdsDataAccessClient.BeginGetTables/EndGetTables");
            //GetMdsTablesAsync();
        }

        public static DateTimeOffset GetMaxTimeStamp()
        {
            DateTimeOffset maxTimeStamp;
            SqlConnection destConnection = new SqlConnection(Properties.Settings.Default.DestConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SELECT Max([TIMESTAMP]) AS MaxTimeStamp FROM " + Properties.Settings.Default.DestTableName;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = destConnection;

            destConnection.Open();

            object maxTS = cmd.ExecuteScalar();
            maxTimeStamp = DateTime.SpecifyKind((DateTime)maxTS, DateTimeKind.Utc);

            destConnection.Close();

            return maxTimeStamp.AddSeconds(1);
        }
    }
}

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

namespace MdsDataAccessClientLib
{
    public class MdsQueryTableRegExpr
    {
        private string tableRegExpr;
        //private DateTimeOffset startTime;// = Convert.ToDateTime("9/25/2015 1:20:33 PM -07:00"); 
        private int intervalMinutes;
        private MdsDataAccessClient mdsDataAccessClient;
        private SqlConnection destConnection;
        //private DateTimeOffset StartTime;

        public MdsQueryTableRegExpr()
        {
            this.tableRegExpr = Properties.Settings.Default.TableNameRegExpr;
            //this.startTime = StartTime;
            this.intervalMinutes = Properties.Settings.Default.IntervalInMinutes; ;
            this.mdsDataAccessClient = new MdsDataAccessClient(Properties.Settings.Default.MdsEndPoint);
            this.destConnection = new SqlConnection(Properties.Settings.Default.DestConnectionString);
        }


        public IEnumerable<GenericLogicEntity> ExecuteQuery(string QueryString, DateTimeOffset StartTime)
        {

            int retryNum = 0;
            IEnumerable<GenericLogicEntity> gles = null;

            //"TIMESTAMP"
            //"DataCenter"
            //"Cluster"
            //"NodeIdentity"
            //"CounterName"
            //"SampleCount"
            //"CounterValue"
            //"RowKey"
            //"SourceTableName"

            while (retryNum < Properties.Settings.Default.MaxRetry)
            {
                try
                {
                    Console.WriteLine("{0}:Start Query MDS : StartTime ={1} \n", DateTime.Now, StartTime);
                    //IEnumerable<string> tables = mdsDataAccessClient.GetTables(this.tableRegExpr, 2);
                    //Fetching data using the MdaDataAccessClient
                    gles = mdsDataAccessClient.GetTabularData(this.tableRegExpr, 2, StartTime, StartTime.AddMinutes(this.intervalMinutes).AddSeconds(-1), QueryString, false);
                    if (gles != null || gles.Count<GenericLogicEntity>()>0)
                    {
                        foreach (GenericLogicEntity gle in gles)
                        {
                            DateTime dt = (DateTime)gle.TryGetValue("TIMESTAMP");
                            gle.TryGetValue("DataCenter");
                            gle.TryGetValue("Cluster");
                            gle.TryGetValue("NodeIdentity");
                            gle.TryGetValue("CounterName");
                            gle.TryGetValue("SampleCount");
                            gle.TryGetValue("CounterValue");
                            gle.TryGetValue("RowKey");
                            gle.TryGetValue("SourceTableName");
                        }

                        Console.WriteLine(
                            "{0}:FetechDataUsingSyncApi : StartTime ={1}: Found {2} rows \n",
                            DateTime.Now, StartTime, gles.Count<GenericLogicEntity>());
                    }
                    else
                    {
                        Console.WriteLine(
                            "{0}:FetechDataUsingSyncApi : StartTime ={1}: Found 0 rows \n",
                            DateTime.Now, StartTime);
                        gles = null;
                    }
                    break;
                }
                catch (Exception e)
                {
                    Console.Write(e.ToString());
                    System.Threading.Thread.Sleep(5000);
                    retryNum++;
                    gles = null;
                }
            }

            return gles;

        }

        public void InsertTable(IEnumerable<GenericLogicEntity> gles)
        {

            string stmt = "INSERT INTO " + Properties.Settings.Default.DestTableName 
                + "([TIMESTAMP],[DataCenter],[Cluster],[NodeIdentity],[CounterName],[SampleCount],[CounterValue],[RowKey],[SourceTableName]) VALUES " 
                + "(@TIMESTAMP,@DataCenter,@Cluster,@NodeIdentity,@CounterName,@SampleCount,@CounterValue,@RowKey,@SourceTableName)";

            this.destConnection.Open();
            SqlCommand cmd = new SqlCommand(stmt, this.destConnection);

            cmd.Parameters.Add("@TIMESTAMP", SqlDbType.DateTime);
            cmd.Parameters.Add("@DataCenter", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@Cluster", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@NodeIdentity", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@CounterName", SqlDbType.VarChar, 255);
            cmd.Parameters.Add("@SampleCount", SqlDbType.Int);
            cmd.Parameters.Add("@CounterValue", SqlDbType.Float);
            cmd.Parameters.Add("@RowKey", SqlDbType.VarChar, 255);
            cmd.Parameters.Add("@SourceTableName", SqlDbType.VarChar, 255);



            int i = 1;
            int total = gles.Count<GenericLogicEntity>();
            //Insert each rows
            foreach (GenericLogicEntity gle in gles)
            {
                cmd.Parameters["@TIMESTAMP"].Value = (DateTime)gle.TryGetValue("TIMESTAMP");
                cmd.Parameters["@DataCenter"].Value = gle.TryGetValue("DataCenter");
                cmd.Parameters["@Cluster"].Value = gle.TryGetValue("Cluster");
                cmd.Parameters["@NodeIdentity"].Value = gle.TryGetValue("NodeIdentity");
                cmd.Parameters["@CounterName"].Value = gle.TryGetValue("CounterName");
                cmd.Parameters["@SampleCount"].Value = gle.TryGetValue("SampleCount");
                cmd.Parameters["@CounterValue"].Value = gle.TryGetValue("CounterValue");
                cmd.Parameters["@RowKey"].Value = "";
                cmd.Parameters["@SourceTableName"].Value = gle.TryGetValue("SourceTableName");

                cmd.ExecuteNonQuery();
                if (i % 100 == 0)
                {
                    Console.Write("\r{0}/{1}", i, total);
                }
                
                i++;
            }

            Console.WriteLine("{0}:Inserted into Database\n", DateTime.Now);
            this.destConnection.Close();
        }

    }
}
